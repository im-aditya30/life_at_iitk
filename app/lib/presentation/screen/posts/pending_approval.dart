import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/hive/council.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/widgets/animated_list.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/hive_extension.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';
import 'package:life_at_iitk/presentation/core/widgets/post_tile.dart';

class PendingApproval extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final councilData = Hive.getData<Council>();
		final userData = Hive.getData<User>();
		DateTime? timeOfRefresh;
		// print(councilData.toMap());
		return CustomScaffold(
			title: 'Pending Approval',
			body: RefreshIndicator(
				onRefresh: () async{
										if(timeOfRefresh==null || DateTime.now().second - timeOfRefresh!.second > 3){
											context.read<ApiBloc>().add(const ApiEvent.fetchAllPost(timeStamp: 0));
										}else{
											await Future.delayed(const Duration(seconds: 2) , () => true);
										}
										timeOfRefresh = DateTime.now();
										BlocListener<ApiBloc, ApiState>(
											listener: (context, state) async{
												await Future.doWhile(() => state.value.getOrElse(() => null) != null);
											},
											listenWhen: (p,c) => p.load.difference(c.load).isEmpty,
										);
									},
			  child: StreamBuilder<List<Post>>(
			  	initialData: const [] ,
			  	stream: getIt<PostDBInterface>().watchAllPendingApproval(
			  		council: councilData.coordOfCouncil.isEmpty ?"snt": councilData.coordOfCouncil.first, 
			  		isLevel2: userData.isLevel2, 
			  		owner: userData.id!) ,
			  	builder: (BuildContext context, snapshot){
			  		return CustomAnimatedList(
			  			notItemVal: 'You have no pending posts',
			  			snapshot: snapshot,
			  			type: PostDescType.APPROVAL,
			  		);
			  	},
			  ),
			),
		);
	}
}