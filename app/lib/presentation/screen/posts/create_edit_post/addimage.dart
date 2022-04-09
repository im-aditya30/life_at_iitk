import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart' as path;

class AddingImage{
  ValueNotifier<String> url;
  ValueNotifier<File?>image;
  AddingImage({required this.image,required this.url});
}


class ImageUploader extends HookWidget {
	const ImageUploader({ Key? key, 
		required this.imageController, required this.addingImage }) : super(key: key);
	final TextEditingController imageController;
  final AddingImage addingImage;

	@override
	Widget build(BuildContext context) {
		final ImagePicker picker = useMemoized(() => ImagePicker());
		final loading = useState(false);
		final ValueNotifier<File?> _image = useState(null);
		final StreamController<double?> uploadController = useStreamController();
		// useEffect((){
		// 	picker = 
		// },[]);
		return Theme(
      data: Theme.of(context).copyWith(
        buttonBarTheme: const ButtonBarThemeData(
            alignment: MainAxisAlignment.center,
          ),
      ),
      child: WillPopScope(
        onWillPop: () async {
          return !loading.value;
        },
        child: AbsorbPointer(
          absorbing: loading.value,
          child: AlertDialog(
						actionsAlignment: MainAxisAlignment.center,
						actionsOverflowDirection: VerticalDirection.down,
						actionsPadding: const EdgeInsets.only(bottom: 12),
						contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
            title:
                _image.value != null || imageController.text.replaceAllSpaces.isNotEmpty == true 
                  ? Text(
											"Selected Image",
											textAlign: TextAlign.center,
											style: TextStyle(
												color: CustomColors(context).textColor
											),										
										)
                    : null,
            actions: [
							Column(
								mainAxisAlignment: MainAxisAlignment.center,
								// crossAxisAlignment: CrossAxisAlignment.center,
								children: [
									RaisedButton.icon(
											color: Colors.lightBlue,
											splashColor: Colors.blueAccent,
											textColor: Colors.white,
											onPressed: () async {
												await picker
														.getImage(source: ImageSource.gallery)
														.then((image) {
															log('${image?.path}', name: 'AddImage');
														if (image != null){
															_image.value = File(image.path);
															// addingImage.image.value = File(image.path);
														}
														else{
															Toast.createInformation(message: 'No image was selected').show(context);}
												});
											},
											icon: const Icon(EvilIcons.image),
											label: Text(_image.value == null && imageController.text.replaceAllSpaces.isEmpty
													? 'Choose Image'
													: 'Select Another Image')),
										if (_image.value != null || 
												imageController.text.replaceAllSpaces.isNotEmpty) 
											RaisedButton.icon(
												onPressed: () async {
													try {
														if(imageController.text.replaceAllSpaces.isNotEmpty) {
															return await clearSelection(context).then((bool status)async {
																if(status){
																	// addingImage.url.value = '';
																	imageController.clear();
																	// _image.value = null;
																	Toast.createSuccess(message: 'Removed Successfully').show(context); //TODO remove when completed debugging
																	await uploadFile(
																		context, 
																		loading, 
																		_image,
																		uploadController).then((onValue) {
																		if (onValue) {
																			context.router.pop();
																			Toast.createSuccess(message: 'Image Uploaded Successfully').show(context);
																		} else {
																			Toast.createError(message: 'Image Upload Failed!!!!').show(context);
																		}
																	});
																}
															});
														}
														return await uploadFile(
															context,
															loading, 
															_image,
															uploadController).then((onValue) {
															if (onValue) {
																			context.router.pop();
																			Toast.createSuccess(message: 'Image Uploaded Successfully').show(context);
																		} else {
																			Toast.createError(message: 'Image Upload Failed!!!!').show(context);
																		}
																loading.value = false;
														}).timeout(const Duration(seconds: 20));
													} catch (e) {
														// print(e);
															loading.value = false;
													}
												},
												icon: const Icon(SimpleLineIcons.cloud_upload),
												label: const Text('Upload Image')),
										if (_image.value != null || imageController.text.replaceAllSpaces.isNotEmpty) 
										RaisedButton.icon(
											color: Colors.grey,
											splashColor: Colors.black,
											textColor: Colors.white,
											onPressed: () async {
												if (imageController.text.replaceAllSpaces.isNotEmpty) {
													await clearSelection(context).then((bool status){
														if(status){
																// addingImage.url.value = '';
																_image.value = null;
																imageController.clear();
															Toast.createSuccess(message: 'Removed Successfully').show(context);
														}
													});
												} else {
														// addingImage.url.value = '';
														_image.value = null;
														imageController.clear();
													// Navigator.pop(context);
												}
											},
											icon: const Icon(MaterialIcons.clear),
											label: const Text('Clear Selected Image')),
								],
							)
						],
            content: _image.value != null ||  imageController.text.replaceAllSpaces.isNotEmpty
                ? Container(
                    // padding: const EdgeInsets.only(bottom: 0),
                    // height: 250.0,
										constraints: const BoxConstraints(
											maxHeight: 250
										),
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          height: 250.0,
                          child: _image.value != null
                              ?
                              Image.file(
                                  _image.value!
                                )
                              : CachedNetworkImage(
                                  imageUrl: addingImage.url.value,
                                  errorWidget: (context, url, value) {
                                    return Center(
                                      child: Text( value.runtimeType == SocketException?
                                        'Seems like you are offline 😑'
																				: 'An error occured while loading Image',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: Colors.red),
                                      ),
                                    );
                                  },
                                  progressIndicatorBuilder:
                                      (context, value, progress) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text('Loading Image.....'),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        CircularProgressIndicator(),
                                      ],
                                    );
                                  },
                                ),
                        ),
                        if (loading.value) 
													StreamBuilder<double?>(
                                stream: uploadController.stream,
                                builder: (context, snapshot) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: snapshot.hasData && snapshot.data != null ?
                                      	snapshot.data : null,
                                    ),
                                  );
                                })
                      ],
                    ),
                )
                : null,
          ),
        ),
      ),
    );
	}
	Future<bool> uploadFile(
		BuildContext context,
		ValueNotifier<bool> loading,
		ValueNotifier<File?> _image ,
		StreamController<double?> uploadController) async {
    // setState(() {
      loading.value = true;
    // });
    Toast.createInformation(message: "Uploading Image").show(context);
    try {
      final Reference storageReference = FirebaseStorage.instance.ref().child(
          'upload_image/${path.basename(_image.value?.path??'')}');
      final UploadTask uploadSnapshot =
          storageReference.putFile(_image.value!);
      uploadSnapshot.snapshotEvents.listen((event) async {
        uploadController.sink.add(event.bytesTransferred / event.totalBytes);
        if (event.state == TaskState.success) {
          uploadController.sink.add(null);
          await storageReference.getDownloadURL().then((fileURL) {
              // addingImage.url.value = fileURL;
              imageController.text = fileURL;
              loading.value = false;
            return true;
          });
        }
      });
			return true;
    } catch (onError) {
      uploadController.sink.add(null);
      Toast.createError(message:'Uploading failed !!!').show(context);
      return false;
    }
  }

  Future<bool> clearSelection(BuildContext context) async {
    try{
      final Reference storageReference =
        FirebaseStorage.instance.refFromURL(imageController.text);
        return await storageReference.delete().then((_) {
					Toast.createSuccess(message: "Cleared Image").show(context);
          return true;
        }).catchError((onError){
          // showErrorToast('Failed!!!');
					 Toast.createError(message:'Clear failed !!!').show(context);
          return false;
        });
    }catch(e){
      // showErrorToast('Failed!!!');
			 Toast.createError(message:'Clear failed !!!').show(context);
      return false;
    }
  }
}


extension StringX on String {
	String get replaceAllSpaces => replaceAll(' ', '');
}