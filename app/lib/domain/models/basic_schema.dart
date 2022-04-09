class BasicSchema {
	/*Post DATABASE Fields*/
	String get id => "id";
	String get author => "author";
	String get bookmark => "bookmark";
	String get body => "body";
	/// Different from councils of allCouncilData
	String get council => "council";
	String get endTime => "endTime";
	String get isFeatured => "isFeatured";
	String get isFetched => "isFetched";
	String get message => "message";
	String get owner => "owner";
	String get reminder => "reminder";
	String get startTime => "startTime";
	String get sub => "sub";
	String get tags => "tags";
	String get timeStamp => "timeStamp";
	String get title => "title";
	String get type => "type";
	String get url => "url";

	/// `NOT INCLUDED` in DATABASE
	String get extras => "extras";
	String get level3 => "level3";
	/// Very different from council as this is used in allCouncilData as a list of councils
	String get councils => "councils";
	String get entity => "entity";
	String get misc => "misc";
	String get admin => "admin";
	String get uid => "uid";
	String get prefs => "prefs";

	/* Student Search DATABASE Fieds */
	String get rollNo => "rollno";
	String get name => "name";
	String get bloodGroup => "bloodGroup";
	String get username => "username";
	String get dept => "dept";
	String get hall => "hall";
	String get hometown => "hometown";
	String get program => "program";
	String get gender => "gender";
	String get room => "room";
	String get year => "year";
}