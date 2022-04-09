
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/app/posts/post/post_cubit.dart';
import 'package:life_at_iitk/domain/database/database_failure.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:life_at_iitk/presentation/core/functions.dart';
import 'package:life_at_iitk/presentation/core/reminders_notfs.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/hive_extension.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/routes/router.gr.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class PostDescription extends HookWidget {
  final List<Post> posts;
  final int index;
  final PostDescType type;

  PostDescription(
      {Key? key, required this.posts, required this.index, required this.type})
      : super(key: key);
  final userData = Hive.getData<User>();
  @override
  Widget build(BuildContext context) {
    final _pageController = usePageController(initialPage: index);
    return PageView.builder(
        controller: _pageController,
        itemCount: posts.length,
        itemBuilder: (BuildContext context, indexOfPage) {
          final Post post = posts[indexOfPage];
					log(post.isFetched.toString(), name: 'IsPostFetched');
          return !post.isFetched?
						StreamBuilder(
							stream: getIt<PostDBInterface>().getPost(postId: post.id),
							builder: (context,AsyncSnapshot<Post> snapshot) {
								if(snapshot.hasData || snapshot.connectionState != ConnectionState.waiting) {
									return customScaffold(snapshot.data!, context, indexOfPage);
								}else {
									return CustomScaffold(
											title: post.title,
											body: Center(
												child: Column(
													mainAxisSize: MainAxisSize.min,
													children: [
														const Text('Error while loading post',
															style: TextStyle(
																color: Colors.red,
																fontSize: 20
															),
														),
														ElevatedButton.icon(
															onPressed: (){
																context.read<ApiBloc>().add(ApiEvent.fetchPostWithId(postUid: post.id));
															}, 
															icon: const Icon(Icons.refresh), 
															label: const Text('Reload', style: TextStyle(fontSize: 20),))
													],
												),
											)
										);
								}
						})
						: customScaffold(post, context, indexOfPage);
        });
  }
	Widget customScaffold(Post post,BuildContext context, int indexOfPage) {
		return CustomScaffold(
              title: post.title,
              appBarActions: <Widget>[
                actions(
                  context: context,
                  indexOfPage: indexOfPage,
                  isAdmin: userData.isLevel2 || userData.isLevel3,
                  posts: posts,
										index: index,
                  type: type,
                )
              ],
              body: DescBody(
                indexOfPage: indexOfPage,
                isAdmin: userData.isLevel2 || userData.isLevel3,
                isLevel3: userData.isLevel3,
                posts: posts,
                type: type,
                userData: userData,
              ));
	}
}

Widget actions(
    {required BuildContext context,
    required List<Post> posts,
    required int indexOfPage,
		required int index,
    required PostDescType type,
    bool isAdmin = false}) {
  const reminder = 'Reminder';
  const bookmark = 'Bookmark';
  final bool hasReminder =
      (posts[indexOfPage].endTime ?? 0) > DateTime.now().millisecondsSinceEpoch;
  return HookBuilder(builder: (context) {
    final post = useState(posts[indexOfPage]);
		final isFeatured = useState(false);
    useEffect(() {
      if (![1, 2, 5].contains(type.index) && isAdmin) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          FeatureDiscovery.discoverFeatures(
            context,
            const <String>{'AddPriority'},
          );
        });
      }
      // all,display,notification,reminder
      if ([8, 1, 4, 5].contains(type.index)) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          FeatureDiscovery.discoverFeatures(
            context,
            const <String>{reminder, bookmark},
          );
        });
      }
      return;
    }, const []);
    return BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          state.maybeMap(
              orElse: () {},
              failure: (f) {},
              toggleReminder: (r) {
                if (r.postTile.post == posts[indexOfPage]) {
                  posts[indexOfPage] = r.postTile.post;
                  post.value = r.postTile.post;
                  if (posts[indexOfPage].reminder == true) {
                    if (DateTime.fromMillisecondsSinceEpoch(
                                posts[indexOfPage].startTime!)
                            .difference(DateTime.now())
                            .inMinutes >=
                        10) {
                      ReminderNotification().setupNotification(
                              'An event you have saved is starting in 10 minutes',
                              reminder: posts[indexOfPage],
                              time: tz.TZDateTime.fromMillisecondsSinceEpoch(
                                      tz.local, posts[indexOfPage].startTime!)
                                  .subtract(const Duration(minutes: 10)));
                    } else if (DateTime.fromMillisecondsSinceEpoch(
                                posts[indexOfPage].startTime!)
                            .difference(DateTime.now())
                            .inMinutes >
                        0) {
                      final min = DateTime.fromMillisecondsSinceEpoch(
                              posts[indexOfPage].startTime!)
                          .difference(DateTime.now())
                          .inMinutes;
                      ReminderNotification().setupNotification(
                              'An event you have saved is starting in $min minutes',
                              reminder: posts[indexOfPage],
                              time: tz.TZDateTime.now(tz.local)
                                  .add(const Duration(seconds: 1)));
                    } else if (DateTime.fromMillisecondsSinceEpoch(
                          posts[indexOfPage].endTime!,
                        ).difference(DateTime.now()).inMinutes <=
                        0) {
                      ReminderNotification(                id: posts[indexOfPage].timeStamp.toSigned(31))
                          .cancel;
                    } else {
                      ReminderNotification().setupNotification(
                              'An event you have saved is going on',
                              reminder: posts[indexOfPage],
                              time: tz.TZDateTime.now(tz.local)
                                  .add(const Duration(seconds: 1)));
                    }
                    // Toast.createSuccess(message: 'Added as a Reminder')
                    //     .show(context);
                  } else {
                    Toast.createInformation(message: 'Removed From Reminder')
                        .show(context);
                    ReminderNotification(
                            id: posts[indexOfPage].timeStamp.toSigned(31))
                        .cancel;
                  }
                }
              },
              toggleBookmark: (b) {
                // print(b.postTile.post.id);
                if (b.postTile.post == posts[indexOfPage]) {
                  posts[indexOfPage] = b.postTile.post;
                  post.value = b.postTile.post;
                  if (posts[indexOfPage].bookmark) {
                    Toast.createSuccess(message: 'Bookmarked !!!')
                        .show(context);
                  }
                }
              });
        },
        listenWhen: (p, c) => c.maybeMap(
            orElse: () => false,
            failure: (f) =>
                f.postTile.post == posts[indexOfPage] &&
                [1, 2].contains(f.f.index),
            toggleReminder: (l) =>
                l.postTile.post == posts[indexOfPage] &&
                l.postTile.post.reminder != posts[indexOfPage].reminder,
            toggleBookmark: (l) =>
                l.postTile.post == posts[indexOfPage] &&
                l.postTile.post.bookmark != posts[indexOfPage].bookmark),
        buildWhen: (p, c) => c.maybeMap(
            orElse: () => false,
            failure: (f) =>
                f.postTile.post == posts[indexOfPage] &&
                [1, 2].contains(f.f.index),
            toggleReminder: (l) =>
                l.postTile.post == posts[indexOfPage] &&
                l.postTile.post.reminder != posts[indexOfPage].reminder,
            toggleBookmark: (l) =>
                l.postTile.post == posts[indexOfPage] &&
                l.postTile.post.bookmark != posts[indexOfPage].bookmark),
        builder: (context, state) {
          return Row(
            children: [
              // display,bookmar,reminder
              if ([6,7,9,11].contains(type.index) && isAdmin)
                DescribedFeatureOverlay(
                  featureId: 'AddPriority',
                  description: Column(
                    children: [
                      const Text(
                          'You can choose whether this post is a featured one or not.'),
                      const SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                            text: '',
                            style: TextStyle(
                                fontFamily: CustomColors(context).fontFamily,
                                fontWeight: FontWeight.w100),
                            children: const [
                              TextSpan(
                                text: '**NOTE: ',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: 'All featured posts are shown in the ',
                              ),
                              TextSpan(
                                text: 'Featured Section',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text:
                                      ' of the app and needs to be very important for user !!!')
                            ]),
                      ),
                    ],
                  ),
                  title: const Text('Featured'),
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.accents[3]
                          : Colors.accents[6],
                  targetColor: Theme.of(context).appBarTheme.color!,
                  onDismiss: () async {
                    try {
                      FeatureDiscovery.completeCurrentStep(context);
                    } catch (e) {
                      log(e.toString());
                    }
                    return true;
                  },
                  tapTarget: Wrap(
                    children: <Widget>[
                      AbsorbPointer(
                        child: Switch(
                            value: post.value.isFeatured,
                            onChanged: (value) {
                              posts[indexOfPage] = posts[indexOfPage]
                                  .copyWith(isFeatured: value);
                              post.value = posts[indexOfPage]
                                  .copyWith(isFeatured: value);
                            }),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Text('Featured',
                          style: CustomTheme(context).getDefaultStyle()),
                      Switch(
                          activeColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.accents[3]
                                  : Colors.accents[6],
                          value: isFeatured.value,
                          onChanged: (value) {
                            posts[indexOfPage] =
                                posts[indexOfPage].copyWith(isFeatured: value);
                            // post.value =
                            //     posts[indexOfPage].copyWith(isFeatured: value);
														isFeatured.value = value;
                          }),
                    ],
                  ),
                ),

              // display,all,reminder
              if ([1, 8, 5].contains(type.index))
                DescribedFeatureOverlay(
                  featureId: reminder,
                  tapTarget: Icon(
                    !hasReminder
                        ? Ionicons.ios_notifications_outline
                        : Ionicons.ios_notifications_off,
                    size: 26.0,
                  ),
                  title: const Text('Add Post for Reminder'),
                  targetColor: Theme.of(context).appBarTheme.color!,
                  description: const Text(
                      // ignore: missing_whitespace_between_adjacent_strings
                      "You can add a post (if the post contains both a start time and a end Time) to set reminder"
                      'This reminder would be displayed 10 minutes before the begining of '
                      'an event.'),
                  onDismiss: () async {
                    try {
                      FeatureDiscovery.completeCurrentStep(context);
                    } catch (e) {
                      log("$e");
                    }
                    return true;
                  },
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.accents[3]
                          : Colors.accents[2],
                  contentLocation: ContentLocation.below,
                  onOpen: () async {
                    return true;
                  },
                  onComplete: () async {
                    return true;
                  },
                  child: IconButton(
                      tooltip: 'Add Reminder',
                      icon: BlocBuilder<PostCubit, PostState>(
												builder:(context, state) => !hasReminder
                          ? const Icon(Ionicons.ios_notifications_off)
                          : posts[indexOfPage].reminder
                              ? const Icon(Ionicons.ios_notifications)
                              : const Icon(Ionicons.ios_notifications_outline),
												buildWhen: (previous, current) => previous.maybeMap(
													orElse: ()=>false, toggleReminder: (_) => true)
															||  current.maybeMap(orElse: ()=>false, toggleReminder: (_) => true), 
											),
                      iconSize: 26.0,
                      onPressed: !hasReminder
                          ? null
                          : () async {
                              await context.read<PostCubit>().toggleReminder(
                                  PostTile(
                                      post: posts[indexOfPage] = posts[indexOfPage].copyWith(
                                          reminder:
                                              !posts[indexOfPage].reminder)));
                              if (posts[indexOfPage].reminder) {
                                Toast.createSuccess(message: 'Reminder added !!!')
                                    .show(context);
                              }
                            }),
                ),

              // all,display,notification,reminder
              if ([8, 1, 4, 5].contains(type.index))
                DescribedFeatureOverlay(
                  featureId: bookmark,
                  tapTarget: const Icon(
                    MaterialIcons.bookmark_border,
                    size: 26.0,
                  ),
                  title: const Text('Add Post as a bookmark'),
                  targetColor: Theme.of(context).appBarTheme.color!,
                  description: const Text(
                      'You can clasify any post as your bookmark and the selected post would also be visible in the bookmarks section'),
                  contentLocation: ContentLocation.below,
                  onOpen: () async => true,
                  onDismiss: () async {
                    try {
                      FeatureDiscovery.completeCurrentStep(context);
                    } catch (e) {
                      log("$e");
                    }
                    return true;
                  },
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.accents[3]
                          : Colors.accents[14],
                  child: IconButton(
                    tooltip: 'Bookmark Post',
                    icon: BlocBuilder<PostCubit, PostState>(
											builder:(context, state) => posts[indexOfPage].bookmark
                        ? const Icon(MaterialIcons.bookmark)
                        : const Icon(MaterialIcons.bookmark_border),
											buildWhen: (previous, current) => previous.maybeMap(
												orElse: ()=>false,
												toggleBookmark: (_) => true) || current.maybeMap(
												orElse: ()=>false,
												toggleBookmark: (_) => true), 
										),
                    iconSize: 26.0,
                    onPressed: () async {
                      await context.read<PostCubit>().toggleBookmark(PostTile(
                          post: posts[indexOfPage] = posts[indexOfPage].copyWith(
                              bookmark: !posts[indexOfPage].bookmark)),index: index);
											if (posts[indexOfPage].bookmark) {
                                Toast.createSuccess(message: 'Bookmarked !!!')
                                    .show(context);
                              }
                    },
                  ),
                )
            ],
          );
        });
  });
}
// }

class DescBody extends HookWidget {
  final List<Post> posts;
  final int indexOfPage;
  final PostDescType type;
  final User userData;
  final bool isAdmin;
  final bool isLevel3;

  const DescBody({
    Key? key,
    required this.posts,
    required this.indexOfPage,
    required this.type,
    this.isAdmin = false,
    this.isLevel3 = false,
    required this.userData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _animationController = useAnimationController();
		final isDraft = useState(false);
    final _colorTween = _animationController
        .drive(ColorTween(begin: Colors.yellow, end: Colors.blue));
    final time = ValueNotifier<bool>(false);
    return BlocListener<ApiBloc, ApiState>(
        listener: (context, state) {
					// state.apiFailureOrSuccessOption
				},
        child: Stack(
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                if (posts[indexOfPage].url != 'null' &&
                    posts[indexOfPage].url.removeSpaces.isNotEmpty == true)
                  CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) {
                        return SizedBox(
                          height: 80,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: progress.progress,
                              valueColor: _colorTween,
                            ),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.error_outline,
                              size: 50,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                                'An error occurred while loading the image !!!'),
                            Text(
                                'A possible reason could be that you are offline'),
                          ],
                        );
                      },
                      imageUrl: posts[indexOfPage].url),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  elevation: 5.0,
                  margin: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  posts[indexOfPage].title,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 35.0),
                                ),
                              ),
                              Text(posts[indexOfPage].sub[0].toString(),
                                  // 'Science and Technology Council',
                                  style: const TextStyle(fontSize: 17.0)),
                              // ),
                              if (posts[indexOfPage].tags != 'null' &&
                                  posts[indexOfPage]
                                          .tags
                                          .removeSpaces
                                          .isNotEmpty ==
                                      true)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Wrap(
                                    spacing: 8.0,
                                    children: _buildChoice(
                                        posts[indexOfPage].tags, context),
                                  ),
                                ),
                              if (posts[indexOfPage].startTime != 0 &&
                                  posts[indexOfPage].startTime != null)
                                Container(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(
                                          EvilIcons.calendar,
                                          size: 30.0,
                                        ),
                                      ),
                                      Tooltip(
                                        message: DateFormat("EEEE").format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                posts[indexOfPage].startTime!)),
                                        child: Text(
                                          DateFormat("hh:mm a, dd MMMM yyyy")
                                              .format(DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      posts[indexOfPage]
                                                          .startTime!)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              if (posts[indexOfPage].startTime != 0 &&
                                   posts[indexOfPage].startTime != null &&
                                  posts[indexOfPage].endTime != 0 &&
                                  posts[indexOfPage].endTime != null)
                                Container(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Row(
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Icon(
                                          Ionicons.md_time,
                                          size: 26.0,
                                        ),
                                      ),
                                      Tooltip(
                                        message: DateFormat("EEEE").format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                posts[indexOfPage].endTime!)),
                                        child: Text(
                                          DateFormat("hh:mm a, dd MMMM yyyy")
                                              .format(DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      posts[indexOfPage]
                                                          .endTime!)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Container(
                                padding: const EdgeInsets.only(top: 16.0,bottom: 8),
                                child: SelectableLinkify(
                                  text: posts[indexOfPage].body,
                                  onOpen: (link) =>
                                      launchUrl(link.url, context),
                                  style:
                                      const TextStyle().copyWith(fontSize: 18),
                                  linkStyle: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //create post,edit post, draft, approval
                if ([6, 7, 9, 11].contains(type.index))
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20.0,
                      runSpacing: 10.0,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                          child: RaisedButton.icon(
                              elevation: 10.0,
                              color: Colors.grey[800],
                              splashColor: Colors.black,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(MaterialCommunityIcons.cancel),
                              label: const Text('Dismiss')),
                        ),
                        if (type != PostDescType.APPROVAL && type != PostDescType.DRAFT_POSTS)
                          SizedBox(
                            height: 40,
                            child: RaisedButton.icon(
                              elevation: 10.0,
                              color: Colors.green,
                              splashColor: Colors.green.shade900,
                              onPressed: () async {
                                if (posts[indexOfPage]
                                        .author
                                        .removeSpaces
                                        .isNotEmpty ==
                                    true) {
                                  posts[indexOfPage] = posts[indexOfPage]
                                      .copyWith(
                                          author: userData.id ?? "unknown");
                                }
																isDraft.value = true;
                                context.read<ApiBloc>().add(type ==
                                            PostDescType.DRAFT_POSTS &&
                                        posts[indexOfPage].id.isNotEmpty ==
                                            true
                                    ? ApiEvent.updatePost(
                                        post: posts[indexOfPage])
                                    : ApiEvent.makeDraft(
                                        post: posts[indexOfPage]));
                              },
                              icon: const Icon(
                                  MaterialCommunityIcons.file_download_outline),
                              label: const Text('Save As Draft'),
                            ),
                          ),
                        Container(
                          constraints: const BoxConstraints(minWidth: 150),
                          height: 40,
                          child: RaisedButton.icon(
                              elevation: 10.0,
                              highlightElevation: 5.0,
                              onPressed: () async {
																// if(type ==
                                //         PostDescType.CREATE_POSTS) isDraft.value = true;
                                isAdmin && type == PostDescType.APPROVAL
                                    ? Toast.createInformation(
                                            message: 'Publishing Post')
                                        .show(context)
																		: Toast.createInformation(
                                            message: 'Sending Request')
                                        .show(context);
                                Future.delayed(const Duration(seconds: 10), () {
                                  time.value = true;
                                });
                                log("$type", name: "Post Desc");
                                // create or draft or approving Post
                                // for post is draft ==> execute publishDraft api i.e. isDraft = true if
                                // for new post ==> exceute makePost api i.e. isCreate = true
                                // for approving post ==> execute pusblish post api
                                context.read<ApiBloc>().add((type ==
                                        PostDescType.CREATE_POSTS)
                                    ? ApiEvent.requestPostApproval(
                                        post: posts[indexOfPage])
                                    : (type == PostDescType.DRAFT_POSTS)
                                        ? ApiEvent.publishDraft(
                                            postUid: posts[indexOfPage].id)
                                        : ApiEvent.publishPost(
                                            postUid: posts[indexOfPage].id));
                              },
                              icon: const Icon(Entypo.publish),
                              label: Text(
                                  isAdmin && type == PostDescType.APPROVAL
                                      ? 'Publish'
																			: 'Request Approval')),
                        ),
                      ],
                    ),
                  )
              ],
            ),
            BlocConsumer<ApiBloc, ApiState>(
                listener: (context, state) {
									if(type != PostDescType.DRAFT_POSTS){
										state.apiFailureOrSuccessOption.fold(
											() {}, 
											(either) => either.fold(
												(l) => Toast.createApiError(l).show(context),
												(_) => context.router.popUntilRouteWithName(HomePageRoute.name)));
									}
								},
                builder: (context, state) {
                  if (state.load.intersection({API.publishDraft,API.makeDraft,
												API.publishPost, API.requestApproval}).isNotEmpty) {
                    return Center(
                      child: Container(
                        color: Colors.black.withOpacity(0.8),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Text(
                                  !time.value
                                      ? (isDraft.value? 'Publishing Draft'
																				:	(isAdmin && type == PostDescType.APPROVAL
                                          ? 'Publishing Post'
																					: 'Sending request Approval'))
                                      : 'Taking too much time,maybe your connectivity is slow',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SpinKitDualRing(
                                  color: Theme.of(context).accentColor),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                }),
          ],
        ));
  }

  List<Widget> _buildChoice(String postTags, BuildContext context) {
    final List<Widget> _tag = List.empty(growable: true);
    final List<String> tags = postTags.split(";");
    if (tags != null) {
      tags.removeAt(tags.length - 1);
      for (final i in tags) {
        if (i != ' ' || i != null) {
          _tag.add(Tooltip(
            message: i.toString(),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 120.0,
                // minWidth: 80.0,
              ),
              child: Chip(
                labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.purple
                    : Colors.amber,
                label: Text(i, style: const TextStyle(color: Colors.white)),
              ),
            ),
          ));
        }
      }
    } else {
      _tag.add(Container());
    }

    return _tag;
  }
}

extension StringX on String {
  String get removeSpaces => replaceAll(' ', '');
}

extension TZDATETIMEX on tz.TZDateTime {}
