// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:url_launcher/url_launcher.dart';

String convertFromCouncilName(String name) {
  switch (name) {
    case 'SnT':
      return 'snt';
      break;
    case 'SS':
      return 'ss';
      break;
    case 'MnC':
      return 'mnc';
      break;
    case 'AnC UG':
      return 'anc_ug';
      break;
    case 'AnC PG':
      return 'anc_pg';
      break;
    case 'GnS':
      return 'gns';
      break;
    case 'AnC':
      return 'anc';
      break;
    case 'PSG':
      return 'psg';
      break;
    default:
      return name.toLowerCase();
  }
}

String convertToCouncilName(String council) {
  switch (council) {
    case 'snt':
      return 'SnT';
      break;
    case 'ss':
      return 'SS';
      break;
    case 'mnc':
      return 'MnC';
      break;
    case 'anc_pg':
      return 'AnC PG';
      break;
    case 'anc_ug':
      return 'AnC UG';
      break;
    case 'gns':
      return 'GnS';
      break;
    case 'anc':
      return 'AnC';
      break;
    case 'psg':
      return 'PSG';
      break;
    case 'cs':
      return 'CS';
    default:
      return council == null
          ? 'null'
          : council[0].toUpperCase() + council.substring(1).toLowerCase();
  }
}

String councilNameTOfullForms(String council) {
  // print(council);
  switch (council.toLowerCase()) {
    case 'snt':
      return 'Science and Technology Council';
    case 'mnc':
      return 'Media and Cultural Council';
      break;
    case 'anc':
      return 'Academic and Career Council';
      break;
    case 'gns':
      return 'Games and Sports Council';
      break;
    case 'psg':
      return 'President Students Gymkhana';
      break;
    case 'senate':
      return 'Students Senate';
      break;
    case 'cs':
      return 'Councelling Service';
    // case 'gns': return 'Games and Sports Council';
    // break;
    // case 'gns': return 'Games and Sports Council';
    // break;
    // case 'ss':return 'Students\' Senate';
    // break;
    default:
      return council;
  }
}

/// function to determine no. of days in a amonth. Can be used for last date of month.
/// Here month and year are [int]
int noOfDaysInMonths(int month, int year) {
  int leapYear() => 29;
  int notLeapYear() => 28;
  int divisibleBy400(year) {
    if (year % 400 == 0)
      return leapYear();
    else
      return notLeapYear();
  }

  int divisibleBy100(year) {
    if (year % 100 == 0)
      return divisibleBy400(year);
    else
      return leapYear();
  }

  if (month == 2) {
    if (year % 4 == 0) return divisibleBy100(year);
    return notLeapYear();
  } else if (month < 8) {
    if (month % 2 != 0) return 31;
    return 30;
  } else {
    if (month % 2 == 0) return 31;
    return 30;
  }
}

String convertAbbrvofDeptToFF(String abbrv) {
  switch (abbrv.toLowerCase()) {
    case 'ae':
      return 'Aerospace Engg.';
      break;
    case 'bsbe':
      return 'Biol.Sci. And Bio.Engg.';
      break;
    case 'ce':
      return 'Civil Engg.';
      break;
    case 'che':
      return 'Chemical Engg.';
      break;
    case 'chm':
      return 'Chemistry';
      break;
    case 'cse':
      return 'Computer Science & Engg.';
      break;
    case 'doaa':
      return 'Dean Of Academic Affairs';
      break;
    case 'dora':
      return 'Dean Of Resource & Alumni';
      break;
    case 'eco':
      return 'Economics';
      break;
    case 'ee':
      return 'Electrical Engg.';
      break;
    case 'eem':
      return 'Environmental Engg. & Mgmt';
      break;
    case 'es':
      return 'Earth Sciences';
      break;
    case 'hss':
      return 'Humanities & Soc. Sciences';
      break;
    case 'ime':
      return 'Ind. & Management Engg.';
      break;
    case 'me':
      return 'Mechanical Engineering';
      break;
    case 'mse':
      return 'Materials Science & Engg.';
      break;
    case 'mth':
      return 'Mathematics';
      break;
    case 'nucc.eng.&techprog.':
      return 'Nuc. Engg.& Tech Prog.';
      break;
    case 'phy':
      return 'Physics';
      // break;
		// case 'statistics': return 'Statistics';
		// case 'cg': return 'Cognitive Sciences';
		// case 'laser technology': return 'Laser Technology';
		// case 'dean of research & development': return 'Dean Of Research & Development';
    default:
      return abbrv;
  }
}

bool isUrl(String text) {
  final urlRegex =
      RegExp(r'((https?:\/\/)|(www.))[^\s]+\w(\/)?', caseSensitive: false);
  return text.contains(urlRegex) == true;
}

// ignore: avoid_void_async
Future<void> launchUrl(String link, BuildContext context) async {
  if (isUrl(link))
  // ignore: curly_braces_in_flow_control_structures
  if (link.startsWith(RegExp(r'(https?:\/\/)')) == false) {
    link = "https://$link";
    if (await canLaunch(link) == false) link = "http://$link";
  }
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    Toast.createError(message: 'Could not launch url').show(context);
  }
}

Future launchCaller(String number, BuildContext context) async {
  final url = "tel:$number";
  if (await canLaunch(url)) {
    await launch(url);
  }
  Toast.createError(message: 'Could not launch number').show(context);
}

void launchMail(String mailId, BuildContext context) async {
  final uri = 'mailto:$mailId?subject=&body=';
  if (await canLaunch(uri)) {
    await launch(uri);
  }
  Toast.createError(message: 'Could not launch mail app').show(context);
}


DateTime convertDateFromStringToDateTime(String date){
  //02:45 PM, 20 April, 2020
  // print(date.substring(13,(date.length - 6)));
  int hour = double.parse(date.substring(0,2)).round();
  final int minute = double.parse(date.substring(3,5)).round();
  final String amPm = date.substring(6,8);
  if(amPm == 'PM' && hour !=12){
    hour +=12;
  }else if(amPm == "AM" && hour == 12){
    hour = 0;}
  final int day = double.parse(date.substring(10,12)).round();
  final int year = double.parse(date.substring(date.length - 4, date.length)).round();
  final String month = date.substring(13,date.length - 6);
  return DateTime(year,convertMonthFromStringToInt(month), day,hour,minute);
}

int convertMonthFromStringToInt(String month){
  switch (month.toLowerCase()) {
    case 'january': return 1;
      break;
    case 'february': return 2;
      break;
    case 'march': return 3;
      break;
    case 'april': return 4;
      break;
    case 'may': return 5;
      break;
    case 'june': return 6;
      break;
    case 'july': return 7;
      break;
    case 'august': return 8;
      break;
    case 'september': return 9;
      break;
    case 'october': return 10;
      break;
    case 'november': return 11;
    case 'december': return 12;
    default: return 12;
  }
}