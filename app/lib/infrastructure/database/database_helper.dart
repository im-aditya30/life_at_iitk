import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite/sql.dart';
import '../../domain/models/posts.dart';
import '../core/extensions.dart';
import '../database/database_class.dart';

extension BatchX on Batch {
	Future<void> addPost(GetDatabase db, Database database,Post post) async {
		final res = await database.query(db.table, where: "${db.id} = ?", whereArgs: [post.id] );
		if(res.isEmpty){
			insert(db.table, post.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
		}else{
			update(db.table, post.toMap().removeObjects(db),
			 	where: "${db.id} = ?", whereArgs: [post.id], conflictAlgorithm: ConflictAlgorithm.replace);
		}
	}
}