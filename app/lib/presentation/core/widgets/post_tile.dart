import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:life_at_iitk/app/posts/post/post_cubit.dart';
import 'package:life_at_iitk/domain/core/functions.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/notfs/notifs_model.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/hive_extension.dart';
import '../../../domain/models/posts.dart' as p;
import '../../routes/router.gr.dart';
import '../../screen/events/calendar.dart';

class TimeTile extends HookWidget {
	 final List<p.Post> posts;
  final int index;
  final StreamController<String> streamController;
	final PostDescType type;
	final bool isOngoing;

  const TimeTile({
		Key? key,
		required this.posts,
		required this.index,
		required this.streamController,
		required this.type,
		required this.isOngoing}) : super(key:key);
		@override
  	Widget build(BuildContext context) {
			final time = isOngoing? convertToStartTime(
				posts[index].startTime!, posts[index].endTime!):
				convertToEndTime(
				posts[index].startTime!, posts[index].endTime!);
		// final bookmarkState = useState(posts[index].bookmark);
    useEffect((){
			// log((posts[index].startTime! <= DateTime.now().millisecondsSinceEpoch && !isOngoing).toString(),name:'Tile');
			if(posts[index].startTime! <= DateTime.now().millisecondsSinceEpoch && !isOngoing ){
				streamController.add(DateTime.now().toIso8601String());
				// callback();
			}
			if(posts[index].endTime! < DateTime.now().preciseTimetoMinutes.millisecondsSinceEpoch && isOngoing){
				streamController.add(DateTime.now().toIso8601String());
				getIt<PostDBInterface>().toggleBookmarkReminder(posts[index].copyWith(reminder: false), false);
			}
		},[time]);
		// log('${time}',name:'tile');
		return time.fold(
			() => child(context, posts[index].message, 2), 
			(t) {
				// if(t.contains('days')) 
				return child(context, t, 1);
				// return StreamBuilder<Object>(
				//   stream: Stream.periodic(const Duration(minutes: 1)),
        //     builder: (context, _) {
				// 			final time = useState(isOngoing? convertToStartTime(
				// 					posts[index].startTime!, posts[index].endTime!):
				// 					convertToEndTime(
				// 					posts[index].startTime!, posts[index].endTime!) );
				// 			// final bookmarkState = useState(posts[index].bookmark);
				// 			useEffect((){
				// 				if(posts[index].startTime! <= DateTime.now().millisecondsSinceEpoch && !isOngoing ){
				// 					callback();
				// 				}
				// 			},[time]);
				//     return time.value.fold(() => child(context, posts[index].message, 2), (a) => child(context, a,1));
				//   }
				// );
			});
		}
		Widget child(BuildContext context, String time, int maxLines) {
			return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
					context.router.push(
						PostDescriptionRoute(
						index: index,
						posts: posts,
						type: type
					));
				},
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom:
							// index == 0 ?
							15.0,
							// :15,
              right:
							// index == 0 ?
							0.0,
							// : 0,
              child: IconButton(
                      tooltip: 'Save Post',
                      icon: posts[index].bookmark?const Icon(
                        MaterialIcons.bookmark
                      ): const Icon(MaterialIcons.bookmark_border),
                      onPressed: (){
													context.read<PostCubit>().toggleBookmark(p.PostTile(
															post : posts[index].copyWith(
																bookmark: !posts[index].bookmark
															)
														));
														if(posts[index].bookmark == false){
															Toast.createSuccess(message: 'Bookmarked !!!').show(context);
														}
												},)
                      // });
                    ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: AutoSizeText(posts[index].sub[0].toString(),
                      // 'Science and Texhnology Council',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.blueGrey
                            : Colors.white70,
                        // fontWeight: FontStyle.italic,
                        fontSize: 10.0,
                      )),
                ),
                Container(
                  // alignment: Alignment.center,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 90),
                  padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 10.0),
                  child: AutoSizeText(
										posts[index].title,
                      // 'Sit commodo fugiat duis consectetur sunt ipsum cupidatat adipisicing mollit et magna duis.',
                    minFontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    )
									),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 5.0),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 116.0,
                  ),
                  child: AutoSizeText(
                    // posts[index].message,
										time,
                    maxLines: maxLines,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[850]
                          : Colors.white70,
                    ),
                  ),
                ),
                Visibility(
										visible: true,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 5.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "",
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.grey
                              : Colors.white70,
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
		}
}
class PostTile extends HookWidget {
  final List<p.Post> posts;
  final int index;
  final Function callback;
	final PostDescType type;

  const PostTile( 
      {Key? key,
      required this.posts,
      required this.index,
      required this.type,
      required this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final time = useState(DateFormat("hh:mm a, dd MMMM yyyy")
        .format(posts[index].timeStamp.toDateTime));
		final bookmarkState = useState(posts[index].bookmark);
    useEffect(() {
      switch (convertDateToString(posts[index].timeStamp)) {
        case 'Today':
          {
            if (DateTime.now()
                    .difference(posts[index].timeStamp.toDateTime)
                    .inMinutes <
                60) {
              final int minutes = DateTime.now()
                  .difference(posts[index].timeStamp.toDateTime)
                  .inMinutes;
              switch (minutes) {
                case 0:
                  time.value = 'now';
                  break;
                default:
                  time.value = '$minutes minutes ago';
              }
            } else {
              time.value = DateFormat("hh:mm a")
                  .format(posts[index].timeStamp.toDateTime);
            }
          }
      }
      return;
    }, const []);
    
		return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
					context.router.push(
						PostDescriptionRoute(
						index: index,
						posts: posts,
						type: type
					));
				},
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 
							// index == 0 ?
							15.0,
							// :15,
              right: 
							// index == 0 ?
							0.0,
							// : 0,
              child: 
							// BlocConsumer<PostCubit, PostState>(
								// listener: (context, state) {
								// 	// state.maybeMap(orElse: () {},
								// 	// 	failure: (f) {
								// 	// 		// f.postTile.post
								// 	// 	},
								// 	// 	loadedPost: (post) {
								// 	// 		posts[index] = post.postTile.post;
								// 	// 		bookmarkState.value = post.postTile.post.bookmark;
								// 	// 	}
								// 	// );
								// },
								// listenWhen: (previous, current) => false,
								// // current.maybeWhen(
								// // 	orElse: () => false, 
								// // 	failure: (f,post) => post.post == posts[index] && post.post.bookmark != posts[index].bookmark,
								// // 	loadedPost: (post) => post.post == posts[index] && post.post.bookmark != posts[index].bookmark),
								// buildWhen: (previous, current) => false,
								// // current.maybeWhen(
								// // 	orElse: () => false, 
								// // 	failure: (f,post) => post.post == posts[index] && post.post.bookmark != posts[index].bookmark,
								// // 	loadedPost: (post) => post.post == posts[index] && post.post.bookmark != posts[index].bookmark),
                // builder: (context, state) {
                  /*return StreamBuilder<p.Post>(
                    //   stream: bloc.receiveBookmarksNotfs.transform(StreamTransformer<Posts,Posts>.fromHandlers(
                    //       handleData: (posts,sink){
                    //         if(posts?.id == widget.arrayWithPrefs[widget.index].id){
                	  //           sink.add(posts);
                    //         }
                    //       }
                    //   )),
										// stream: ,
                    initialData: posts[index],
                    builder: (context, snapshot) {*/
                      // return InkResponse(
											// 	onTap: (){
											// 		context.read<PostBloc>().add(PostEvent.toogleBookmark(
											// 			p.PostTile(
											// 				post : posts[index]
											// 			),
											// 			!posts[index].bookmark
											// 			));
											// 		// posts[index] = 
											// 		// bookmarkState.value = posts[index].bookmark;
											// 	},
											// 	child: AnimatedSwitcher(
											// 		duration: const Duration(milliseconds: 100),
											// 		transitionBuilder: (child, animation) => ScaleTransition(
											// 			scale: animation, child: child),
											// 		child: 
											// 		// snapshot?.data?.bookmark == true ||
											// 						posts[index].bookmark  ?
											// 					const Icon(MaterialIcons.bookmark)
											// 					: const Icon(MaterialIcons.bookmark_border),
											// 	),
											// );
											// return 
											IconButton(
                      tooltip: 'Save Post',
                      icon: posts[index].bookmark?const Icon(
                        MaterialIcons.bookmark
                      ): const Icon(MaterialIcons.bookmark_border),
                      onPressed: (){
													context.read<PostCubit>().toggleBookmark(p.PostTile(
															post : posts[index].copyWith(
																bookmark: !posts[index].bookmark
															)
														));
													// .add(PostEvent.toogleBookmark(
													// 	p.PostTile(
													// 		post : posts[index]
													// 	),
													// 	!posts[index].bookmark
													// 	));
														if(posts[index].bookmark == false){
															Toast.createSuccess(message: 'Bookmarked !!!').show(context);
														}
												// },);
                      // });
                },
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                  child: AutoSizeText(posts[index].sub[0].toString(),
                      // 'Science and Texhnology Council',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.blueGrey
                            : Colors.white70,
                        // fontWeight: FontStyle.italic,
                        fontSize: 10.0,
                      )),
                ),
                Container(
                  // alignment: Alignment.center,
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 90),
                  padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 10.0),
                  child: AutoSizeText(
										posts[index].title,
                      // 'Sit commodo fugiat duis consectetur sunt ipsum cupidatat adipisicing mollit et magna duis.',
                    minFontSize: 15.0,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    )
									),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 5.0),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 116.0,
                  ),
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     color: Colors.black
                  //   )
                  // ),
                  child: AutoSizeText(
                    posts[index].message,
                    // 'Dolor consectetur in dolore anim reprehenderit djhbjdhsbvelit pariatur veniam nostrud id ex exercitation.',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[850]
                          : Colors.white70,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 5.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      time.value,
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey
                            : Colors.white70,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension Date on int {
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(this);
}
extension DateTimeX on DateTime {
	DateTime get preciseTimetoMinutes => DateTime(year, month, day, hour, minute);
}

class GeneralPostTile extends StatelessWidget {
	final List<p.Post> posts;
	final int index;
	final bool isEnabled;
	final PostDescType type;

  const GeneralPostTile({Key? key, 
		required this.posts, 
		required this.index, 
		required this.isEnabled,
		required this.type}) : super(key: key);
	@override
	Widget build(BuildContext context) {
	final schema = Notfs();
	final userData = Hive.getData<User>();
		return Card(
      elevation: 5.0,
      // margin: 
			// index == 0
      //     ? const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0)
          // const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
					if(type == PostDescType.EDIT_POSTS){
					context.router.push(
						CreateEditPostRoute(type: PostDescType.EDIT_POSTS, post: posts[index]));
					}else if(type == PostDescType.DRAFT_POSTS){
						context.router.push(PostDescriptionRoute(index: index,
							posts: posts,
							type: PostDescType.DRAFT_POSTS
						));
					}else if(posts[index].type.toLowerCase() != schema.typePermisssion){
						context.router.push(PostDescriptionRoute(index: index,
							posts: posts,
							type: PostDescType.DISPLAY
						));
					}else if(type == PostDescType.APPROVAL || ((userData.isLevel2 || userData.isLevel3) && posts[index].owner != userData.id)){
							context.router.push(PostDescriptionRoute(index: index,
							posts: posts,
							type: PostDescType.APPROVAL
						));
					}else{
						context.router.push(CreateEditPostRoute(type: PostDescType.EDIT_POSTS, post: posts[index]));
					}
        },
        child: Stack(
          children: <Widget>[
						if(type == PostDescType.APPROVAL || type == PostDescType.EDIT_POSTS)
						Positioned(
                      right: 16,
                      top:0,
                      child: Container(
                              padding: const EdgeInsets.only(left:10),
                              child: posts[index].type.toLowerCase() == schema.typePermisssion?
                              SpinKitThreeBounce(size:20,
                                color: Theme.of(context).accentColor,)
                              : const Icon(Ionicons.ios_checkmark_done,color: Colors.green,))
                            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 40.0, 0.0),
                      child: AutoSizeText(posts[index].sub[0].toString(),
                          //                                  'Science and Texhnology Council',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.blueGrey
                                    : Colors.white70,
                            // fontWeight: FontStyle.italic,
                            fontSize: 10.0,
                          )),
                    ),
                  ],
                ),
                Container(
                  // alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 10.0),
                  child: AutoSizeText(posts[index].title,
                      // 'Sit commodo fugiat duis consectetur sunt ipsum cupidatat adipisicing mollit et magna duis.',
                      minFontSize: 15.0,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      )),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 5.0),
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 84.0,
                  ),
                  child: AutoSizeText(
                    // timenot['message'],
                    posts[index].message,
                    // 'Dolor consectetur in dolore anim reprehenderit velit pariatur veniam nostrud id ex exercitation.',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey[850]
                          : Colors.white70,
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 5.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      convertDateToString(posts[index].timeStamp) +
                          ' at ' +
                          DateFormat("hh:mm a").format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  posts[index].timeStamp)),
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.grey
                            : Colors.white70,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
	}
}

class NoItemTile extends StatelessWidget {
	final String value;

  const NoItemTile({Key? key,required this.value}) : super(key: key);
	@override
	Widget build(BuildContext context) {
		return Center(
		  child: SizedBox(
      height: 80.0,
      child: Center(
    		child: Text(
          value
      	),
      ),
    ),
		);
	}
}