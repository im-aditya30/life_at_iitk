
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:life_at_iitk/app/posts/post/post_cubit.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';
import 'package:life_at_iitk/presentation/core/widgets/post_tile.dart' as tile;

class Boookmarks extends StatelessWidget {
  final List<PostTile> posts = [];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: "Bookmarks",
        body: BlocBuilder<PostCubit, PostState>(
					buildWhen: (p,c) => p.maybeMap(orElse: () => false,
						initialisingPage: (_) => c.maybeMap(orElse: () => false,
							loadedPage: (_) => true
						),
					),
          builder: (context, state) {
						posts.addAll(
							state.maybeMap(orElse: ()=>[],
							loadedPage: (p) => p.posts
							)
						);
						return state.maybeMap(orElse: () => true, failure: (_) => false, loadedPage: (_) => false)
                ? InfiniteLoader()
                : !state.maybeMap(orElse: () => false, failure: (_) => true)
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: posts.isEmpty
                            ? const tile.NoItemTile(
                                value: "You haven't bookmarked any post")
                            : BookmarkList(posts: posts),
                      )
                    : const tile.NoItemTile(
                        value: "You haven't bookmarked any post");
          },
        ));
  }
}

class BookmarkList extends HookWidget {
  BookmarkList({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<PostTile> posts;
	final SlidableController slidableController = SlidableController();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedListState> _bookmarkKey =
        GlobalKey<AnimatedListState>();
    final isEmpty = useState(posts.isEmpty);
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          toggleBookmark: (state) {
            final index =
                posts.indexWhere((element) => element == state.postTile);
						if(state.postTile.post.bookmark && state.index != -1) {
							_bookmarkKey.currentState?.insertItem(state.index);
							posts.insert(state.index, state.postTile);
							return;
						}
            if (index == -1) return;
            posts.removeAt(index);
            _bookmarkKey.currentState?.removeItem(index,
                (context, animation) => SizeTransition(sizeFactor: animation));
            if (posts.isEmpty) {
              isEmpty.value = true;
            }
          },
          failure: (state) {
						Toast.createDBError(state.dbFail).show(context);
            final index =
                posts.indexWhere((postTile) => postTile == state.postTile);
            if (index != -1) {
              posts[index] = posts[index].copyWith(isEnabled: true);
            }
          },
        );
      },
      buildWhen: (p, c) => p.maybeMap(
          orElse: () => false, failure: (_) => true, loadedPage: (_) => true) || c.maybeMap(
          orElse: () => false, failure: (_) => true, loadedPage: (_) => true),
      builder: (context, state) {
        return isEmpty.value
            ? const tile.NoItemTile(value: "You haven't bookmarked any post")
            : AnimatedList(
                key: _bookmarkKey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                initialItemCount: posts.length,
                itemBuilder: (context, index, animation) {
                  return Items(
                      posts: posts,
                      animation: animation,
											slidableController: slidableController,
                      index: index,
                      key: ValueKey(posts[index].post.id),
                      isEmpty: isEmpty);
                },
              );
      },
    );
  }
}

class Items extends HookWidget {
  const Items({
    Key? key,
    required this.posts,
    required this.animation,
    required this.index,
    required this.isEmpty,
		required this.slidableController,
  }) : super(key: key);

  final List<PostTile> posts;
  final int index;
  final ValueNotifier<bool> isEmpty;
  final Animation<double> animation;
	final SlidableController slidableController;
	
  @override
  Widget build(BuildContext context) {
    final isEnabled = useState(posts[index].isEnabled);

    return SizeTransition(
      sizeFactor: animation,
      child: Slidable(
        key: ValueKey(posts[index].post.id),
        actionPane: const SlidableDrawerActionPane(),
        enabled: isEnabled.value,
				controller: slidableController,
        secondaryActions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Card(
              elevation: 5,
							shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
              margin: const EdgeInsets.fromLTRB(10.0, 6, 4, 4),
              child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
                child: IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    isEnabled.value = false;
                    // remove from bookmark
                    context
                        .read<PostCubit>().toggleBookmark(posts[index].copyWith(
											post: posts[index].post.copyWith(bookmark: false),
										),index: index);
                    //     .add(PostEvent.toogleBookmark(posts[index], false));
                    // posts[index] = posts[index].copyWith(isEnabled: false);
                  },
                ),
              ),
            ),
          ),
        ],
        child: Container(
					padding: const EdgeInsets.only(top: 4),
          key: ValueKey(posts[index].post.id),
          width: MediaQuery.of(context).size.width,
          constraints: const BoxConstraints(minHeight: 100),
          child: tile.GeneralPostTile(
						posts: posts.map((e) => e.post).toList(), 
						index: index, 
						isEnabled: posts[index].isEnabled, 
						type: PostDescType.DISPLAY)
					// Card(
          //     color: isEnabled.value ? Colors.black : Colors.red,
          //     child: Text(posts[index].post.title)),
        ),
      ),
    );
  }
}
