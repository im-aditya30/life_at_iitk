
import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/hive/council.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/functions.dart';
import 'package:life_at_iitk/presentation/core/widgets/animated_list.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
// import 'package:life_at_iitk/presentation/core/widgets/post_tile.dart' hide PostTile;

import '../../../hive_extension.dart';
import '../../../injection.dart';

class UpdateDraftsPage extends StatelessWidget {
  final bool isUpdate;

  const UpdateDraftsPage({Key ?key, required this.isUpdate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final councilData = Hive.getData<Council>();
    final userData = Hive.getData<User>();
		// print(councilData.toMap());
    if ([1,0].contains(councilData.coordOfCouncil.length)) {
      return CustomScaffold(
        title: isUpdate ? 'Update Posts' : 'Drafts',
        body: buildList(councilData.coordOfCouncil[0], userData, councilData)
      );
    } else {
      return DefaultTabController(
          length: councilData.coordOfCouncil.length,
          child: CustomScaffold(
            appBar: AppBar(
              title: Text(isUpdate ? 'Update Posts' : 'Draftsf',
								style: TextStyle(
									color: CustomColors(context).textColor,
									fontFamily: CustomColors(context).fontFamily
								),
							),
              centerTitle: true,
              bottom: TabBar(
								tabs: [
                for (var i in councilData.coordOfCouncil)
                  Tab(
                    text: convertToCouncilName(i),
                  )
              ]),
            ),
            body: TabBarView(children: [
              for (var i in councilData.coordOfCouncil)
                buildList(i, userData, councilData)
            ]),
          ));
    }
  }

  Widget buildList(String council, User userData, Council councilData) {
    return StreamBuilder<List<Post>>(
      initialData: const [],
      stream: getIt<PostDBInterface>().watchUpdateDraftSection(
          council: council, isUpdate: isUpdate, owner: userData.id!),
      builder: (BuildContext context, snapshot) {
          final text = councilData.coordOfCouncil.length == 1
              ? 'try creating one'
              : 'under this council';
				return CustomAnimatedList(
					snapshot: snapshot,
					notItemVal: isUpdate
                      ? 'You have not made any post $text'
                      : 'You have not saved any post $text',
					type: isUpdate ?
						PostDescType.EDIT_POSTS
						: PostDescType.DRAFT_POSTS,
				);
			}
    );
  }
	Future<bool?> confirmDismissDialog(List<PostTile> posts,GlobalKey<AnimatedListState>_listKey,int index,BuildContext context) {
    return showDialog<bool>(
      barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Row(
                children: const [
                  Icon(
                    Icons.warning,
                    color: Colors.red,
                  ),
                  Text(
                    ' Delete this Post ?',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              content: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      isUpdate?
                      'Doing this will remove this post for everyone'
                     : 'Doing this will permanently delete this file',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5.0),
                    const Text(
                        'Note: You will not be able to recover this post later',
                        style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context,false);
                          },
                          child: const Text('Dismiss'),
                        ),
                        const SizedBox(width: 10.0),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          onPressed: () async {
														Toast.createInformation(message: 'Deleting post').show(context);
                            Navigator.pop(context);

                            try{
                            }catch(e){
                              log(e.toString());
                              // return false; TODO:Check it
                            }
                          },
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ]));
        });
  }
  Future<bool> deletePostFromList(Post posts)async{
    if (posts.url.isNotEmpty) {
      clearSelection(posts.url);
    }
        return false;
  }
  Future<bool> clearSelection(String url) async {
    try {
      final Reference storageReference =
        FirebaseStorage.instance.refFromURL(url);
      return await storageReference.delete().then((_) {
        return true;
      });  
    } catch (e) {
      // log(e);
      return false;
    }
}
}