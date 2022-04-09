import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:life_at_iitk/domain/core/functions.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/reminders_notfs.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';
import 'package:life_at_iitk/presentation/core/widgets/post_tile.dart' as tile;

import '../../../injection.dart';

class UpcomingEvents extends HookWidget {
  // final StreamController<String> streamController;

  // const UpcomingEvents({Key? key, required this.streamController})
      // : super(key: key);
  @override
  Widget build(BuildContext context) {
    final StreamController<String> streamController = useStreamController();
    final SlidableController slidableController = SlidableController();
    return CustomScaffold(
      title: 'Upcoing Events',
      body: StreamBuilder<String>(
        stream: streamController.stream,
        builder: (context, _) {
          return StreamBuilder<List<Post>>(
            initialData: const [],
            stream: getIt<PostDBInterface>().watchAllUpcomingEvents(),
            builder: (context, snapshot) {
              // log("${snapshot.data}", name: 'Ongoing events');
              if (snapshot.hasData ||
                  snapshot.connectionState != ConnectionState.waiting)
                // ignore: curly_braces_in_flow_control_structures
                return snapshot.data?.isNotEmpty == true
                    ? ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final time = convertToEndTime(
                              snapshot.data![index].startTime!,
                              snapshot.data![index].endTime!);
                            return StreamBuilder(
																		stream: time.fold(() => null, (t) {
																			if (t.contains('days')) return null;
																			return Stream.periodic(
																					const Duration(minutes: 1));
																		}),
																		builder: (context, _) {
																			return Item(
																					posts: snapshot.data!,
																					index: index,
																					slidableController: slidableController,
																					streamController: streamController,
																					time: time);
																		});
                          }
                      )
                    : Center(
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            Padding(
															padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.3),
                              child: const tile.NoItemTile(
                                value: 'No post available right now',
                              ),
                            ),
                          ],
                        ),
                      );
              return InfiniteLoader();
            },
          );
        },
      ),
    );
  }
}

class Item extends HookWidget {
  const Item(
      {Key? key,
      required this.time,
      required this.streamController,
      required this.slidableController,
      required this.posts,
      // required this.animation,
      required this.index
      // required this.ongoingKey

      })
      : super(key: key);
  final Option<String> time;
  final StreamController<String> streamController;
  final SlidableController slidableController;
  // final GlobalKey<AnimatedListState> ongoingKey;
  // final Animation<double> animation;
  final List<Post> posts;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: ValueKey(posts[index].id),
        controller: slidableController,
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            margin: const EdgeInsets.only(bottom: 5, top: 9, right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: IconSlideAction(
                caption: 'Remove',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () async {
                  // remove from bookmark
                  final res = await getIt<PostDBInterface>()
                      .toggleBookmarkReminder(
                          posts[index].copyWith(reminder: false), false);
                  res.fold(
                      (l) => Toast.createError(
                          message:
                              'An error occurred while removing the reminder!!!').show(context),
                      (r) {
                    ReminderNotification(
                            id: posts[index].timeStamp.toSigned(31))
                        .cancel;
                  });
                },
              ),
            ),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
          child: tile.TimeTile(
              key: ValueKey(posts[index].id),
              posts: posts,
              isOngoing: false,
              type: PostDescType.DISPLAY,
              index: index,
              // callback: () {}
              streamController: streamController),
        ));
  }
}
