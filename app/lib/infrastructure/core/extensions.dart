
import '../api/api_endpoints.dart';
import '../database/database_class.dart';

extension AddStringOnURL on String{
	String get addInitialUrl => ApiEndpoints.urlInitials + this;
	

  String appendAtLast(String value) => this + value;

  String appendAtFront(String value) => value + this;
}

extension MapX<K,V> on Map<K,V>{
	/// updates or adds the field to the map and return the new map
	Map<K,V> putOrUpdate(K key, V Function() put) {
		update(key, (_) => put(), ifAbsent: put);
		return this;
	}

	/// removes `extras`, `bookmark`, `reminder` fields from map
	Map<K,V> removeObjects(GetDatabase db){
		remove(db.extras);
		remove(db.bookmark);
		remove(db.reminder);
		return this;
	}
}