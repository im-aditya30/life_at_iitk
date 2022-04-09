import '../models/basic_schema.dart';

class Notfs extends BasicSchema{
	// String get id => "id";
	// String get author => "author";
	// String get bookmark => "bookmark";
	// String get body => "body";
	// String get council => "council";
	// String get endTime => "endTime";
	// String get isFeatured => "isFeatured";
	// String get isFetched => "isFetched";
	// String get message => "message";
	String get notfID => "notfID";
	// String get owner => "owner";
	String get priority => "priority";
	// String get reminder => "reminder";
	// String get startTime => "startTime";
	// String get sub => "sub";
	// String get tags => "tags";
	// String get timeStamp => "timeStamp";
	// String get title => "title";
	// String get type => "type";
	// String get url => "url";
	// String get extras => "extras";

	/* Notification types*/ 
	String get typePermisssion => "permission";
	String get typeCreate => "create";
	String get typeUpdate => "update";
	String get typeUniversal => "universal";
	String get typeDelete => "delete";
	String get typeDraft => "draft";
	String get typeFetchField => "fetchField";
	String get typePeople => "people";
	/// points to a users collection
	String get typeSuser => "suser";
	String get typeFetchSData => "fetchSData";
	String get typeFetchFF => "fetchFF";

}