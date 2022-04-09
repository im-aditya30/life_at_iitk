import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

String convertDateToString(int time){
	final DateTime postTime = DateTime.fromMillisecondsSinceEpoch(time);
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year,now.month,now.day - 1);
  final aDate = DateTime(postTime.year,postTime.month,postTime.day);
  if(aDate == today){
    return 'Today';
  }else if(aDate == yesterday){
    return 'Yesterday';
  }else{
     return DateFormat("dd MMMM, yyyy").format(postTime);
  }
}

Option<String> convertToStartTime(int startTime, int endTime) {
	final DateTime _time  = DateTime.now();
	final end = DateTime.fromMillisecondsSinceEpoch(endTime);
	final diff = end.difference(_time);
	// if(end.hour == 22)
	// print(diff.inHours);
// ignore: prefer_interpolation_to_compose_strings
	if(diff.inHours >= 48 && diff.inDays < 30) {
		return optionOf("Ends in ${diff.inDays} days");
	} else if(diff.inHours >= 24 && diff.inDays < 30){
		final _hours = diff.inHours-24 == 0? "" : " and about ${diff.inHours-24} hour";
		// final _min = diff.inMinutes%(diff.inHours * 60) == 0? "00" : "${diff.inMinutes%(diff.inHours * 60)}";
		// final String addOnMin =  diff.inMinutes <2? '':'s';
		final String addOnHour = (diff.inHours-24) <2? '':'s';
		return optionOf("Ends in a day$_hours$addOnHour");
	}else if (diff.inHours < 24 && diff.inMinutes/60 >1){
		// final _hours = diff.inHours == 0? "00" : "${diff.inHours}";
		final _hours = diff.inHours == 0? "" : "${diff.inHours} hour";
		final String addOnHour = diff.inHours <2 ? '':'s';
		final temp = diff.inMinutes%(diff.inHours * 60);
		final _min = temp == 0? "" : temp >9 ? "and $temp minute": "and $temp minute";
		final String addOnMin = temp <2 ? '':'s';
		return optionOf("Ends in $_hours$addOnHour $_min$addOnMin");
	}else if(diff.inMinutes <60) {
		final temp = diff.inMinutes ;
		final _min = temp == 0? "00" : "${temp >9 ? temp: "0" + "$temp"}";
		final String addOn = temp <2? '':'s';
		// log(temp.toString() + ' ' + _min, name:'Time');
		if(diff.isNegative) return optionOf("About to End");
		return optionOf("${"Ends in $_min minute"}$addOn");
	}else return optionOf(null);
}

Option<String> convertToEndTime(int startTime, int endTime) {
	final DateTime _time  = DateTime.now();
	final start = DateTime.fromMillisecondsSinceEpoch(startTime);
	final diff = start.difference(_time);
	// print('$start' + ' ' + '$diff');
	
	if(diff.inHours > 48 && diff.inDays < 30) {
		return optionOf("Starts in ${diff.inDays} days");
	} else if(diff.inHours >= 24 && diff.inDays < 30){
		final _hours = diff.inHours-24 == 0? "" : " and about ${diff.inHours-24} hour";
		// final _min = diff.inMinutes%(diff.inHours * 60) == 0? "00" : "${diff.inMinutes%(diff.inHours * 60)}";
		// final String addOnMin =  diff.inMinutes <2? '':'s';
		final String addOnHour = (diff.inHours-24) <2? '':'s';
		// return optionOf("Ends in a day$_hours$addOnHour");
		// final _hours = diff.inHours-24 == 0? "00" : "${diff.inHours-24}";
		// final _min = diff.inMinutes%(diff.inHours * 60) == 0? "00" : "${diff.inMinutes%(diff.inHours * 60)}";
		return optionOf("Starts in a day$_hours$addOnHour");
	}else if (diff.inHours < 24 && diff.inMinutes/60 >1){
		final _hours = diff.inHours == 0? "" : "${diff.inHours} hour";
		final String addOnHour = diff.inHours <2 ? '':'s';
		final temp = diff.inMinutes%(diff.inHours * 60);
		final _min = temp == 0? "" : temp >9 ? "and $temp minute": "and $temp minute";
		final String addOnMin = temp <2 ? '':'s';
		return optionOf("Starts in $_hours$addOnHour $_min$addOnMin");
	}else if(diff.inMinutes <60) {
		final temp = diff.inMinutes ;
		final _min = temp == 0? "00" : "${temp >9 ? temp: "0" + "$temp"}";
		final String addOn = temp <2? '':'s';
		log(temp.toString() + ' ' + _min, name:'Time');
		if(diff.isNegative) return optionOf("Starting now");
		return optionOf("${"Starts in $_min minute"}$addOn");
	}else if((diff.inDays/365)>0) {
		return optionOf(null);
	}else return optionOf(null);
}