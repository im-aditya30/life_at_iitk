import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_at_iitk/app/posts/fcm_cubit/fcm_cubit.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/notfs/notifs_model.dart';
import 'package:life_at_iitk/infrastructure/database/moor/posts/database_class.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/core/reminders_notfs.dart';
import 'package:provider/provider.dart';

import 'package:life_at_iitk/app/posts/post/post_cubit.dart';
import 'package:life_at_iitk/app/posts/student/student_cubit.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/hive_extension.dart';
import 'package:life_at_iitk/infrastructure/database/hive_class.dart';
import 'package:life_at_iitk/presentation/core/app.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/widgets/drawer_tile.dart';
import 'package:life_at_iitk/presentation/screen/home/ongoing_events.dart';
import 'package:life_at_iitk/presentation/screen/home/upcoming_events.dart';
import 'package:life_at_iitk/presentation/routes/router.gr.dart';

import '../../../app/auth/auth_bloc.dart';
import '../../../app/posts/repo/repo_bloc.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../routes/router.gr.dart';
import 'latest_events.dart';
import 'layout.dart';

class HomePage extends HookWidget {
  // final Notfs schema = Notfs();
  @override
  Widget build(BuildContext context) {
    final _homeLayoutUpdateStrem = useStreamController<String>();
    final _homeUpdateStrem = useStreamController<String>();
    useEffect(() {
      SystemChannels.lifecycle.setMessageHandler((msg) {
        debugPrint('<SystemChannels> $msg');
        if (msg == AppLifecycleState.resumed.toString()) {
          _homeUpdateStrem.add('Val');
          _homeLayoutUpdateStrem.add('Val');
        }
        return Future.value();
      });
    }, []);
    return MultiBlocListener(
      listeners: [
        BlocListener<RepoBloc, RepoState>(
          listenWhen: (previous, current) =>
              previous.isAppLoading != current.isAppLoading,
          listener: (context, state) {
            if (!state.isAppLoading) {
              final userData = Hive.getBox<User>();
              BlocProvider.of<FcmCubit>(context).subsUnsubsTopic(
                  subscribe: userData.getUser.prefs, unsubscribe: []);
            }
          },
        )
      ],
      child: BlocBuilder<RepoBloc, RepoState>(
        buildWhen: (previous, current) =>
            previous.isAppLoading != current.isAppLoading,
        builder: (context, state) {
          final Map<String, Widget> _map = {
            "Ongoing Events": StreamBuilder<String>(
              stream: _homeLayoutUpdateStrem.stream,
              builder: (context, snapshot) {
                // log(snapshot.data.toString(), name: 'Ongoing');
                return OngoingEvents(streamController: _homeLayoutUpdateStrem);
              },
            ),
            // OngoingEvents(),
            "Latest Posts": StreamBuilder<String>(
              stream: _homeUpdateStrem.stream,
              builder: (context, snapshot) {
                return const LatestEvents();
              },
            ),
            "Upcoming Events": StreamBuilder<String>(
              stream: _homeLayoutUpdateStrem.stream,
              builder: (context, snapshot) {
                // log(snapshot.data.toString(), name: 'Upcoming');
                return UpcomingEvents(streamController: _homeLayoutUpdateStrem);
              },
            ),
          };
          return Center(
            child: CustomScaffold(
              title: "Home",
              drawer: (!state.isAppLoading && !state.showError)
                  ? Drawer(
                      child: ListView(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.width * 0.7,
                              color: CustomColors(context).bgColor,
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        tooltip: 'Campus Map',
                                        icon: const Icon(
                                          Icons.map,
                                          size: 30,
                                        ),
                                        onPressed: () => context.router
                                            .push(const CampusMapRoute()),
                                      )),
                                  BlocBuilder<StudentCubit, StudentState>(
                                    buildWhen: (p, c) =>
                                        p.userSData.gender !=
                                        p.userSData.gender,
                                    builder: (context, state) {
                                      return Align(
                                          child: ValueListenableBuilder<
                                                  Box<User>>(
                                              valueListenable:
                                                  Hive.getBox<User>()
                                                      .listenable(keys: [0]),
                                              builder: (context, box, _) {
																								final userVal = box.getUser.toMap();
																								userVal.remove('prefs');
																								print(userVal);
                                                return Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox.fromSize(
                                                      size:
                                                          const Size(100, 100),
                                                      child: InkWell(
                                                          borderRadius: BorderRadius
                                                              .circular(52),
                                                          onTap: () async {
                                                            context
                                                                .read<
                                                                    StudentCubit>()
                                                                .getUserStudentData();
                                                            context.router
                                                                .popAndPush(
                                                                    const ProfilePageRoute());
                                                          },
                                                          child: box
                                                                  .getUser
                                                                  .profile
                                                                  .isNotEmpty
                                                              ? CircleAvatar(
                                                                  radius: 50,
                                                                  backgroundColor:
                                                                      CustomColors(
                                                                              context)
                                                                          .bgColor,
                                                                  backgroundImage:
                                                                      MemoryImage(box
                                                                          .getUser
                                                                          .profile))
                                                              : CircleAvatar(
                                                                  radius: 50,
                                                                  backgroundColor:
                                                                      CustomColors(
                                                                              context)
                                                                          .bgColor,
                                                                  backgroundImage:
                                                                      AssetImage(
                                                                          "assets/${(box.getUser.gender?.toLowerCase())??""}profile.png"))
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                        height: 20.0),
                                                    Text(
                                                      box.getUser.name
                                                                  .isNotEmpty ==
                                                              true
                                                          ? box.getUser.name
                                                          : state.userSData.name
                                                                  .isEmpty
                                                              ? "${box.getUser.id}@iitk.ac.in"
                                                              : state.userSData
                                                                  .name
                                                                  .toLowerCase(),
                                                      style: const TextStyle(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          fontSize: 17.0),
                                                    ),
                                                  ],
                                                );
                                              }));
                                    },
                                  ),
                                ],
                              )),
                          // DrawerTile(
                          //     title: "Profile",
                          //     navigation: () {
                          // 			context.read<StudentCubit>().getUserStudentData();
                          // 			context.router.pushProfilePage();
                          // 		},
                          //     // context.router.push(const PreferencesRoute()),
                          //     icon: Octicons.settings),
                          // DrawerTile(
                          //     title: "Campus Map",
                          //     navigation: () => context.router.pushCampusMap(),
                          //     // context.router.push(const PreferencesRoute()),
                          //     icon: Octicons.settings),
                          DrawerTile(
                              title: "Preferences",
                              navigation: () =>
                                  context.router.push(const PreferencesRoute()),
                              // context.router.push(const PreferencesRoute()),
                              icon: Octicons.settings),
                          DrawerTile(
                              navigation: () =>
                                  context.router.push(const FeaturedRoute()),
                              title: "Featured Section",
                              icon: AntDesign.exception1),
                          DrawerTile(
                              navigation: () =>
                                  context.router.push(const PostListRoute()),
                              title: "Posts",
                              icon: Entypo.notification),
                          ValueListenableBuilder<Box<User>>(
                              valueListenable:
                                  Hive.box<User>(hiveDBNameUsingClass[User]!)
                                      .listenable(),
                              builder: (context, box, child) {
                                // log("${box.getUser.isLevel3}", name: "drawer");
                                if ((box.getUser.admin ?? false) ||
                                    box.getUser.isLevel2 ||
                                    box.getUser.isLevel3) {
                                  // log("${box.getUser.isLevel3}", name: "drawer");
                                  return Provider<User>(
                                    create: (context) => box.getUser,
                                    builder: (context, _) {
                                      return ExpansionTile(
                                        title: const Text('Admin Options',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontFamily: 'Nunito')),
                                        leading: Icon(
                                            MaterialCommunityIcons
                                                .shield_account,
                                            color: CustomColors(context)
                                                .iconColor),
                                        backgroundColor: CustomColors(context)
                                            .expandedTileColor,
                                        children: [
                                          Container(),
                                          if (box.getUser.isLevel2 ||
                                              box.getUser.isLevel3)
                                            DrawerTile(
                                                navigation: () => context.router
                                                    .push(
                                                        const MakeCoordinatorRoute()),
                                                title: 'Make Coordinator',
                                                icon: MaterialCommunityIcons
                                                    .card_account_details_outline),
                                          if (box.getUser.admin ?? false)
                                            Column(
                                              children: [
                                                DrawerTile(
                                                    navigation: () => context.router.push(
                                                        CreateEditPostRoute(
                                                            type: PostDescType
                                                                .CREATE_POSTS,
                                                            post: const Post())
                                                        // HomeRootRoutes
                                                        //     .createEditPost(
                                                        //         name:
                                                        //             "Create"),
                                                        // arguments:
                                                        //     CreateEditPostArguments(
                                                        //         post:
                                                        //             const Post())
                                                        ),
                                                    title: "Create Posts",
                                                    icon: Entypo.new_message),
                                                DrawerTile(
                                                    navigation: () => context.router.push(
                                                        UpdateDraftsPageRoute(
                                                            isUpdate: true)
                                                        // HomeRootRoutes
                                                        //     .updateDraftsPage,
                                                        // arguments:
                                                        //     UpdateDraftsPageArguments(
                                                        //         isUpdate:
                                                        //             true)
                                                        ),
                                                    title: "Update Posts",
                                                    icon: MaterialCommunityIcons
                                                        .update),
                                                DrawerTile(
                                                    navigation: () =>
                                                        context.router.push(
                                                            const PendingApprovalRoute()),
                                                    title: "Pending Approval",
                                                    icon: MaterialCommunityIcons
                                                        .stamper),
                                                DrawerTile(
                                                    navigation: () => context
                                                        .router
                                                        .push(
                                                            UpdateDraftsPageRoute(
                                                                isUpdate:
                                                                    false)),
                                                    title: "Drafted Posts",
                                                    icon: Ionicons.ios_save)
                                              ],
                                            )
                                        ],
                                      );
                                    },
                                  );
                                }
                                return const SizedBox();
                              }),
                          DrawerTile(
                              navigation: () {
                                context.read<PostCubit>().loadAllBoookmark();
                                // .add(const PostEvent.loadAllBoookmark());
                                context.router.push(const BoookmarksRoute());
                              },
                              title: 'Bookmarked Posts',
                              icon: MaterialIcons.collections_bookmark),
                          ExpansionTile(
                            title: const Text('Schedule',
                                style: TextStyle(
                                    fontSize: 20.0, fontFamily: 'Nunito')),
                            leading: Icon(MaterialCommunityIcons.calendar_alert,
                                color: CustomColors(context).iconColor),
                            backgroundColor:
                                CustomColors(context).expandedTileColor,
                            children: [
                              DrawerTile(
                                  navigation: () => context.router
                                      .push(const CalendarRoute()),
                                  title: "Calendar",
                                  icon: Octicons.calendar),
                              DrawerTile(
                                  navigation: () => context.router
                                      .push(const OngoingEventsRoute()),
                                  title: "Ongoing Events",
                                  icon: MaterialCommunityIcons.timetable),
                              DrawerTile(
                                  navigation: () => context.router
                                      .push(const UpcomingEventsRoute()),
                                  title: "Upcoming Events",
                                  icon:
                                      MaterialCommunityIcons.calendar_outline),
                            ],
                          ),
                          DrawerTile(
                              navigation: () => context.router
                                  .push(const StudentSearchPageRoute()),
                              title: "Student Search",
                              icon: MaterialCommunityIcons.account_search),
                          Container(
                            height: 55.0,
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 15.0, bottom: 15.0),
                            child: Row(
                              children: <Widget>[
                                const Icon(Ionicons.ios_color_palette),
                                Container(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: const Text(
                                    'Dark Mode',
                                    style: TextStyle(
                                        fontSize: 20.0, fontFamily: 'Nunito'),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Switch(
                                      value: Theme.of(context).brightness ==
                                          Brightness.dark,
                                      onChanged: (value) {
                                        Hive.box<String>('theme').put(
                                            0,
                                            value
                                                ? theme[ThemeMode.dark]!
                                                : theme[ThemeMode.light]!);
                                        // DynamicTheme.of(context).setBrightness(
                                        // 	Theme.of(context).brightness == Brightness.light
                                        // 		? Brightness.dark
                                        // 		: Brightness.light);
                                      }),
                                )
                              ],
                            ),
                          ),
                          DrawerTile(
                              // onTap:(){
                              // 	// BlocProvider.of(context)
                              // 	getIt<PostDBInterface>().deleteAllPosts();
                              // },
                              navigation: () =>
                                  context.router.push(const AboutUsRoute()),
                              title: "About Us",
                              icon: Entypo.info_with_circle),
                          DrawerTile(
                            title: "Logout",
                            icon: AntDesign.logout,
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Row(
                                        children: const [
                                          Icon(
                                            Icons.warning,
                                            color: Colors.red,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "Confirm logout?",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        RaisedButton(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Dismiss"),
                                        ),
                                        const SizedBox(width: 4),
                                        FlatButton(
                                          onPressed: () {
                                            ReminderNotification().cancelAll;
                                            Navigator.pop(context);
                                            // UserModel data = userData.toMap()[0];
                                            // subscribeUnsubsTopic([], data.prefs??[]);
                                            context.read<AuthBloc>().add(
                                                const AuthEvent.signedOut());
                                            context.read<AuthBloc>().add(
                                                const AuthEvent
                                                    .authCheckRequested());
                                          },
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: const Text("Logout"),
                                        ),
                                      ],
                                    )),
                          ),
                        ],
                      ),
                    )
                  : null,
              body: state.isAppLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : (!state.showError)
                      ? ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          // shrinkWrap: true,
                          itemCount: _map.length,
                          itemBuilder: (context, index) => ContentLayout(
                              title: _map.keys.toList()[index],
                              child: _map.values.toList()[index]))
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {
                                    context
                                        .read<RepoBloc>()
                                        .add(const RepoEvent.loadAppData());
                                  },
                                  icon: const Icon(Icons.refresh),
                                  label: const Text("Reload")),
                              const SizedBox(height: 10),
                              const Text(
                                  'An error occurred while loading the app 😥'),
                              const Text(
                                  'Please try again later or try reloading.'),
                              TextButton(
                                  onPressed: () {},
                                  // padding: const EdgeInsets.all(0),
                                  child: const Text("Contact Us")),
                            ],
                          ),
                        ),
              appBarActions: (state.showError || state.isAppLoading)
                  ? [
                      IconButton(
                          icon: const Icon(Icons.exit_to_app),
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.signedOut());
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.authCheckRequested());
                          }
                          // BlocProvider.of(context).
                          )
                    ]
                  : null,
            ),
          );
        },
      ),
    );
  }
}
