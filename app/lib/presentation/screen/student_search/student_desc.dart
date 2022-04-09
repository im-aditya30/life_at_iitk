import 'package:dartz/dartz.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_at_iitk/domain/api/api_failure.dart';
import 'package:life_at_iitk/domain/models/student.dart';
import 'package:life_at_iitk/presentation/core/functions.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';

class StudentCard extends StatelessWidget {
  final Student userData;
  final Future<Either<ApiFailure, ImageProvider<Object>>> url;
  const StudentCard(this.userData, this.url);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          Theme.of(context).colorScheme.brightness == Brightness.dark
              ? Colors.blueGrey[800]
              : Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 150.0,
                  constraints: const BoxConstraints(maxHeight: 150.0),
                  child:
                      FutureBuilder<Either<ApiFailure, ImageProvider<Object>>>(
                          future: url,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.done:
                                if (snapshot.data == null ||
                                    !snapshot.hasData ||
                                    snapshot.hasError) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                          'assets/${userData.gender.toLowerCase()}profile.png'));
                                } else {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: Image(
                                      image: snapshot.data!.getOrElse(() =>
                                          AssetImage(
                                              'assets/${userData.gender.toLowerCase()}profile.png')),
                                      fit: BoxFit.fitWidth,
                                      loadingBuilder: (context, widget, event) {
                                        if (event == null) {
                                          return widget;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: event.expectedTotalBytes !=
                                                    null
                                                ? event.cumulativeBytesLoaded /
                                                    event.expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                      frameBuilder: (context, child, frame,
                                          wasSyncLoaded) {
                                        if (wasSyncLoaded) {
                                          return child;
                                        }
                                        return AnimatedOpacity(
                                          opacity: frame == null ? 0 : 1,
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeOut,
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                }
                                break;
                              default:
                                return InfiniteLoader();
                            }
                          }),
                ),
                const SizedBox(height: 10.0),
                Text(
                  userData.name,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                Text('(${userData.rollNo})',
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
                const SizedBox(height: 5.0),
                Text('${userData.program}, ${userData.dept}',
                    style: const TextStyle(color: Colors.white, fontSize: 17)),
                const SizedBox(height: 3.0),
                Text(
                  '${userData.room}, ${userData.hall}',
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    const Icon(
                      FontAwesome.home,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      userData.hometown,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    const Icon(
                      Entypo.drop,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      userData.bloodGroup,
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () =>
                          launchMail('${userData.username}@iitk.ac.in',context),
                      child: const Icon(
                        Ionicons.md_mail,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    RichText(
                      text: TextSpan(
                        text: '${userData.username}@iitk.ac.in',
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Clipboard.setData(ClipboardData(
                                text: '${userData.username}@iitk.ac.in'));
                            Toast.createInformation(
                                message:
                                    "Email id has been coppied to the clipboard").show(context);
                          },
                      ),
                    ),
                  ],
                ),
                Center(
                  child: IconButton(
                    icon: Icon(
                      Entypo.globe,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.blue
                          : Colors.blue.shade900,
                    ),
                    tooltip: 'Homepage',
                    onPressed: () async {
                      await launchUrl(
                          'http://home.iitk.ac.in/~${userData.username}',context);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
