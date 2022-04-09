import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/domain/core/functions.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/models/posts.dart' as p;
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';
import 'package:life_at_iitk/presentation/core/widgets/post_tile.dart';

import '../../../hive_extension.dart';
import '../../routes/router.gr.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
	 DateTime? timeOfRefresh ;
		// useEffect((){
			
		// },[]);
    final userData = Hive.getData<User>();
    return DefaultTabController(
      length: 2,
      child: CustomScaffold(
          appBar: AppBar(
            title: Text('Posts',
							style: const TextStyle().copyWith(
								fontFamily: CustomColors(context).fontFamily,
								color: CustomColors(context).textColor)
						),
            bottom: const TabBar(
              tabs: [
                Tab(child: Center(child: Text('Posts'))),
                Tab(child: Center(child: Text('All Posts'))),
              ],
            ),
						actions: [
							IconButton(
								icon: const Icon(Icons.search),
								onPressed: () async{
									final posts = await getIt<PostDBInterface>().getAllPosts();
									context.router.push(PostSearchRoute(posts: posts, type: 'hello'));
								},
							)
						],
          ),
          body: TabBarView(children: [
            RefreshIndicator(
									key: const Key("post"),
									onRefresh: () async{
										if(timeOfRefresh ==null || DateTime.now().second - timeOfRefresh.second > 3){
											context.read<ApiBloc>().add(const ApiEvent.fetchAllPost(timeStamp: 1));
										}else{
											await Future.delayed(const Duration(seconds: 2) , () => true);
										}
										BlocListener<ApiBloc, ApiState>(
											listener: (context, state) async{
												await Future.doWhile(() => state.value.getOrElse(() => null) != null);
											},
											listenWhen: (p,c) => p.load.difference(c.load).isEmpty,
										);
									},

							child: SizedBox.expand(
							  child: StreamBuilder<List<p.Post>>(
							  	initialData: const [],
							  	stream: getIt<PostDBInterface>()
							  			.watchPostsWithPrefs(userData.prefs,30),
							  	builder: (context, snapshot) {
							  		if (snapshot.hasData ||
							  				snapshot.connectionState != ConnectionState.waiting)
							  			// ignore: curly_braces_in_flow_control_structures
							  			return snapshot.data?.isNotEmpty == true
							  					? ListView.builder(
							  							padding:
							  									const EdgeInsets.symmetric(vertical: 6),
							  							itemCount: snapshot.data!.length,
							  							itemBuilder: (context, index) {
							  								final array = snapshot.data;
							  								final i = array![index];
							  								i.copyWith(
							  										dateAsString:
							  												convertDateToString(i.timeStamp));
							  								if (i.dateAsString == 'Today') {
							  									return Column(
							  										children: [
							  											if (index == 0)
							  												Padding(
							  												  padding: const EdgeInsets.only(top: 4.0),
							  												  child: Center(child: Text(i.dateAsString)),
							  												),
							  											StreamBuilder(
							  													stream: Stream.periodic(
							  															const Duration(minutes: 1)),
							  													builder: (context, _) {
							  														return Padding(
							  															padding:
							  																	const EdgeInsets.fromLTRB(
							  																			12, 6, 12, 0),
							  															child: PostTile(
							  																	key: ValueKey(snapshot
							  																			.data![index].id),
							  																	posts: snapshot.data!,
							  																type: PostDescType.DISPLAY,
							  																	index: index,
							  																	callback: () {}),
							  														);
							  													})
							  										],
							  									);
							  								}
							  								return Column(
							  									children: [
							  										if (array.firstWhere((test) =>
							  														convertDateToString(
							  																test.timeStamp) ==
							  														i.dateAsString) ==
							  												i)
							  											Padding(
							  											  padding: const EdgeInsets.only(top: 8.0),
							  											  child: Center(child: Text(i.dateAsString)),
							  											),
							  										Padding(
							  											padding: const EdgeInsets.fromLTRB(
							  													12, 6, 12, 0),
							  											child: PostTile(
							  												key:
							  														ValueKey(snapshot.data![index].id),
							  																type: PostDescType.DISPLAY,
							  												posts: snapshot.data!,
							  												index: index,
							  												callback: () {},
							  											),
							  										)
							  									],
							  								);
							  							},
							  						)
							  					: Center(
							  					  child: ListView(
														physics: const AlwaysScrollableScrollPhysics(),
							  					    children: [
							  					      const NoItemTile(
							  					      		value: 'No post available right now',
							  					      	),
							  					    ],
							  					  ),
							  					);
							  		return InfiniteLoader();
							  	},
							  ),
							),
            ),
            RefreshIndicator(
									key: const Key("all"),
									onRefresh: () async{
										if(timeOfRefresh == null || DateTime.now().second - timeOfRefresh.second > 5){
											// print('Refresh all');
											context.read<ApiBloc>().add(const ApiEvent.fetchAllPost(timeStamp: 0));
										}else{
											await Future.delayed(const Duration(seconds: 2) , () => true);
										}
										BlocListener<ApiBloc, ApiState>(
											listener: (context, state) async{
												await Future.doWhile(() => state.value.getOrElse(() => null) != null);
											},
											listenWhen: (p,c) => p.load.difference(c.load).isEmpty,
										);
									},
          child: SizedBox.expand(
            child: StreamBuilder<List<p.Post>>(
              initialData: const [],
              stream: getIt<PostDBInterface>().watchAllPosts(),
              builder: (context, snapshot) {
								// log('${snapshot.data}', name: 'POST LIST');
                if (snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done)
                  // ignore: curly_braces_in_flow_control_structures
                  return snapshot.data?.isNotEmpty == true
                      ? ListView.builder(
                          padding:
                              const EdgeInsets.symmetric(vertical: 6),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final array = snapshot.data;
                            final i = array![index];
                            i.copyWith(
                                dateAsString:
                                    convertDateToString(i.timeStamp));
                            if (i.dateAsString == 'Today') {
                              return Column(
                                children: [
                                  if (index == 0)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Center(child: Text(i.dateAsString)),
                                    ),
                                  StreamBuilder(
                                      stream: Stream.periodic(
                                          const Duration(minutes: 1)),
                                      builder: (context, _) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.fromLTRB(
                                                  12, 6, 12, 0),
                                          child: PostTile(
                                              key: ValueKey(snapshot
                                                  .data![index].id),
                                              posts: snapshot.data!,
                                              index: index,
																										type: PostDescType.DISPLAY,
                                              callback: () {}),
                                        );
                                      })
                                ],
                              );
                            }
                            return Column(
                              children: [
                                if (array.firstWhere((test) =>
                                        convertDateToString(
                                            test.timeStamp) ==
                                        i.dateAsString) ==
                                    i)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Center(child: Text(i.dateAsString)),
                                  ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      12, 6, 12, 0),
                                  child: PostTile(
                                    key:
                                        ValueKey(snapshot.data![index].id),
																					
																						type: PostDescType.DISPLAY,
                                    posts: snapshot.data!,
                                    index: index,
                                    callback: () {},
                                  ),
                                )
                              ],
                            );
                          },
                        )
                      : ListView(
												physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          const NoItemTile(
                              value: 'No post available right now',
                            ),
                        ],
                      );
                return InfiniteLoader();
              },
            ),
          ),
            ),
          ])),
    );
  }
}
