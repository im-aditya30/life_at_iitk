import 'package:flutter/material.dart';

class ContentLayout extends StatelessWidget {
	final String title;
	final Widget child;
  const ContentLayout({
		Key? key, 
		required this.title, 
		required this.child}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Column(
		  children: [
				Padding(
          padding: const EdgeInsets.only(top:16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20.0
            ),
          ),
        ),
		    Container(
					padding: const EdgeInsets.only(top:16.0,bottom:16.0),
            constraints: const BoxConstraints(minHeight: 80.0),
		      child: Card(
		      	shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(16.0)
					),
		      	child: Container(
		      		padding: const EdgeInsets.fromLTRB(16.0,0,16,0),
		      		child: child
		      	)
		      ),
		    ),
		  ],
		);
	}
}