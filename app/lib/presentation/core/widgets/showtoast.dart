// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';

// import '../app.dart';
// import '../colors.dart';


// class ShowToast {
  
//   final bool isInfinite;
//   final String msg;
//   final Widget mainButton;
//   ShowToast({this.isInfinite = false, required this.msg, this.mainButton});
//   BuildContext get context => App.navigatorKey.currentContext;
//   Flushbar get showInfoToast => defaultToast(
//     Icons.info_outline, 
//     null, 
//     null, 
//     Colors.blue, 
//     CustomColors(context).textColor, 
//     null)..show(context) ;
//   Flushbar get showSuccessToast => defaultToast(
//     Feather.check_circle,
//     null, 
//     null,  
//     Colors.green, 
//     CustomColors(context).textColor, 
//     null)..show(context) ;
  
//    Flushbar get showErrorToast => defaultToast(
//     FontAwesome.frown_o,
//     null, 
//     null,  
//     Colors.red, 
//     CustomColors(context).textColor, 
//     null)..show(context) ;

//   Flushbar<dynamic> defaultToast(
//     /// provide null explicitily to ensure no errors
//     IconData leadingIcon,
//     Widget trailingWidget,
//     Duration duration,
//     /// color for text, icon, border
//     Color primaryColor,
//     Color backgroundColor,
//     /// declare explicitily to null
//     Color leftBarColor,
//   ) => Flushbar(
//     icon: leadingIcon == null ? null 
//       : Icon(leadingIcon, 
//         color: primaryColor, size: 30,
//       ),
//     animationDuration: const Duration(milliseconds: 500),
//     borderRadius: 16,
//     messageText: AutoSizeText(msg.toString() ,
//       style: const TextStyle().copyWith(color: primaryColor,),
//       maxFontSize: 25,
//       minFontSize: 16,
//       maxLines: 3,
//       overflow: TextOverflow.ellipsis,
//     ),
//     borderColor: primaryColor,
//     padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//     margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
//     shouldIconPulse: false,
//     backgroundColor: CustomColors(context).bgColor,
//     duration: isInfinite? null : duration ?? const Duration(seconds: 2, milliseconds: 500),
//     mainButton: mainButton, 
//     leftBarIndicatorColor: leftBarColor,
//   );
// }