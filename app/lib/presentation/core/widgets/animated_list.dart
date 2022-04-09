import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/domain/models/posts.dart' as p;
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/core/widgets/post_tile.dart';

import 'loaders.dart';

class CustomAnimatedList extends StatelessWidget {
  // final List<p.PostTile> posts;
  // final int index;
  final PostDescType type;
  final String notItemVal;
  final AsyncSnapshot<List<p.Post>> snapshot;

  const CustomAnimatedList(
      {Key? key,
      // required this.posts,
      // required this.index,
      required this.notItemVal,
      required this.snapshot,
      required this.type})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedListState> _listKey =
        GlobalKey<AnimatedListState>();
    // final isEmpty = useState(posts.isEmpty);
    // return BlocConsumer<PostBloc, PostState>(
    //   listener: (context, state) {
    //     state.maybeMap(
    //       orElse: () {},
    //       loadedPost: (state) {
    //         final index =
    //             posts.indexWhere((element) => element == state.postTile);
    //         if (index == -1) return;
    //         posts.removeAt(index);
    //         _listKey.currentState.removeItem(index,
    //             (context, animation) => SizeTransition(sizeFactor: animation));
    //         if (posts.isEmpty) {
    //           isEmpty.value = true;
    //         }
    //       },
    //       failure: (state) {
    //         final index =
    //             posts.indexWhere((postTile) => postTile == state.postTile);
    //         if (index != -1) {
    //           posts[index] = posts[index].copyWith(isEnabled: true);
    //         }
    //       },
    //     );
    //   },
    //   buildWhen: (p, c) => c.maybeMap(
    //       orElse: () => false, failure: (_) => true, loadedPost: (_) => true),
    //   builder: (context, state) {
    if (snapshot.hasData ||
        snapshot.connectionState == ConnectionState.active ||
        snapshot.connectionState == ConnectionState.done) {
      final posts = snapshot.data!;
      return Column(
        children: [
          Expanded(
            child: RefreshIndicator(
							onRefresh: (){
								getIt<ApiBloc>().add(const ApiEvent.fetchAllPost(timeStamp: 0));
								const bool isLoading = true;
								return Future.doWhile(() => isLoading && (context.read<ApiBloc>().state.load.contains(API.fetchAllPost)));
							},
              child: Center(
                child: ListView.builder(
										shrinkWrap: posts.isEmpty,
										padding:
                            // const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            const EdgeInsets.fromLTRB(12, 12, 12, 0),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          // index = 0;
                          return posts.isEmpty
												? NoItemTile(value: notItemVal)
												: Items(
													posts: posts,
													index: index,
													type: type,
													animationKey: _listKey,
													key: ValueKey(posts[index].id),
													// animation: animation,
												);
                        },
								),
              ),
            )
								// AnimatedList(
                //     key: _listKey,
                //     padding:
                //         // const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                //         const EdgeInsets.fromLTRB(12, 12, 12, 0),
                //     initialItemCount: posts.length,
                //     itemBuilder: (context, index, animation) {
                //       // index = 0;
                //       return Items(
                //         posts: posts,
                //         index: index,
                //         type: type,
                //         animationKey: _listKey,
                //         key: ValueKey(posts[index].id),
                //         animation: animation,
                //       );
                //     },
                //   ),
          ),
        ],
      );
    }
    return InfiniteLoader();
    // }
    // );
  }
}

class Items extends HookWidget {
  const Items({
    Key? key,
    required this.posts,
    // required this.animation,
    required this.index,
    required this.type,
    required this.animationKey,
  }) : super(key: key);

  final List<p.Post> posts;
  // final Animation<double> animation;
  final GlobalKey<AnimatedListState> animationKey;
  final int index;
  final PostDescType type;
  @override
  Widget build(BuildContext context) {
    final isEnabled = useState(true);
    return BlocListener<ApiBloc, ApiState>(
			listenWhen: (p,c) => p.load.contains(API.deltPost) && !c.load.contains(API.deltPost),
      listener: (context, state) {
        // TODO: implement listener
				state.apiFailureOrSuccessOption.fold(
					() {} , (a) {
						a.fold((l) => Toast.createError(message: 'An error occured while deleting post!!!').show(context), (r) {
							// animationKey.currentState?.removeItem(index, (context, animation) {
							// 	return Container();
							// });
						});
					});
      },
      child: Slidable(
        key: ValueKey(posts[index].id),
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions: [
          Card(
						elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            margin: const EdgeInsets.only(left: 12, bottom: 12),
            child: ClipRRect(
							borderRadius:  BorderRadius.circular(16.0),
              child: IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {
                  isEnabled.value = false;
                  // remove from bookmark
                  context
                      .read<ApiBloc>()
                      .add(ApiEvent.deletePost(post: posts[index]));
								Toast.createInformation(message: 'Deleting post!!!').show(context);
                  // posts[index] = posts[index].copyWith(isEnabled: false);
                },
              ),
            ),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GeneralPostTile(
              type: type,
              posts: posts,
              index: index,
              isEnabled: isEnabled.value),
        ),
      ),
    );
  }
}
