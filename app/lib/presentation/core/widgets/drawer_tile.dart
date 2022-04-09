import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final Widget? routeWidget;
  final Function? onTap;
  final Function? navigation;
  final String title;
  final IconData icon;
  const DrawerTile(
      {this.routeWidget, required this.title, required this.icon, this.onTap,this.navigation})
      : assert(routeWidget != null || onTap != null || navigation != null);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          if(navigation != null){
            Navigator.of(context).pop();
            navigation!();
						return;
          }
          else {onTap!();}
        },
        child: Container(
          height: 55.0,
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            children: <Widget>[
              Icon(icon),
              Container(
                margin: const EdgeInsets.only(left: 32.0, top: 15.0, bottom: 15.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20.0, fontFamily: 'Nunito'),
                ),
              ),
            ],
          ),
        ));
  }
}