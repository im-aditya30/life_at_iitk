class ApiEndpoints{
	static const String urlInitials = String.fromEnvironment('URL_INITIAL', defaultValue: 'http://localhost:3000/');
	static String get fetchCouncilData => 'data.json'.addInitialUrl;
	static String get createUserAtDatabase => "createAccount".addInitialUrl;
	static String get sendDeviceToken => "storeDevice".addInitialUrl;
	static String get fetchUserData => "getSuser".addInitialUrl;
	static String get fetchPeopleData => "getPeople".addInitialUrl;
	static String get makeCoordinator => "elevatePerson".addInitialUrl;
	static String get updatePrferences => "updatePrefs".addInitialUrl;
	static String get publishPost => "approvePosts".addInitialUrl;
	static String get requestPostApproval => "makePost".addInitialUrl;
	static String get updatePost => "editPost".addInitialUrl;
	static String get deletePost => "deletePost".addInitialUrl;
	static String get makeDraft => "makeDraft".addInitialUrl;
	static String get publishDraft => "publishDraft".addInitialUrl;
	static String get fetchAllPost => "getPostWithTimestamp".addInitialUrl;
	static String get fetchPostWithId => "getPostWithID".addInitialUrl;
	static String get fetchPostWithTypeCouncil => "getPostWithTypeCouncil".addInitialUrl;
	static String get fetchAllStudentsData => "getAllStudents".addInitialUrl;
	static String get updateStudentData => "updateStudent".addInitialUrl;
	String defaultProfileUrl() {return "";}
}


extension AddStringOnURL on String{
	String get addInitialUrl => ApiEndpoints.urlInitials + this;
	

  String appendAtLast(String value) => this + value;

  String appendAtFront(String value) => value + this;
}