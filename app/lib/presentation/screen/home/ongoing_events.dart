import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_at_iitk/domain/core/functions.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';
import 'package:life_at_iitk/presentation/core/widgets/post_tile.dart';
import 'package:life_at_iitk/presentation/routes/router.gr.dart';
import 'package:auto_route/src/router/auto_router_x.dart';

class OngoingEvents extends StatelessWidget {
	final StreamController<String> streamController;

  const OngoingEvents({Key? key, required this.streamController}) : super(key: key);
	@override
	Widget build(BuildContext context) {
		return StreamBuilder<List<Post>>(
			initialData: const [],
			stream: getIt<PostDBInterface>().watchAllOngoingEvents(),
			builder: (context, snapshot) {
			  if(snapshot.hasData || snapshot.connectionState != ConnectionState.waiting){
					return snapshot.data!.isEmpty ?
						const NoItemTile(value: 'No ongoing events')
						: Column(
						  children: [
						    ListView.builder(
								shrinkWrap: true,
								physics: const NeverScrollableScrollPhysics(),
						    	itemCount: snapshot.data!.length > 1 ? 1 : snapshot.data!.length,
						    	itemBuilder: (context, index) {
																	final time = convertToStartTime(
				snapshot.data![index].startTime!, snapshot.data![index].endTime!);
							  									return StreamBuilder(
							  											stream: time.fold(() => null, (t) {
															if(t.contains('days')) return null;
															return Stream.periodic(const Duration(minutes: 1));
														} ),
							  											builder: (context, _) {
							  												return Padding(
							  													padding:
							  															const EdgeInsets.fromLTRB(
							  																	0, 6, 0, 0),
							  													child: TimeTile(
							  															key: ValueKey(snapshot
							  																	.data![index].id),
							  															posts: snapshot.data!,
																									isOngoing: true,
							  														type: PostDescType.DISPLAY,
							  															index: index,
							  															streamController: streamController),
							  												);
							  											});
							  								}
						    	// },
						    ),
									Align(
										alignment: Alignment.centerRight,
										child: TextButton(
											onPressed: () => context.router.push(const OngoingEventsRoute()),
											child: const Text('See All ....'),
										),
									)
								],
						);
				}
				return InfiniteLoader();
			},
		);
	}
}