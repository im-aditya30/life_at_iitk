// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_class.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PostDomain extends DataClass implements Insertable<PostDomain> {
  final String id;
  final String council;
  final String sub;
  final String type;
  final String owner;
  final String tags;
  final String title;
  final String message;
  final String body;
  final String url;
  final String author;
  final int timeStamp;
  final int? startTime;
  final int? endTime;
  final bool bookmark;
  final bool reminder;
  final bool isFetched;
  final bool isFeatured;
  PostDomain(
      {required this.id,
      required this.council,
      required this.sub,
      required this.type,
      required this.owner,
      required this.tags,
      required this.title,
      required this.message,
      required this.body,
      required this.url,
      required this.author,
      required this.timeStamp,
      this.startTime,
      this.endTime,
      required this.bookmark,
      required this.reminder,
      required this.isFetched,
      required this.isFeatured});
  factory PostDomain.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PostDomain(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      council: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}council'])!,
      sub: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sub'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      owner: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}owner'])!,
      tags: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tags'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message'])!,
      body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      timeStamp: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timeStamp'])!,
      startTime: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}startTime']),
      endTime: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}endTime']),
      bookmark: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bookmark'])!,
      reminder: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reminder'])!,
      isFetched: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}isFetched'])!,
      isFeatured: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}isFeatured'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['council'] = Variable<String>(council);
    map['sub'] = Variable<String>(sub);
    map['type'] = Variable<String>(type);
    map['owner'] = Variable<String>(owner);
    map['tags'] = Variable<String>(tags);
    map['title'] = Variable<String>(title);
    map['message'] = Variable<String>(message);
    map['body'] = Variable<String>(body);
    map['url'] = Variable<String>(url);
    map['author'] = Variable<String>(author);
    map['timeStamp'] = Variable<int>(timeStamp);
    if (!nullToAbsent || startTime != null) {
      map['startTime'] = Variable<int?>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['endTime'] = Variable<int?>(endTime);
    }
    map['bookmark'] = Variable<bool>(bookmark);
    map['reminder'] = Variable<bool>(reminder);
    map['isFetched'] = Variable<bool>(isFetched);
    map['isFeatured'] = Variable<bool>(isFeatured);
    return map;
  }

  PostsCompanion toCompanion(bool nullToAbsent) {
    return PostsCompanion(
      id: Value(id),
      council: Value(council),
      sub: Value(sub),
      type: Value(type),
      owner: Value(owner),
      tags: Value(tags),
      title: Value(title),
      message: Value(message),
      body: Value(body),
      url: Value(url),
      author: Value(author),
      timeStamp: Value(timeStamp),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      bookmark: Value(bookmark),
      reminder: Value(reminder),
      isFetched: Value(isFetched),
      isFeatured: Value(isFeatured),
    );
  }

  factory PostDomain.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostDomain(
      id: serializer.fromJson<String>(json['id']),
      council: serializer.fromJson<String>(json['council']),
      sub: serializer.fromJson<String>(json['sub']),
      type: serializer.fromJson<String>(json['type']),
      owner: serializer.fromJson<String>(json['owner']),
      tags: serializer.fromJson<String>(json['tags']),
      title: serializer.fromJson<String>(json['title']),
      message: serializer.fromJson<String>(json['message']),
      body: serializer.fromJson<String>(json['body']),
      url: serializer.fromJson<String>(json['url']),
      author: serializer.fromJson<String>(json['author']),
      timeStamp: serializer.fromJson<int>(json['timeStamp']),
      startTime: serializer.fromJson<int?>(json['startTime']),
      endTime: serializer.fromJson<int?>(json['endTime']),
      bookmark: serializer.fromJson<bool>(json['bookmark']),
      reminder: serializer.fromJson<bool>(json['reminder']),
      isFetched: serializer.fromJson<bool>(json['isFetched']),
      isFeatured: serializer.fromJson<bool>(json['isFeatured']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'council': serializer.toJson<String>(council),
      'sub': serializer.toJson<String>(sub),
      'type': serializer.toJson<String>(type),
      'owner': serializer.toJson<String>(owner),
      'tags': serializer.toJson<String>(tags),
      'title': serializer.toJson<String>(title),
      'message': serializer.toJson<String>(message),
      'body': serializer.toJson<String>(body),
      'url': serializer.toJson<String>(url),
      'author': serializer.toJson<String>(author),
      'timeStamp': serializer.toJson<int>(timeStamp),
      'startTime': serializer.toJson<int?>(startTime),
      'endTime': serializer.toJson<int?>(endTime),
      'bookmark': serializer.toJson<bool>(bookmark),
      'reminder': serializer.toJson<bool>(reminder),
      'isFetched': serializer.toJson<bool>(isFetched),
      'isFeatured': serializer.toJson<bool>(isFeatured),
    };
  }

  PostDomain copyWith(
          {String? id,
          String? council,
          String? sub,
          String? type,
          String? owner,
          String? tags,
          String? title,
          String? message,
          String? body,
          String? url,
          String? author,
          int? timeStamp,
          int? startTime,
          int? endTime,
          bool? bookmark,
          bool? reminder,
          bool? isFetched,
          bool? isFeatured}) =>
      PostDomain(
        id: id ?? this.id,
        council: council ?? this.council,
        sub: sub ?? this.sub,
        type: type ?? this.type,
        owner: owner ?? this.owner,
        tags: tags ?? this.tags,
        title: title ?? this.title,
        message: message ?? this.message,
        body: body ?? this.body,
        url: url ?? this.url,
        author: author ?? this.author,
        timeStamp: timeStamp ?? this.timeStamp,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        bookmark: bookmark ?? this.bookmark,
        reminder: reminder ?? this.reminder,
        isFetched: isFetched ?? this.isFetched,
        isFeatured: isFeatured ?? this.isFeatured,
      );
  @override
  String toString() {
    return (StringBuffer('PostDomain(')
          ..write('id: $id, ')
          ..write('council: $council, ')
          ..write('sub: $sub, ')
          ..write('type: $type, ')
          ..write('owner: $owner, ')
          ..write('tags: $tags, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('body: $body, ')
          ..write('url: $url, ')
          ..write('author: $author, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('bookmark: $bookmark, ')
          ..write('reminder: $reminder, ')
          ..write('isFetched: $isFetched, ')
          ..write('isFeatured: $isFeatured')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      council,
      sub,
      type,
      owner,
      tags,
      title,
      message,
      body,
      url,
      author,
      timeStamp,
      startTime,
      endTime,
      bookmark,
      reminder,
      isFetched,
      isFeatured);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostDomain &&
          other.id == this.id &&
          other.council == this.council &&
          other.sub == this.sub &&
          other.type == this.type &&
          other.owner == this.owner &&
          other.tags == this.tags &&
          other.title == this.title &&
          other.message == this.message &&
          other.body == this.body &&
          other.url == this.url &&
          other.author == this.author &&
          other.timeStamp == this.timeStamp &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.bookmark == this.bookmark &&
          other.reminder == this.reminder &&
          other.isFetched == this.isFetched &&
          other.isFeatured == this.isFeatured);
}

class PostsCompanion extends UpdateCompanion<PostDomain> {
  final Value<String> id;
  final Value<String> council;
  final Value<String> sub;
  final Value<String> type;
  final Value<String> owner;
  final Value<String> tags;
  final Value<String> title;
  final Value<String> message;
  final Value<String> body;
  final Value<String> url;
  final Value<String> author;
  final Value<int> timeStamp;
  final Value<int?> startTime;
  final Value<int?> endTime;
  final Value<bool> bookmark;
  final Value<bool> reminder;
  final Value<bool> isFetched;
  final Value<bool> isFeatured;
  const PostsCompanion({
    this.id = const Value.absent(),
    this.council = const Value.absent(),
    this.sub = const Value.absent(),
    this.type = const Value.absent(),
    this.owner = const Value.absent(),
    this.tags = const Value.absent(),
    this.title = const Value.absent(),
    this.message = const Value.absent(),
    this.body = const Value.absent(),
    this.url = const Value.absent(),
    this.author = const Value.absent(),
    this.timeStamp = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.bookmark = const Value.absent(),
    this.reminder = const Value.absent(),
    this.isFetched = const Value.absent(),
    this.isFeatured = const Value.absent(),
  });
  PostsCompanion.insert({
    required String id,
    required String council,
    required String sub,
    required String type,
    required String owner,
    required String tags,
    required String title,
    required String message,
    required String body,
    required String url,
    required String author,
    this.timeStamp = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.bookmark = const Value.absent(),
    this.reminder = const Value.absent(),
    this.isFetched = const Value.absent(),
    this.isFeatured = const Value.absent(),
  })  : id = Value(id),
        council = Value(council),
        sub = Value(sub),
        type = Value(type),
        owner = Value(owner),
        tags = Value(tags),
        title = Value(title),
        message = Value(message),
        body = Value(body),
        url = Value(url),
        author = Value(author);
  static Insertable<PostDomain> custom({
    Expression<String>? id,
    Expression<String>? council,
    Expression<String>? sub,
    Expression<String>? type,
    Expression<String>? owner,
    Expression<String>? tags,
    Expression<String>? title,
    Expression<String>? message,
    Expression<String>? body,
    Expression<String>? url,
    Expression<String>? author,
    Expression<int>? timeStamp,
    Expression<int?>? startTime,
    Expression<int?>? endTime,
    Expression<bool>? bookmark,
    Expression<bool>? reminder,
    Expression<bool>? isFetched,
    Expression<bool>? isFeatured,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (council != null) 'council': council,
      if (sub != null) 'sub': sub,
      if (type != null) 'type': type,
      if (owner != null) 'owner': owner,
      if (tags != null) 'tags': tags,
      if (title != null) 'title': title,
      if (message != null) 'message': message,
      if (body != null) 'body': body,
      if (url != null) 'url': url,
      if (author != null) 'author': author,
      if (timeStamp != null) 'timeStamp': timeStamp,
      if (startTime != null) 'startTime': startTime,
      if (endTime != null) 'endTime': endTime,
      if (bookmark != null) 'bookmark': bookmark,
      if (reminder != null) 'reminder': reminder,
      if (isFetched != null) 'isFetched': isFetched,
      if (isFeatured != null) 'isFeatured': isFeatured,
    });
  }

  PostsCompanion copyWith(
      {Value<String>? id,
      Value<String>? council,
      Value<String>? sub,
      Value<String>? type,
      Value<String>? owner,
      Value<String>? tags,
      Value<String>? title,
      Value<String>? message,
      Value<String>? body,
      Value<String>? url,
      Value<String>? author,
      Value<int>? timeStamp,
      Value<int?>? startTime,
      Value<int?>? endTime,
      Value<bool>? bookmark,
      Value<bool>? reminder,
      Value<bool>? isFetched,
      Value<bool>? isFeatured}) {
    return PostsCompanion(
      id: id ?? this.id,
      council: council ?? this.council,
      sub: sub ?? this.sub,
      type: type ?? this.type,
      owner: owner ?? this.owner,
      tags: tags ?? this.tags,
      title: title ?? this.title,
      message: message ?? this.message,
      body: body ?? this.body,
      url: url ?? this.url,
      author: author ?? this.author,
      timeStamp: timeStamp ?? this.timeStamp,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      bookmark: bookmark ?? this.bookmark,
      reminder: reminder ?? this.reminder,
      isFetched: isFetched ?? this.isFetched,
      isFeatured: isFeatured ?? this.isFeatured,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (council.present) {
      map['council'] = Variable<String>(council.value);
    }
    if (sub.present) {
      map['sub'] = Variable<String>(sub.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (owner.present) {
      map['owner'] = Variable<String>(owner.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (timeStamp.present) {
      map['timeStamp'] = Variable<int>(timeStamp.value);
    }
    if (startTime.present) {
      map['startTime'] = Variable<int?>(startTime.value);
    }
    if (endTime.present) {
      map['endTime'] = Variable<int?>(endTime.value);
    }
    if (bookmark.present) {
      map['bookmark'] = Variable<bool>(bookmark.value);
    }
    if (reminder.present) {
      map['reminder'] = Variable<bool>(reminder.value);
    }
    if (isFetched.present) {
      map['isFetched'] = Variable<bool>(isFetched.value);
    }
    if (isFeatured.present) {
      map['isFeatured'] = Variable<bool>(isFeatured.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostsCompanion(')
          ..write('id: $id, ')
          ..write('council: $council, ')
          ..write('sub: $sub, ')
          ..write('type: $type, ')
          ..write('owner: $owner, ')
          ..write('tags: $tags, ')
          ..write('title: $title, ')
          ..write('message: $message, ')
          ..write('body: $body, ')
          ..write('url: $url, ')
          ..write('author: $author, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('bookmark: $bookmark, ')
          ..write('reminder: $reminder, ')
          ..write('isFetched: $isFetched, ')
          ..write('isFeatured: $isFeatured')
          ..write(')'))
        .toString();
  }
}

class $PostsTable extends Posts with TableInfo<$PostsTable, PostDomain> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PostsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _councilMeta = const VerificationMeta('council');
  late final GeneratedColumn<String?> council = GeneratedColumn<String?>(
      'council', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _subMeta = const VerificationMeta('sub');
  late final GeneratedColumn<String?> sub = GeneratedColumn<String?>(
      'sub', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _ownerMeta = const VerificationMeta('owner');
  late final GeneratedColumn<String?> owner = GeneratedColumn<String?>(
      'owner', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  late final GeneratedColumn<String?> tags = GeneratedColumn<String?>(
      'tags', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _messageMeta = const VerificationMeta('message');
  late final GeneratedColumn<String?> message = GeneratedColumn<String?>(
      'message', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _bodyMeta = const VerificationMeta('body');
  late final GeneratedColumn<String?> body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _timeStampMeta = const VerificationMeta('timeStamp');
  late final GeneratedColumn<int?> timeStamp = GeneratedColumn<int?>(
      'timeStamp', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue:
          currentDateAndTime.secondsSinceEpoch * const Constant(1000));
  final VerificationMeta _startTimeMeta = const VerificationMeta('startTime');
  late final GeneratedColumn<int?> startTime = GeneratedColumn<int?>(
      'startTime', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _endTimeMeta = const VerificationMeta('endTime');
  late final GeneratedColumn<int?> endTime = GeneratedColumn<int?>(
      'endTime', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _bookmarkMeta = const VerificationMeta('bookmark');
  late final GeneratedColumn<bool?> bookmark = GeneratedColumn<bool?>(
      'bookmark', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (bookmark IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _reminderMeta = const VerificationMeta('reminder');
  late final GeneratedColumn<bool?> reminder = GeneratedColumn<bool?>(
      'reminder', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (reminder IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isFetchedMeta = const VerificationMeta('isFetched');
  late final GeneratedColumn<bool?> isFetched = GeneratedColumn<bool?>(
      'isFetched', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (isFetched IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isFeaturedMeta = const VerificationMeta('isFeatured');
  late final GeneratedColumn<bool?> isFeatured = GeneratedColumn<bool?>(
      'isFeatured', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (isFeatured IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        council,
        sub,
        type,
        owner,
        tags,
        title,
        message,
        body,
        url,
        author,
        timeStamp,
        startTime,
        endTime,
        bookmark,
        reminder,
        isFetched,
        isFeatured
      ];
  @override
  String get aliasedName => _alias ?? 'posts';
  @override
  String get actualTableName => 'posts';
  @override
  VerificationContext validateIntegrity(Insertable<PostDomain> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('council')) {
      context.handle(_councilMeta,
          council.isAcceptableOrUnknown(data['council']!, _councilMeta));
    } else if (isInserting) {
      context.missing(_councilMeta);
    }
    if (data.containsKey('sub')) {
      context.handle(
          _subMeta, sub.isAcceptableOrUnknown(data['sub']!, _subMeta));
    } else if (isInserting) {
      context.missing(_subMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('owner')) {
      context.handle(
          _ownerMeta, owner.isAcceptableOrUnknown(data['owner']!, _ownerMeta));
    } else if (isInserting) {
      context.missing(_ownerMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _bodyMeta, body.isAcceptableOrUnknown(data['body']!, _bodyMeta));
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('timeStamp')) {
      context.handle(_timeStampMeta,
          timeStamp.isAcceptableOrUnknown(data['timeStamp']!, _timeStampMeta));
    }
    if (data.containsKey('startTime')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['startTime']!, _startTimeMeta));
    }
    if (data.containsKey('endTime')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['endTime']!, _endTimeMeta));
    }
    if (data.containsKey('bookmark')) {
      context.handle(_bookmarkMeta,
          bookmark.isAcceptableOrUnknown(data['bookmark']!, _bookmarkMeta));
    }
    if (data.containsKey('reminder')) {
      context.handle(_reminderMeta,
          reminder.isAcceptableOrUnknown(data['reminder']!, _reminderMeta));
    }
    if (data.containsKey('isFetched')) {
      context.handle(_isFetchedMeta,
          isFetched.isAcceptableOrUnknown(data['isFetched']!, _isFetchedMeta));
    }
    if (data.containsKey('isFeatured')) {
      context.handle(
          _isFeaturedMeta,
          isFeatured.isAcceptableOrUnknown(
              data['isFeatured']!, _isFeaturedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PostDomain map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PostDomain.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PostsTable createAlias(String alias) {
    return $PostsTable(_db, alias);
  }
}

abstract class _$PostDatabase extends GeneratedDatabase {
  _$PostDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PostsTable posts = $PostsTable(this);
  late final PostDao postDao = PostDao(this as PostDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [posts];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$PostDaoMixin on DatabaseAccessor<PostDatabase> {
  $PostsTable get posts => attachedDatabase.posts;
  Future<int> toggleBookmark(bool var1, String var2) {
    return customUpdate(
      'UPDATE posts SET bookmark = ? WHERE id = ?',
      variables: [Variable<bool>(var1), Variable<String>(var2)],
      updates: {posts},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> toggleReminder(bool var1, String var2) {
    return customUpdate(
      'UPDATE posts SET reminder = ? WHERE id = ?',
      variables: [Variable<bool>(var1), Variable<String>(var2)],
      updates: {posts},
      updateKind: UpdateKind.update,
    );
  }
}
