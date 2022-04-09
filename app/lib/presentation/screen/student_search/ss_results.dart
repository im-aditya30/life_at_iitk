import 'package:async/async.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_at_iitk/app/posts/student/student_cubit.dart';
import 'package:life_at_iitk/domain/api/api_failure.dart';
import 'package:life_at_iitk/domain/models/student.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';
import 'package:life_at_iitk/presentation/screen/profile/profile_pic.dart';
import 'package:life_at_iitk/presentation/screen/student_search/ss_page.dart';
import 'package:life_at_iitk/presentation/screen/student_search/student_desc.dart';

class SSResult extends StatelessWidget {
  final Student query;
  const SSResult({Key? key, required this.query}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final ValueNotifier<List<Student>> data =
    //     ValueNotifier(List<Student>.empty());
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (context, state) {},
      buildWhen: (p, c) => p.isLoading != c.isLoading,
      builder: (context, state) {
        return FutureBuilder<List<Student>>(
            future: getList(state.allStudentData, state),
            builder: (context, snapshot) {
              final list = snapshot.data;
              debugPrint(snapshot.toString());
              return CustomScaffold(
                title: 'Search Results',
                appBarActions: [
                  Visibility(
                    visible: (!state.isLoading &&
                            (ConnectionState.done ==
                                snapshot.connectionState)) &&
                        list?.isNotEmpty == true,
                    child: TextButton(
                        onPressed: null,
                        child: Text(
                          '${list?.length}',
                          style: const TextStyle().copyWith(
                              fontSize: 18,
                              color: CustomColors(context).textColor),
                        )),
                  ),
                ],
                body: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  switchInCurve: Curves.easeOut,
                  child: (state.isLoading &&
                          (ConnectionState.done != snapshot.connectionState))
                      ? Container(
                          color: Colors.black.withOpacity(0.8),
                          child: InfiniteLoader())
                      : Scrollbar(
                          child: Visibility(
                            visible: (state.isLoading &&
                                    (ConnectionState.done !=
                                        snapshot.connectionState)) &&
                                list?.isNotEmpty != true,
                            replacement: ((list?.length ?? 0) == 0)?
																Center(
																child: Row(
																	mainAxisAlignment: MainAxisAlignment.center,
																	children: const [
																		Icon(
																			MaterialIcons.sentiment_dissatisfied,
																			size: 35.0,
																		),
																		SizedBox(width: 10.0),
																		Text('No results found !!!',
																				textAlign: TextAlign.center,
																				style: TextStyle(fontSize: 18.0)),
																	],
																),
															)
														:	ListView.builder(
                                shrinkWrap: true,
                                itemCount: list?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return ListItemStudent(
                                      itemWidth: MediaQuery.of(context).size.width,
                                      user: list!.elementAt(index));
                                }),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    MaterialIcons.sentiment_dissatisfied,
                                    size: 35.0,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text('No results found !!!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18.0)),
                                ],
                              ),
                            ),
                          ),
                        ),
                ),
              );
              // if (!state.isLoading &&
              //     (ConnectionState.done == snapshot.connectionState ||
              //         snapshot.connectionState == ConnectionState.active))

              // );
              // return SearchedList(snapshot.data.toList());
              // return Scaffold(body: InfiniteLoader());
            });
        // :InfiniteLoader();
      },
    );
  }

  Future<List<Student>> getList(List<Student> list, StudentState state) async {
		if(state.isLoading){
			await Future.delayed(const Duration(days: 2));
		}
		bool condition(Student test) {
			return (test.name != null && test.name.trim() != "") &&
        		(test.dept != null && test.dept.trim() != "") &&
						checkifThereisAvalue(query.bloodGroup, test.bloodGroup) &&
            checkIfThereisAvalueForProgram(query.dept, test.dept) &&
            checkifThereisAvalue(query.gender, test.gender) &&
            checkifThereisAvalue(query.hall, test.hall) &&
            checkifThereisAvalue(query.hometown, test.hometown) &&
            checkifThereisAvalue(query.program, test.program) &&
            (checkifThereisAvalue(query.rollNo, test.rollNo) ||
                checkifThereisAvalue(query.name, test.name) ||
                checkifThereisAvalue(query.username, test.username)) &&
            checkIfThereisAvalueForYear(query.year, test.rollNo);
		}
    await Future.microtask(() => list..retainWhere(condition));
		return list;
  }
}

class SearchedList extends StatelessWidget {
  final List<Student> list;
  const SearchedList(this.list);

  @override
  Widget build(BuildContext context) {
    // if (list?.isNotEmpty == true) list.sort((a, b) => a.name.compareTo(b.name));
    // list.retainWhere((test) {
    //   return (test.name != null && test.name.trim() != "")
    //           // && (test.gender != null && test.gender.trim() != "")
    //           // && (test.program != null && test.program.trim() != "")
    //           &&
    //           (test.dept != null && test.dept.trim() != "")
    //       // && (test.bloodGroup != null && test.bloodGroup.trim() != "")
    //       // && (test.hall != null && test.hall.trim() != "")
    //       // && (test.hometown != null && test.hometown.trim() != "")
    //       // && (test.room != null && test.room.trim() != "")
    //       // && (test.rollno != null && test.rollno.trim() != "")
    //       // && (test.username != null && test.username.trim() != "")]
    //       ;
    // });
    return CustomScaffold(
      title: 'Search Results',
      appBarActions: [
        Visibility(
          visible: list.isNotEmpty,
          child: TextButton(
              onPressed: null,
              child: Text(
                '${list.length}',
                style: const TextStyle().copyWith(
                    fontSize: 18, color: CustomColors(context).textColor),
              )),
        ),
      ],
      body: Scrollbar(
        child: list.isEmpty
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      MaterialIcons.sentiment_dissatisfied,
                      size: 35.0,
                    ),
                    SizedBox(width: 10.0),
                    Text('No results found !!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0)),
                  ],
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListItemStudent(
                      itemWidth: MediaQuery.of(context).size.width,
											user: list[index]);
                }),
      ),
    );
  }
}

class ListItemStudent extends HookWidget {
  final double itemWidth;
  final Student user;
  
  const ListItemStudent({Key? key ,required this.itemWidth, required this.user}): super(key: key);
  @override
  Widget build(BuildContext context) {
		final AsyncMemoizer<Either<ApiFailure, ImageProvider<Object>>> _memoizer = useMemoized(() => AsyncMemoizer());
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 90.0,
        ),
        width: itemWidth,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return StudentCard(user, ProfilePic(user).getProfilePic());
                  });
            },
            borderRadius: BorderRadius.circular(16),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 6,
                  child: Container(
                    width: itemWidth - 112,
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 16.0, bottom: 16.0, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user.name,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${user.username}@iitk.ac.in',
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          user.dept,
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          user.rollNo,
                          style: const TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: FutureBuilder<
                          Either<ApiFailure, ImageProvider<Object>>>(
                      future: _memoizer
                          .runOnce(() => ProfilePic(user).getProfilePic()),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.active:
                          case ConnectionState.done:
                            if (snapshot.data != null) {
                              snapshot.data!.fold((f) {
                                Toast.createApiError(f).show(context);
                                return ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                        'assets/${user.gender.toLowerCase()}profile.png'));
                              }, (index) {
                                return Container(
                                  constraints: const BoxConstraints(
                                      maxHeight: double.maxFinite),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image(
                                        image: index,
                                        fit: BoxFit.fitWidth,
                                        loadingBuilder:
                                            (context, widget, event) {
                                          if (event == null) {
                                            return widget;
                                          }
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: event.expectedTotalBytes !=
                                                      null
                                                  ? event.cumulativeBytesLoaded 
																										/ event.expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                        frameBuilder: (context, child, frame,
                                            wasSyncLoaded) {
                                          if (wasSyncLoaded) {
                                            return child;
                                          }
                                          return AnimatedOpacity(
                                            opacity: frame == null ? 0 : 1,
                                            duration:
                                                const Duration(seconds: 1),
                                            curve: Curves.easeOut,
                                            child: child,
                                          );
                                        },
                                      )),
                                );
                                // return ClipRRect(
                                //     borderRadius: BorderRadius.circular(16),
                                //     child: Image.asset(
                                //         'assets/${user.gender.toLowerCase()}profile.png'));
                              });
                            }
                            // if(snapshot?.data == null || !snapshot.hasData){
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                    'assets/${user.gender.toLowerCase()}profile.png'));
                          // }
                          default:
                            return InfiniteLoader();
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
