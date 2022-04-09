import 'package:flutter/material.dart';
import '../../../domain/models/posts.dart';

class CustomDialog {
	static Future<bool?> confirmDialog({
		required List<Post> post,
		required int index,
		required BuildContext context,
		required String title,
		required Function onDelete,
		required Function onCancel,
		required String content,
	}){
		return showDialog<bool>(
			context: context,
			builder: (context) => AlertDialog(
				title: Text(
					title,
				),
			)
		);
	}
}