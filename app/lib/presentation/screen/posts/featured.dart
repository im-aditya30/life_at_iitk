import 'package:flutter/material.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';
import 'package:life_at_iitk/presentation/core/widgets/post_tile.dart';

import '../../../injection.dart';

class Featured extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return CustomScaffold(
			title: "Featured",
			body: StreamBuilder<List<Post>>(
				initialData: const [],
				stream: getIt<PostDBInterface>().watchAllFeaturedPosts(),
				builder: (context, snapshot) {
					// print(snapshot);
					if(snapshot.hasData || snapshot.connectionState != ConnectionState.waiting)
      // ignore: curly_braces_in_flow_control_structures
						return SizedBox.expand(
							child: snapshot.data?.isNotEmpty == true?
								ListView.builder(
									itemCount: snapshot.data!.length,
									itemBuilder: (context, index) {
										return Padding(
										  padding: const EdgeInsets.all(12.0),
										  child: GeneralPostTile(posts: snapshot.data!, index: index, isEnabled: true,type: PostDescType.NOTICE),
										);
								},)
								: const NoItemTile(value: 'No featured post available right now',),
						);
					return InfiniteLoader();
				},
			)
		);
	}
}