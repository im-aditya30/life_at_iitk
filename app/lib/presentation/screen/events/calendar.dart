import 'dart:collection';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:intl/intl.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/infrastructure/core/injectionable_module.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/functions.dart';
import 'package:life_at_iitk/presentation/core/reminders_notfs.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';
import 'package:life_at_iitk/presentation/routes/router.gr.dart';
import 'package:table_calendar/table_calendar.dart';

final Map<DateTime, List> _holidays = {
  // DateTime(2020, 1, 1): [Posts(title: 'New Year\'s Day')],
  // DateTime(2020, 1, 6): [Posts(title: 'Epiphany')],
  // DateTime(2020, 10, 14): [Posts(title: 'Valentine\'s Day')],
  DateTime(2020, 10, 21): [Post(title: 'Easter Sunday')],
  // DateTime(2020, 10, 22): [Posts(title: 'Easter Monday')],
};

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with TickerProviderStateMixin {
  late Map<DateTime, List<Post>> _events;
  late List<Post> _selectedEvents;
  List<Post>? _selectedDayHolidays;
  late AnimationController _animationController;
  DateTime _focusedDay = DateTime.now().sliceTime;
  // late CalendarController _calendarController;
  DateTime _selectedDay = DateTime.now().sliceTime;
  final DateTime _today = DateTime.now().sliceTime;
  @override
  void initState() {
    super.initState();
    _events = {};
    // _calendarController = CalendarController();

    _selectedDay =
        DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, day)) {
      setState(() {
        _focusedDay = focusedDay;
        _selectedDay = day.sliceTime;
        // _selectedEvents = _events[day.sliceTime]??[];
        // _selectedDayHolidays = _holidays[_selectedDay]?.cast<Post>();
      });
    }
    // _selectedDay = DateTime(day.year,day.month,day.day);
    // print(_events);
    // setState(() {
    //   _selectedDayHolidays = _holidays[_selectedDay]?.cast<Post>();
    //   _selectedEvents = _events[DateTime(day.year,day.month,day.day)]??[];
    // });
  }

  // ignore: avoid_void_async
  void _onVisibleDaysChanged(DateTime focusedDay) async {
    final DateTime _finalDate = DateTime(focusedDay.year, focusedDay.month,
        noOfDaysInMonths(focusedDay.month, focusedDay.year));
    _events = await getIt<PostDBInterface>().getAllPostBetweenDate(
        DateTime(focusedDay.year, focusedDay.month), _finalDate);
    print('$_events $_finalDate $focusedDay');
    setState(() {});
  }

  // ignore: avoid_void_async
  void _onCalendarCreated() async {
    final DateTime _today = DateTime.now().sliceTime;
    final DateTime firstDayOFMonth = DateTime(_today.year, _today.month);
    final DateTime _lastDate = firstDayOFMonth
        .add(Duration(days: noOfDaysInMonths(_today.month, _today.year)));
    _events = await getIt<PostDBInterface>()
        .getAllPostBetweenDate(firstDayOFMonth, _lastDate);
    // print(_events);
    setState(() {
      _selectedDayHolidays = _holidays[_selectedDay]?.cast<Post>();
      _selectedEvents = _events[_selectedDay.sliceTime] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: "Schedule",
        body: Column(
          children: <Widget>[
            Container(
              child: _buildTableCalendar(context),
            ),
            const Divider(),
            Expanded(child: _buildEvents()),
          ],
        ));
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar(BuildContext context) {
    final _year = DateTime.now().year;
    // final _focusedDay = DateTime.now();
    return TableCalendar(
      firstDay: DateTime.utc(_year - 20),
      lastDay: DateTime.utc(_year + 20, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: CalendarFormat.month,
      // calendar: _calendarController,
      eventLoader: (day) => _events[day.sliceTime] ?? [],
      holidayPredicate: (day) => _holidays.containsKey(day.sliceTime),
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
					markerDecoration: BoxDecoration(
              color: CustomColors(context).iconColor),
          selectedDecoration: BoxDecoration(
              color: CustomColors(context).accentColor, shape: BoxShape.circle),
          todayDecoration: BoxDecoration(
              color: CustomColors(context).primaryColor,
              shape: BoxShape.circle),
          holidayTextStyle: const TextStyle()
              .copyWith(color: Colors.red, fontWeight: FontWeight.w900),
          weekendTextStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.black45)),
      // ignore: void_checks

      onHeaderTapped: (date) async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            final height = MediaQuery.of(context).size.height * 0.4;
            DateTime newDate = date;
            return Material(
              child: Container(
                height: height + 60,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        height: 60,
                        child: ButtonBar(
                          mainAxisSize: MainAxisSize.max,
                          alignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel',
																style: TextStyle(fontSize: 20),),
                            ),
                            TextButton(
                              onPressed: () async {
                                if (newDate.month != date.month) {
                                  // ignore: unnecessary_await_in_return
                                  _events = await getIt<PostDBInterface>()
                                      .getAllPostBetweenDate(
                                          newDate,
                                          newDate.add(Duration(
                                              days: noOfDaysInMonths(
                                                      newDate.month,
                                                      newDate.year) -
                                                  1)))
                                      .catchError((onError) {
                                    // print(onError);
                                    return {};
                                  });
                                }
																
																	_focusedDay = newDate;
																	setState(() {});
																	Navigator.pop(context);
                              },
                              child: const Text('Done',
																style: TextStyle(fontSize: 20),),
                            ),
                          ],
                        )),
                    Container(
                      height: height,
                      child: Theme(
												data: ThemeData().copyWith(
													primaryColor: CustomColors(context).textColor
												),
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          initialDateTime: date,
                          onDateTimeChanged: (value) {
                            setState(() {
                              newDate = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );

        // ignore: unnecessary_await_in_return
        // await DatePicker.showDatePicker(context,
        //   maxTime: DateTime(2050,12,31),
        //   minTime: DateTime(2018,),
        //   currentTime: date,
        //   theme: DatePickerTheme(
        //     itemHeight: 55,
        //     backgroundColor: CustomColors(context).bgColor,
        //     cancelStyle: TextStyle(
        //       color: CustomColors(context).textColor,
        //       fontSize: 20,
        //       fontFamily: 'Raleway'
        //     ),
        //     doneStyle: const TextStyle(
        //       color: Colors.blue,
        //       fontSize: 20,
        //       fontFamily: 'Raleway'
        //     ),
        //     itemStyle: TextStyle(
        //       color: CustomColors(context).textColor,
        //       fontSize: 20,
        //       fontFamily: 'Raleway'
        //     ),
        //     containerHeight: MediaQuery.of(context).size.height *0.4,

        //   ),
        //   onConfirm: (newDate) async{
        //     if(newDate.month != date.month){
        //       // ignore: unnecessary_await_in_return
        //       return await getIt<PostDBInterface>().getAllPostBetweenDate(newDate, newDate.add(
        // 				Duration(days: noOfDaysInMonths(newDate.month, newDate.year) - 1))).then((value){
        //         setState(() => _events = value??{});
        //         // print(_events);
        //         // _calendarController.setSelectedDay(newDate, runCallback: true);
        //         // return value;
        //       }).catchError((onError) {print(onError); return {};});
        //     }
        //     // return _calendarController.setSelectedDay(newDate, runCallback: true);
        //   },
        // );
      },
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            const TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: CustomColors(context).textColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        formatButtonVisible: false,
        // centerHeaderTitle: true,
        leftChevronIcon:
            Icon(Icons.chevron_left, color: CustomColors(context).iconColor),
        rightChevronIcon:
            Icon(Icons.chevron_right, color: CustomColors(context).iconColor),
      ),
      calendarBuilders: CalendarBuilders(
        holidayBuilder: (context, date, events) {
          date = DateTime(date.year, date.month, date.day);
          return Tooltip(
            message: _holidays[date]!.length == 1
                ? '${_holidays[date]![0].title}'
                : '${_holidays[date]![0].title}, ....',
            child: Container(
              margin: const EdgeInsets.all(4.0),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: _selectedDay == date
                    ? CustomColors(context).accentColor
                    : (date == _today
                        ? CustomColors(context).primaryColor
                        : Colors.transparent),
              ),
              child: Center(
                child: Text(
                  '${date.day}',
                  style: const TextStyle().copyWith(
                      color: _selectedDay != date ? Colors.red : Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          );
        },
      ),
      // ignore: prefer_const_literals_to_create_immutables
      weekendDays: [DateTime.sunday],
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: CustomColors(context).textColor),
        weekendStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white70
                : Colors.black45),
      ),
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
        _onVisibleDaysChanged(focusedDay);
      },

      selectedDayPredicate: (day) =>
          isSameDay(day, _focusedDay) /* && !isSameDay(day, DateTime.now())*/,
      onDaySelected: _onDaySelected,

      // onRangeSelected:_onVisibleDaysChanged ,
      // onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: (pageController) => _onCalendarCreated(),
    );
  }

  Widget _buildEvents() {
    return ListView(
      shrinkWrap: true,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 10, left: 10),
            child: Text(
              'Saved Events', style: TextStyle(fontSize: 20),
              // textAlign: TextAlign.center,
            )),
        StreamBuilder<List<Post>>(
          // future:
          initialData: const [],
          stream: getIt<PostDBInterface>().watchAllReminders(_selectedDay),
          //  DBProvider().getAllEventsWithCouncil(
          //   _selectedDay.millisecondsSinceEpoch, _selectedDay.add(Duration(hours: 23,minutes: 59)).millisecondsSinceEpoch,
          //   NOTF_TYPE_CREATE
          // ),
          builder: (context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done ||
                snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return _buildEventList(snapshot.data ?? [], false);
              } else {
                //TODO: implement for this and others
                return _buildEventList([], false);
              }
            }
            return InfiniteLoader();
          },
        ),
        if (_selectedDayHolidays != null && _selectedDayHolidays!.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 10, left: 10),
                  child: Text(
                    'Holidays', style: TextStyle(fontSize: 20),
                    // textAlign: TextAlign.center,
                  )),
              _buildEventList(_selectedDayHolidays!, true)
            ],
          )
        else
          Container(),
      ],
    );
  }

  Widget _buildEventList(List<Post> _eventList, bool isCreated) {
    void handleClick(String value, Post post, DateTime date, int index) async{
      // print(date);
      switch (value) {
        case 'Delete':
          // print("Deleted");
          // DBProvider().deletePost(_postId);
          if (_events[date.sliceTime] != null) {
            // ReminderNotification('Event has been cancelled',id: _events[date][index].timeStamp.toSigned(31)).cancel;
            // print(_calendarController.visibleEvents[date]);

            // DBProvider().updateQuery(GetPost(queryColumn: REMINDER,
            //     queryData: 0,id: _postId),_events[date][index]);
            if (_events[date.sliceTime]!.length != 1) {
              _events[date.sliceTime]!.removeAt(index);
            }
            // else _calendarController.visibleEvents.remove(date);
            else {
              setState(() => _events.remove(date.sliceTime));
            }
						final res = await getIt<PostDBInterface>()
                                  .toggleBookmarkReminder(
                                      post.copyWith(reminder: false), false);
                              res.fold(
                                  (l) => Toast.createError(
                                      message:
                                          'An error occurred while removing the reminder!!!').show(context),
                                  (r) {
																		debugPrint('Removed Sucessfully');
																	});
						ReminderNotification(
                            id: post.timeStamp.toSigned(31))
                        .cancel;	
						// await getIt<PostDBInterface>().deletePost(post);
            // DBProvider().deletePost(_postId);
            // else setState(()=>_calendarController.visibleEvents.remove(date));
            // print(_calendarController.visibleEvents);
          }
          break;
        case 'Settings':
          break;
      }
    }

    return Column(children: [
      // ignore: prefer_if_elements_to_conditional_expressions
      if(_eventList.isEmpty)
         Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: ListTile(
                title: Text(
                    isCreated == true
                        ? "You have't created any events for this date. Tap '+' button to create one!!!"
                        : "You don't have any saved event for this date",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: CustomColors(context).textColor)),
                enabled: false,
              ),
            )
        else Column(
              children: List.generate(
                  _eventList.length,
                  (index) =>
                      /*)
          _eventList
          .map((event) =>*/
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: CustomColors(context).textColor)
                            // color: CustomColors(context).exapndedTileColor,
                            ),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        child: ListTile(
                            trailing: isCreated
                                ? null
                                : PopupMenuButton<String>(
                                    onSelected: (value) => handleClick(
                                        value,
                                        _eventList[index],
                                        DateTime.fromMillisecondsSinceEpoch(
                                            _eventList[index].startTime!),
                                        index),
                                    itemBuilder: (BuildContext context) {
                                      return {
                                        'Delete',
                                      }.map((String choice) {
                                        return PopupMenuItem<String>(
                                          value: choice,
                                          child: Text(choice),
                                        );
                                      }).toList();
                                    },
                                  ),
                            // },
                            focusColor: CustomColors(context).accentColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            title: AutoSizeText(_eventList[index].title,
                                maxLines: 1,
                                maxFontSize: 17,
                                minFontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: CustomColors(context).textColor)),
                            subtitle: isCreated
                                ? null
                                : Row(
                                    children: [
                                      Expanded(
                                        // flex: 6,
                                        child: AutoSizeText(
                                          DateFormat.yMMMd().add_Hm().format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      _eventList[index]
                                                          .startTime!)),
                                          maxLines: 1,
                                        ),
                                      ),
                                      const Text(" - "),
                                      Expanded(
                                        // flex: 5,
                                        child: AutoSizeText(
                                          DateFormat.yMMMd().add_Hm().format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      _eventList[index]
                                                          .endTime!)),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                            enabled: !isCreated,
                            onTap: () {
															context.router.push(PostDescriptionRoute(index: index,
																posts: _eventList,
																type: PostDescType.DISPLAY
															));
														}),
                      )).toList(),
            )
    ]);
  }
}

extension DateX on DateTime {
  DateTime get sliceTime => DateTime(year, month, day);
}
