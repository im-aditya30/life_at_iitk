extension ListX<T> on List<T> {
	/// returns the first element or null
	T? get firstElement {
		if(isNotEmpty == true) return first;
		return null;
	}
}