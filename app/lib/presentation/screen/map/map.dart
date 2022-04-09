import 'dart:io';

import 'package:flutter/material.dart';
import 'package:network_to_file_image/network_to_file_image.dart';
import 'package:life_at_iitk/app/core/functions.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:photo_view/photo_view.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class CampusMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Campus Map',
      body: Center(
          child: PhotoView(
        imageProvider: NetworkToFileImage(
          url:
              "https://firebasestorage.googleapis.com/v0/b/notifier-phase-2.appspot.com/o/Map%2FMap.png?alt=media&token=fbde2fd3-54d2-4da1-ac38-cbfe3c62999a",
          file: fetchCampusMap("campus.png", context.watch<Directory>()),
        ),
        loadingBuilder: (context, imageChunk) {
          return Column(
            children: [
              Center(
                  child: Text(imageChunk == null ||
                          imageChunk.expectedTotalBytes == null
                      ? 'Loading'
                      : 'Downloading ...')),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: CircularProgressIndicator(
                  value: imageChunk == null ||
                          imageChunk.expectedTotalBytes == null
                      ? null
                      : imageChunk.cumulativeBytesLoaded /
                          imageChunk.expectedTotalBytes!,
                ),
              ),
            ],
          );
        },
        errorBuilder: (context, error, stack) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.error_outline,
                size: 50,
              ),
              SizedBox(
                height: 15,
              ),
              Text('An error occurred while fetching the map from server !!!'),
              Text('A possible reason could be that you are offline'),
            ],
          );
        },

        enableRotation: true,
        minScale: 0.04,
        initialScale: 0.04,
        backgroundDecoration: BoxDecoration(
          color: CustomColors(context).bgColor,
        ),
      )),
    );
  }

  File fetchCampusMap(String filename, Directory dir) {
		// print(dir);
    final pathName = join(dir.path, filename);
    return File(pathName);
  }
}
