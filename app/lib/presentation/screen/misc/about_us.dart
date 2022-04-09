import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_at_iitk/presentation/core/functions.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "About Us",
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Card(
                  margin: const EdgeInsets.all(16.0),
                  shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/wdLogo.png'),
                          radius: 60,
                        ),
                        // Text('The wait is over presenting an App that is made entirely for the IITK janta so as to limit their spamming of mailbox'),
                        const SizedBox(height: 10),
                        Chip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              // Icon(Icons.copyright),
                              // SizedBox(width: 10.0),
                              Text('Made by Web Division IITK'),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                  icon: const Icon(AntDesign.mail),
                                  iconSize: 30.0,
                                  splashColor: Colors.blueGrey,
                                  onPressed: () {
                                    launchMail('webdivisioniitk@gmail.com',context);
                                  }),
                              IconButton(
                                  icon: const Icon(FontAwesome.slack),
                                  iconSize: 30.0,
                                  splashColor: Colors.blueGrey,
                                  onPressed: () {
                                    launchUrl(
                                    'https://webdivisionworkspace.slack.com',context);
                                  }),
                              IconButton(
                                  icon: const Icon(FontAwesome.facebook_square),
                                  splashColor: Colors.blueGrey,
                                  iconSize: 30.0,
                                  onPressed: () {
                                    launchUrl(
                                        'https://www.facebook.com/webdivisioniitk',context);
                                  }),
                              IconButton(
                                  icon: const Icon(FontAwesome.linkedin_square),
                                  // tooltip:,
                                  splashColor: Colors.blueGrey,
                                  iconSize: 30.0,
                                  onPressed: () {
                                    launchUrl(
                                        'https://www.linkedin.com/company/42830702',context);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // margin
                ),
                const Chip(label: Text('Developers')),
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 50.0,
                    margin: const EdgeInsets.all(16.0),
                    // child:SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                              width: 230.0,
                              height: 300.0,
                              child: Material(
                                  elevation: 6.0,
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/Aditya.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                      Positioned(
                                        bottom: 0.0,
                                        child: Container(
                                          width: 230.0,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.fromLTRB(
                                            00.0,
                                            10.0,
                                            0.0,
                                            10.0,
                                          ),
                                          color: Colors.black.withOpacity(0.4),
                                          child: const Text('Aditya Gupta',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ))),

                          Container(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(AntDesign.github),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      launchUrl('https://github.com/im-aditya30',context);
                                    }),
                                IconButton(
                                    icon: const Icon(FontAwesome.linkedin_square),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      launchUrl(
                                          'https://www.linkedin.com/in/aditya-gupta-7689391a8/',context);
                                    }),
                                IconButton(
                                    icon: const Icon(FontAwesome.facebook_square),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      launchUrl(
                                          'https://www.facebook.com/solisaditya',context);
                                    }),
                                // IconButton(icon: Icon(MaterialCommunityIcons.web),
                                //   iconSize: 30.0,
                                //  onPressed: (){}),
                              ],
                            ),
                          ),
                          SizedBox(
                              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
                              // height: MediaQuery.of(context).size.height*0.4,
                              height: 300.0,
                              width: 230.0,
                              child: Material(
                                  elevation: 6.0,
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 300.0,
                                        width: 230.0,
                                        child: Image.asset(
                                          'assets/Utkarsh1.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0.0,
                                        // width: double.maxFinite,
                                        // left: 20.0,
                                        // padding: const EdgeInsets.symmetric(vertical:10.0),
                                        child: Container(
                                          width: 230.0,
                                          alignment: Alignment.center,
                                          // width: double.maxFinite,
                                          padding: const EdgeInsets.fromLTRB(
                                            0.0,
                                            10.0,
                                            0.0,
                                            10.0,
                                          ),
                                          color: Colors.black.withOpacity(0.4),
                                          child: const Text('Utkarsh Gupta',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                                // fontFamily: 'Comfortaa',
                                              )),
                                        ),
                                      ),
                                    ],
                                  ))),
                          // Text('Utkarsh Gupta'),
                          Container(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(AntDesign.github),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      launchUrl('https://github.com/utkarshg99',context);
                                    }),
                                IconButton(
                                    icon: const Icon(FontAwesome.linkedin_square),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      launchUrl(
                                          'https://www.linkedin.com/in/utkarshg99/',context);
                                    }),
                                IconButton(
                                    icon: const Icon(FontAwesome.facebook_square),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      launchUrl(
                                          'https://www.facebook.com/utkarshg99',context);
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
