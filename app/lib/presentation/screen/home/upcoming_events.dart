import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:life_at_iitk/domain/core/functions.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';
import 'package:life_at_iitk/presentation/core/widgets/post_tile.dart';
import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:life_at_iitk/presentation/routes/router.gr.dart';

import '../../../injection.dart';

class UpcomingEvents extends StatelessWidget {
  final StreamController<String> streamController;

  const UpcomingEvents({Key? key, required this.streamController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      initialData: const [],
      stream: getIt<PostDBInterface>().watchAllUpcomingEvents(),
      builder: (context, snapshot) {
        if (snapshot.hasData ||
            snapshot.connectionState != ConnectionState.waiting) {
          if (snapshot.data!.isEmpty)
            return const NoItemTile(value: 'No ongoing events');
          else {
            final List<Widget> upcomingEventList = List.generate(
                snapshot.data!.length > 1 ? 1 : snapshot.data!.length, (index) {
              final time = convertToEndTime(snapshot.data![index].startTime!,
                  snapshot.data![index].endTime!);
                return StreamBuilder(
                    stream: time.fold(() => null, (t) {
                      // print(t);
                      if (t.contains('days')) return null;
                      return Stream.periodic(const Duration(minutes: 1));
                    }),
                    builder: (context, _) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                        child: TimeTile(
                            key: ValueKey(snapshot.data![index].id),
                            posts: snapshot.data!,
                            isOngoing: false,
                            type: PostDescType.DISPLAY,
                            index: index,
																streamController: streamController
                            ),
                      );
                    });
            });
            return Column(children: [
              ...upcomingEventList,
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () =>
                      context.router.push(const UpcomingEventsRoute()),
                  child: const Text('See All ....'),
                ),
              )
            ]);
          }
        }
        return InfiniteLoader();
      },
    );
  }
}
