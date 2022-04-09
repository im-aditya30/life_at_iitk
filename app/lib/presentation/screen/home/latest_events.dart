import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';

import '../../../domain/core/functions.dart';
import '../../../domain/models/hive/user.dart';
import '../../../domain/models/posts.dart';
import '../../../hive_extension.dart';
import '../../core/widgets/post_tile.dart' as tile;
import '../../routes/router.gr.dart';

class LatestEvents extends HookWidget {
  final int maxPost;
  // final List<Post> posts;

  const LatestEvents({this.maxPost = 2});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<Box<User>>(
            valueListenable: Hive.getBox<User>().listenable(keys: [0]),
            builder: (__, box, _) {
        return StreamBuilder<List<Post>>(
            initialData: const [],
            stream: getIt<PostDBInterface>()
                .watchPostsWithPrefs(box.getUser.prefs, maxPost),
            builder: (context, snapshot) {
              return snapshot.data?.isNotEmpty == true
                  ? Column(
                      children: [
                        ListView.builder(
                          padding: const EdgeInsets.only(top: 10),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length ,
                          itemBuilder: (context, index) {
                            final array = snapshot.data!;
                            final i = array[index];
                            i.copyWith(
                                dateAsString: convertDateToString(i.timeStamp));
                            if (i.dateAsString == 'Today') {
                              return Column(
                                children: [
                                  if (index == 0)
                                    Center(child: Text(i.dateAsString)),
                                  StreamBuilder(
                                      stream: Stream.periodic(
                                          const Duration(minutes: 1)),
                                      builder: (context, _) {
                                        return tile.PostTile(
                                            key: ValueKey(
                                                snapshot.data![index].id),
                                            posts: snapshot.data!,
                                            index: index,
																						type: PostDescType.DISPLAY,
                                            callback: () {});
                                      })
                                ],
                              );
                            }
                            return Column(
                              children: [
                                if (array.firstWhere((test) =>
                                        convertDateToString(test.timeStamp) ==
                                        i.dateAsString) ==
                                    i)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Center(child: Text(i.dateAsString)),
                                  ),
                                tile.PostTile(
                                  key: ValueKey(snapshot.data![index].id),
                                  posts: snapshot.data!,
                                  index: index,
																	type: PostDescType.DISPLAY,
                                  callback: () {},
                                )
                              ],
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => context.router.push(const PostListRoute()),
                            child: const Text('See All ....'),
                          ),
                        )
                      ],
                    )
                  : const tile.NoItemTile(value: 'No post available right now');
            });
						})
      ],
    );
  }
}
