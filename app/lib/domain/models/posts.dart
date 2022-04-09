import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart';
import 'package:life_at_iitk/infrastructure/database/moor/posts/database_class.dart';

import '../core/functions.dart';
import 'basic_schema.dart';

enum PostType{
	none,
	create,
	delete,
	bookmark,
	reminder,
	notFetched,
	fetched
}

// Map<NotfType, String> type = {
// 	NotfType.create : 'create',
// 	NotfType.permission : 'permission',
// 	NotfType.delete : 'delete',
// 	NotfType.draft : 'draft',
// };

enum NotfType {
	create,
	permission,
	delete,
	draft
}
class Post {
  final String id;
  final String author;
  final String council;
  final String owner;
  final List<dynamic> sub;
  final String tags;
  final int timeStamp;
  final String title;
  final String message;
  final String body;
  final String url;
  final String type;
	/// deafult value from Database is null
  final int? startTime;
	/// deafult value from Database is null
  final int? endTime;
  final String dateAsString;
  final bool isFeatured;
  final bool bookmark;
  final bool reminder;

  /// additional information especially for notification handler
  ///
  /// Types are:
  ///
  /// * [BOOKMARK]
  final PostType extras;

  /// if `TRUE` it means that the post is fetched from the database
  final bool isFetched;

  const Post({
    this.id = "",
    this.author = "",
    this.council = "",
    this.owner = "",
    this.sub = const [],
    this.tags = "",
    this.timeStamp= 0,
    this.title= "",
    this.message = "",
    this.body= "",
    this.url = "",
    this.type = "create",
    this.dateAsString = "",
    this.endTime,
    this.startTime,
    this.bookmark = false,
    this.reminder = false,
    this.isFetched = true,
    this.isFeatured = false,
    this.extras = PostType.none,
  });
	static final BasicSchema _basicSchema = BasicSchema();
  Map<String, dynamic> toMap() {
    return {
      _basicSchema.id: id,
      _basicSchema.author: author.isEmpty? owner: author,
      _basicSchema.bookmark: bookmark == true ? 1 : 0,
      _basicSchema.body: body,
      _basicSchema.council: council.toLowerCase(),
      _basicSchema.endTime: endTime ?? 0,
      _basicSchema.isFeatured: isFeatured == true ? 1 : 0,
      _basicSchema.isFetched: isFetched == true ? 1 : 0,
      _basicSchema.message: message,
      _basicSchema.owner: owner,
      _basicSchema.reminder: reminder == true ? 1 : 0,
      _basicSchema.startTime: startTime ?? 0,
      _basicSchema.sub: jsonEncode(sub),
      _basicSchema.tags: tags,
      _basicSchema.timeStamp: timeStamp,
      _basicSchema.title: title,
      _basicSchema.type: type,
      _basicSchema.url: url
    };
  }
	
	/// `[IMP]` Here sub is List instead of String
	Map<String, dynamic> toPostMap() {
		// print(isFeatured);
    return {
      _basicSchema.id: id,
      _basicSchema.author: author.isEmpty? owner: author,
      _basicSchema.council: council.toLowerCase(),
      _basicSchema.owner: owner,
      _basicSchema.sub: sub,
      _basicSchema.tags: tags,
      _basicSchema.timeStamp: timeStamp,
      _basicSchema.title: title,
      _basicSchema.message: message,
      _basicSchema.body: body,
      _basicSchema.url: url ,
      _basicSchema.type: type ,
      _basicSchema.startTime: startTime == null ? '0' : startTime.toString(),
      _basicSchema.endTime: endTime == null ? '0' : endTime.toString(),
      _basicSchema.isFeatured: isFeatured == true ? 1 : 0,
      _basicSchema.bookmark: bookmark == true ? 1 : 0,
      _basicSchema.reminder: reminder == true ? 1 : 0,
      _basicSchema.isFetched: isFetched == true ? 1 : 0,
			_basicSchema.extras: '',
    };
  }
	/// [IMP] Here sub is String
	Map<String, dynamic> toDraftsMap() {
    return {
      _basicSchema.id: /*id.isNotEmpty ? DateTime.now().toIso8601String() : */id,
      _basicSchema.author: author.isEmpty? owner: author,
      _basicSchema.council: council.toLowerCase(),
      _basicSchema.owner: owner,
      _basicSchema.sub: jsonEncode(sub),
      _basicSchema.tags: tags ,
      _basicSchema.timeStamp: timeStamp == 0? DateTime.now().millisecondsSinceEpoch: timeStamp,
      _basicSchema.title: title,
      _basicSchema.message: message,
      _basicSchema.body: body,
      _basicSchema.url: url ,
      _basicSchema.type: type ,
      _basicSchema.startTime: startTime ?? 0,
      _basicSchema.endTime: endTime ?? 0,
      _basicSchema.isFeatured: isFeatured == true,
      _basicSchema.bookmark: bookmark == true,
      _basicSchema.reminder: reminder == true,
      _basicSchema.isFetched: isFetched == true,
			_basicSchema.extras: '',
    };
  }

	 Post copy(Post posts) {      
      return Post(
        id: posts.id,
        author: posts.author,
        council: posts.council,
        owner: posts.owner,
        sub: posts.sub,
        tags: posts.tags,
        timeStamp: posts.timeStamp,
        title: posts.title,
        message: posts.message,
        body: posts.body,
        url: posts.url,
        type: posts.type,
        dateAsString: posts.dateAsString,
        startTime: posts.startTime,
        isFeatured: posts.isFeatured,
        endTime: posts.endTime,
        bookmark: posts.bookmark,
        reminder: posts.reminder,
        isFetched: posts.isFetched,
        extras: posts.extras
      );
    }

  factory Post.fromMap(Map<String, dynamic> ?map) {
    if (map == null) return const Post();
    return Post(
      id: map[_basicSchema.id] as String,
      author: map[_basicSchema.author] == null ? map[_basicSchema.owner] as String : map[_basicSchema.author] as String,
      council: map[_basicSchema.council] as String,
      owner: map[_basicSchema.owner] as String,
      sub: (map[_basicSchema.sub] is List) ?
				map[_basicSchema.sub] as List 
				: (jsonDecode(map[_basicSchema.sub] as String) is List ? 
						jsonDecode(map[_basicSchema.sub] as String) as List
						: [jsonDecode(map[_basicSchema.sub] as String) as String]),
      tags: map[_basicSchema.tags] == null ? "" : map[_basicSchema.tags] as String,
      timeStamp: (map[_basicSchema.timeStamp] is String) ?
			 int.parse(map[_basicSchema.timeStamp] as String) 
			 : map[_basicSchema.timeStamp] as int,
      title: map[_basicSchema.title] as String,
      message: map[_basicSchema.message] as String,
      body: map[_basicSchema.body] as String,
      url: map[_basicSchema.url] == null ? "" : map[_basicSchema.url] as String,
      type: map.containsKey(_basicSchema.type) == true ? map[_basicSchema.type] as String : "create",
      startTime: map[_basicSchema.startTime] == null ?
				0 : (map[_basicSchema.startTime] is String)?
					((map[_basicSchema.startTime] as String).isNotEmpty?
						int.parse(map[_basicSchema.startTime] as String)
						: 0)
						: map[_basicSchema.startTime] as int,
      endTime: map[_basicSchema.endTime] == null ?
				0 : (map[_basicSchema.endTime] is String)?
					((map[_basicSchema.endTime] as String).isNotEmpty?
						int.parse(map[_basicSchema.endTime] as String)
						: 0)
						: map[_basicSchema.endTime] as int,
      dateAsString: convertDateToString(
				(map[_basicSchema.timeStamp] is String) ?
					int.parse(map[_basicSchema.timeStamp] as String) 
					: map[_basicSchema.timeStamp] as int),
			// map['dateAsString'] as String,
      isFeatured: map[_basicSchema.isFeatured] is String ? 
				map[_basicSchema.isFeatured] == 'true' 
				: (map[_basicSchema.isFeatured] is bool ?
						map[_basicSchema.isFeatured] == true
						: map[_basicSchema.isFeatured] == 1),
      bookmark: map[_basicSchema.bookmark] == 1,
      reminder: map[_basicSchema.reminder] == 1,
      isFetched: map[_basicSchema.isFetched] == 1
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source) as Map<String,dynamic>);

  Post copyWith({
    String? id,
    String? author,
    String? council,
    String? owner,
    List<dynamic>? sub,
    String? tags,
    int? timeStamp,
    String? title,
    String? message,
    String? body,
    String? url,
    String? type,
    int? startTime,
    int? endTime,
    String? dateAsString,
    bool? isFeatured,
    bool? bookmark,
    bool? reminder,
    PostType? extras,
    bool? isFetched,
  }) {
    return Post(
      id: id ?? this.id,
      author: author ?? this.author,
      council: council ?? this.council,
      owner: owner ?? this.owner,
      sub: sub ?? this.sub,
      tags: tags ?? this.tags,
      timeStamp: timeStamp ?? this.timeStamp,
      title: title ?? this.title,
      message: message ?? this.message,
      body: body ?? this.body,
      url: url ?? this.url,
      type: type ?? this.type,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      dateAsString: dateAsString ?? this.dateAsString,
      isFeatured: isFeatured ?? this.isFeatured,
      bookmark: bookmark ?? this.bookmark,
      reminder: reminder ?? this.reminder,
      extras: extras ?? this.extras,
      isFetched: isFetched ?? this.isFetched,
    );
  }


	PostDomain get toDomainPost {
		return PostDomain(
			id: id,
			message: message,
			author: author.isEmpty? owner: author,
			owner: owner,
			body: body,
			tags: tags ,
			url: url ,
			sub: sub.first.toString(),
			title: title,
			timeStamp: timeStamp,
			startTime: startTime,
			endTime: endTime,
			council: council.toLowerCase(),
			type: type ,
			bookmark: bookmark,
			isFeatured: isFeatured,
			isFetched: isFetched,
			reminder: reminder,
			
		);
	}

	PostDomain get toDomainDraft {
		return PostDomain(
			id: id.isEmpty? DateTime.now().toIso8601String(): id,
			message: message,
			author: author.isEmpty? owner: author,
			owner: owner,
			body: body,
			tags: tags,
			url: url,
			sub: sub.first.toString(),
			title: title,
			timeStamp: timeStamp,
			startTime: startTime,
			endTime: endTime,
			council: council.toLowerCase(),
			type: type,
			bookmark: bookmark,
			isFeatured: isFeatured,
			isFetched: isFetched,
			reminder: reminder,
			
		);
	}	

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Post &&
      o.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}


class PostTile {
	final Post post;
	final bool isEnabled;

  const PostTile({ required this.post, this.isEnabled = true});

	factory PostTile.empty() => const PostTile(post:  Post());

 // ignore: prefer_constructors_over_static_methods
	static PostTile fromPost(Post post) => PostTile(post: post);

  PostTile copyWith({
    Post? post,
    bool?isEnabled,
  }) {
    return PostTile(
      post: post ?? this.post,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is PostTile &&
      o.post == post;
  }

  @override
  int get hashCode => post.hashCode;
}

// abstract class DatabaseObjects {
//   final String id;
//   final String author;
//   final String council;
//   final String owner;
//   final String sub;
//   final String tags;
//   final String timeStamp;
//   final String title;
//   final String message;
//   final String body;
//   final String url;
//   final String type;
//   final String startTime;
//   final String endTime;
//   final String dateAsString;
//   final String isFeatured;
//   final String bookmark;
//   final String reminder;

//   /// additional information especially for notification handler
//   ///
//   /// Types are:
//   ///
//   /// * [BOOKMARK]
//   final String extras;

//   /// if `TRUE` it means that the post is fetched from the database
//   final String isFetched;

//   const DatabaseObjects({
//     this.id,
//     this.author = "",
//     this.council,
//     this.owner,
//     this.sub,
//     this.tags = "",
//     this.timeStamp,
//     this.title,
//     this.message,
//     this.body,
//     this.url = "",
//     this.type = "create",
//     this.dateAsString = "",
//     this.endTime = 0,
//     this.startTime = 0,
//     this.bookmark = false,
//     this.reminder = false,
//     this.isFetched = true,
//     this.isFeatured = false,
//     this.extras = '',
//   });
//  }