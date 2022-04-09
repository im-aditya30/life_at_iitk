import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/domain/models/hive/council.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:intl/intl.dart' as intl;
import 'package:life_at_iitk/presentation/core/app.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/enums.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/routes/router.gr.dart';
import 'package:life_at_iitk/presentation/screen/posts/create_edit_post/addimage.dart';
import 'package:life_at_iitk/presentation/screen/posts/create_edit_post/chips.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/extensions.dart';
import '../../../../hive_extension.dart';
import '../../../core/functions.dart';
import '../../../core/widgets/custom_scaffold.dart';

class CreateEditPost extends StatefulHookWidget {
  final Post post;
	final PostDescType type;

  const CreateEditPost({Key? key, required this.type,  required this.post}) : super(key: key);
  @override
  _CreateEditPostState createState() => _CreateEditPostState();
}

class _CreateEditPostState extends State<CreateEditPost> {
  late Post post;
  File ?_image;
  final _formKey = GlobalKey<FormState>();
  final councilData = Hive.getData<Council>();
  final userData = Hive.getData<User>();
  List<String> getCouncil() {
		print(councilData.coordOfCouncil);
    return councilData.coordOfCouncil;
  }

  List<String> getEntities(String council) {
    if (council == null) return [];
    return councilData.subCouncil[council]?.coordiOfInCouncil ?? [];
  }

  @override
  void initState() {
    super.initState();
    post = widget.post;
  }

  @override
  Widget build(BuildContext context) {
    final _titleController = useTextEditingController(text: post.title);
    final _messageController =
        useTextEditingController(text: post.message);
    final _bodyController = useTextEditingController(text: post.body);
    final _tagController = useTextEditingController(text: post.tags);
    final _imageF = useFocusNode();
    final _imageUrlController =
        useTextEditingController(text: post.url);
    final _startTimeController = useTextEditingController(
        text: (post.startTime == 0 || post.startTime == null)
            ? ''
            : intl.DateFormat("hh:mm a, dd MMMM, yyyy")
                .format(DateTime.fromMillisecondsSinceEpoch(post.startTime!)));
    final _endTimeController = useTextEditingController(
        text: (post.endTime == 0 || post.endTime == null)
            ? ''
            : intl.DateFormat("hh:mm a, dd MMMM, yyyy")
                .format(DateTime.fromMillisecondsSinceEpoch(post.endTime!)));
    final _messageFocus = useFocusNode();
    final _startTime = useState(post.endTime??0);
    // final _endTime = useState(null);
    final _endTime = useState(post.endTime??0);
    final validation = useState('');
    final ValueNotifier<List<String>> _entityItems = useState(getEntities(post.council));
    final ValueNotifier<String?> _selCouncil = useState(post.council.isNotEmpty == true? post.council : null);
    final ValueNotifier<String?> _selEntity = useState(post.sub.firstElement?.toString());

    void onSelectedCouncil(String council) {
      if (council != _selCouncil.value) {
        _selCouncil.value = council;
        _entityItems.value = [];
        _selEntity.value = null;
        _entityItems.value = getEntities(council);
      }
    }

    final routeData = RouteData.of(context);
    final title = getTitle(widget.type);
    return CustomScaffold(
      title: '$title Post',
			// appBarActions: [Container(
      //                           padding: const EdgeInsets.only(left: 50.0),
      //                           child: Switch(
      //                               value: Theme.of(context).brightness ==
      //                                   Brightness.dark,
      //                               onChanged: (value) {
      //                                 Hive.box<String>('theme').put(
      //                                     0,
      //                                     value
      //                                         ? theme[ThemeMode.dark]!
      //                                         : theme[ThemeMode.light]!);
      //                                 // DynamicTheme.of(context).setBrightness(
      //                                 // 	Theme.of(context).brightness == Brightness.light
      //                                 // 		? Brightness.dark
      //                                 // 		: Brightness.light);
      //                               }),
      //                         )],
      body: Stack(
        fit: StackFit.expand,
        children: [
          Form(
            key: _formKey,
						onWillPop: () async{
							if (!context.read<ApiBloc>().state.load.intersection({
								API.updatePost
							}).isNotEmpty)
							 {
							  return (await showDialog<bool>(
									context: context,
									builder: (context) {
										return AlertDialog(
											title: Text("Discard this post",
												style: const TextStyle().copyWith(fontSize: 20),
											),
											actionsPadding: const EdgeInsets.only(right: 10),
											// titleTextStyle: const TextStyle().copyWith(fontSize: 20,color: Colors.black),
											actions: [
												FlatButton(
													padding: const EdgeInsets.symmetric(horizontal: 15),
													onPressed: () => Navigator.pop(context, true),
													child: const Text("Discard")),
												RaisedButton(
													padding: const EdgeInsets.symmetric(horizontal: 15),
													onPressed: () => Navigator.pop(context, false),
													child: const Text("Keep editing"),
												),
											],
										);
									},
								))??true;
							}
							return !(context.read<ApiBloc>().state.load.intersection({
								API.updatePost, API.publishDraft,
							}).isNotEmpty && title.toLowerCase() != 'create');
						},
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      TextField(
                        controller: _titleController,
                        hintText: 'Title of the Post',
                        textInputAction: TextInputAction.next,
                        labelText: 'Title *',
                        validator: (value) => value?.isNotEmpty == true
                            ? null
                            : "Title is required for a post",
                      ),
                      TextField(
                        controller: _messageController,
                        padding: const EdgeInsets.only(top: 16),
                        hintText:
                            'Subtitile to be displayed in the notifications panel ',
                        textInputAction: TextInputAction.next,
                        labelText: 'Message *',
                        focusNode: _messageFocus,
                        maxLength: 200,
                        validator: (value) => value!.isEmpty
                            ? "Message is required for a post"
                            : value.length > 200
                                ? "Message should be less than 200 chars"
                                : null,
                      ),
                      TextField(
                        controller: _bodyController,
                        hintText: 'Body of the Post',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.multiline,
                        maxLines: 0,
                        labelText: 'Body *',
                        validator: (value) => value!.isEmpty
                            ? "Body is required for a post"
                            : null,
                      ),
                      Padding(
                        padding: (_selCouncil.value?.isNotEmpty == true)
                            ? const EdgeInsets.symmetric(vertical: 16)
                            : const EdgeInsets.only(top: 16),
                        child: DropdownButtonFormField<String>(
                          icon: const Icon(Entypo.chevron_down),
                          items: getCouncil().map((location) {
                            // log(location);
                            return DropdownMenuItem(
                              value: location,
                              child: Text(convertToCouncilName(location)),
                            );
                          }).toList(),
                          onTap: () => FocusScope.of(context).unfocus(),
                          value: _selCouncil.value,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            labelText: 'Council *',
                            hintText: 'Choose Council ...',
                            isDense: true,
                          ),
                          onChanged: (value) =>
                              onSelectedCouncil(convertFromCouncilName(value!)),
                          validator: (value) =>
                              value == null || value.toString().isEmpty
                                  ? 'Council is required for a post'
                                  : null,
                          onSaved: (value) => post.copyWith(
                              council:
                                  convertFromCouncilName(value.toString())),
                        ),
                      ),
                      if (_selCouncil.value?.isNotEmpty == true)
                        DropdownButtonFormField<String>(
                          icon: const Icon(Entypo.chevron_down),
                          items: _entityItems.value.map((location) {
                            return DropdownMenuItem(
                              value: location,
                              child: Text(location),
                            );
                          }).toList(),
                          onTap: () => FocusScope.of(context).unfocus(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            labelText: 'Entity *',
                            isDense: true,
                          ),
                          value: _selEntity.value,
                          onChanged: (newValue) => _selEntity.value = newValue,
                          validator: (val) =>
                              val == null ? "Entity can't be null" : null,
                          onSaved: (v) => post.copyWith(),
                        ),
                      ListTileWithButton(
                        controller: _tagController,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        label: 'Tags',
                        icon: MaterialIcons.add,
                        tooltip: 'Add Tags',
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          addingTag(context, _tagController);
                        },
                      ),
                      ListTileWithButton(
                        controller: _imageUrlController,
                        label: 'Image',
                        tooltip: 'Add Image',
                        focusNode: _imageF,
                        icon: MaterialIcons.add_a_photo,
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          _imageF.unfocus();
                          await selectImage(_imageUrlController);
                        },
                      ),
                      ListTileWithButton(
                        controller: _startTimeController,
                        label: 'Event Date Time',
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        tooltip: (_startTime.value == 0)
                            ? 'Select Start Date and Time'
                            : 'Clear',
                        icon: (_startTime.value == 0)
                            ? Octicons.calendar
                            : Icons.close,
                        onSaved: (value) {
                          if (value?.isNotEmpty == true) {
                            _startTime.value =
                                convertDateFromStringToDateTime(value!)
                                    .millisecondsSinceEpoch;
                            return '';
                          }
                          _startTime.value = 0;
                          return '';
                        },
												onIconTap: (_startTime.value != 0)?
													(){
														FocusScope.of(context).unfocus();
														_startTimeController.clear();
                            _startTime.value = 0;
														_endTimeController.clear();
														_endTime.value = 0;
														validation.value = '';
													} : null,
                        onTap: () async {
                            final DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(DateTime.now().day),
                                lastDate: DateTime(DateTime.now().year + 30),
                                builder: (context, child) {
                                  return child!;
                                }).then((date) async {
                              if (date != null) {
                                final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    builder: (context, child) {
                                      return Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: child!);
                                    });
                                if (time != null) {
                                  return DateTime(
                                    date.year,
                                    date.month,
                                    date.day,
                                    time.hour,
                                    time.minute,
                                  );
                                } else {
                                  return null;
                                }
                              } else {
                                return null;
                              }
                            });
                            if (date != null) {
                              _startTimeController.text =
                                  intl.DateFormat("hh:mm a, dd MMMM, yyyy")
                                      .format(date);
															_startTime.value =
                              convertDateFromStringToDateTime(_startTimeController.text)
                                  .millisecondsSinceEpoch;
															if(_startTime.value > _endTime.value) {
																validation.value =
																			'End Time should be grater than start time';
															}
                            }
                        },
                      ),
                      if (mounted && _startTime.value != 0)
                        ListTileWithButton(
                          controller: _endTimeController,
                          label: 'Event End Date Time',
                          tooltip: _endTime.value == 0
                              ? 'Select End Date and Time'
                              : 'Clear',
                          icon: _endTime.value == 0
                              ? MaterialIcons.timelapse
                              : Icons.close,
													onIconTap:(_endTime.value != 0) ? 
														(){
															FocusScope.of(context).unfocus();
                              _endTimeController.clear();
                              _endTime.value = 0;
															validation.value = '';
                            } : null,
													// },
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                              final DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(DateTime.now().day),
                                  lastDate: DateTime(DateTime.now().year + 30),
                                  builder: (context, child) {
																		return child!;
                                  }).then((date) async {
																		if (date != null) {
																			final time = await showTimePicker(
																					context: context,
																					initialTime: TimeOfDay.now(),
																					builder: (context, child) {
																						return Directionality(
																								textDirection: TextDirection.ltr,
																								child: child!);
																					});
																			if (time != null) {
																				return DateTime(
																					date.year,
																					date.month,
																					date.day,
																					time.hour,
																					time.minute,
																				);
																			} else {
																				return null;
																			}
																		} else {
																			return null;
																		}
																	});
                              if (date != null) {
                                _endTimeController.text =
                                    intl.DateFormat("hh:mm a, dd MMMM, yyyy")
                                        .format(date);
																	_endTime.value =
                                  convertDateFromStringToDateTime(_endTimeController.text)
                                      .millisecondsSinceEpoch;
																if (_endTimeController.text.isNotEmpty &&
																		convertDateFromStringToDateTime(
																								_endTimeController.text)
																						.millisecondsSinceEpoch <
																				(convertDateFromStringToDateTime(
																								_startTimeController.text))
																						.millisecondsSinceEpoch) {
																	validation.value =
																			'End Time should be grater than start time';
																	// return 'End Time should be grater than start time';
																} else {
																	validation.value = '';
																	// return null;
																}
                              }
                          },
													alwaysValidate: !(_startTime.value !=0 && validation.value.isEmpty != false),
                          validators: (value) {
                            if (value?.isNotEmpty == true &&
                                convertDateFromStringToDateTime(
                                            _endTimeController.text)
                                        .millisecondsSinceEpoch <
                                    (convertDateFromStringToDateTime(
                                            _startTimeController.text))
                                        .millisecondsSinceEpoch) {
                              validation.value =
                                  'End Time should be grater than start time';
                              return 'End Time should be grater than start time';
                            } else {
                              validation.value = '';
                              return null;
                            }
                          },
                          onSaved: (value) {
                            if (value?.isNotEmpty == true) {
                              _endTime.value =
                                  convertDateFromStringToDateTime(value!)
                                      .millisecondsSinceEpoch;
                            } else {
                              _endTime.value = 0;
                            }
                            return '';
                          },
                        ),
											if(_startTime.value !=0 && validation.value.isEmpty != false)
                      const Padding(
                        padding:
                            EdgeInsets.fromLTRB(0.0, 8.0, 40.0, 0.0),
                        child: Text(
													'This field is optional but is necessary for post to show under ongoing events or upcoming events',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 10.0)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SizedBox(
                          height: 45.0,
													width: 150,
                          // constraints: const BoxConstraints(minWidth: 150),
                          child: RaisedButton.icon(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                final newPost = post.copyWith(
                                  body: _bodyController.text,
                                  council: _selCouncil.value,
                                  endTime: _endTime.value,
                                  message: _messageController.text,
                                  startTime: _startTime.value,
                                  sub: [_selEntity.value],
                                  tags: _tagController.text,
                                  title: _titleController.text,
                                  url: _imageUrlController.text,
                                  owner: userData.id,
                                  author: userData.name.isEmpty? userData.id: userData.name,
                                  isFeatured: false,
                                );
																// print(newPost.toPostMap());
                                if(widget.type == PostDescType.EDIT_POSTS){
																	context
                                    .read<ApiBloc>()
                                    .add(ApiEvent.updatePost(post: newPost));
																}
																else {
																	context.router.push(PostDescriptionRoute(
																		index: 0,
																		posts: [newPost],
																		type: widget.type
																		// ??
																		// (title.toLowerCase() == 'create'? 
																		// 	PostDescType.CREATE_POSTS
																		// 	: PostDescType.EDIT_POSTS)
																	));
																}
                              }
                            },
													icon: Icon(
                                title.toLowerCase() == 'create'
                                    ? MaterialCommunityIcons.file_upload_outline
                                    : MaterialCommunityIcons.open_in_new,
                                color: Colors.white,
													),
                            label: Text(title.toLowerCase() == 'create'
                                ? 'Preview'
                                : 'Update',
															style: const TextStyle(
																fontSize: 15,
																// fontWeight: FontWeight.bold,
																color: Colors.white
															)	
														),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          BlocConsumer<ApiBloc, ApiState>(
            listener: (context, state) {
              state.apiFailureOrSuccessOption.fold(
                  () => {},
                  (either) => either.fold(
                      (l) => Toast.createApiError(l).show(context),
                      (_) => context.router.popUntilRouteWithName(HomePageRoute.name)));
            },
						listenWhen: (p,c) => p.load.difference(c.load).contains(API.updatePost) || c.load.difference(p.load).contains(API.makeDraft),
            builder: (context, state) {
              if (state.load.intersection({
								API.updatePost, API.makeDraft
							}).isNotEmpty) return const LoadingBuilder();
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }

  Future selectImage(TextEditingController _imageController) async {
    final status = await PermissionsHandler(context).checkStatus();
    // print(status);
    if (status) {
      return showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            // print(_imageController.text);
            // print(_image);

            // return AddImage(
            //   imageController: _imageController,
            //   addingImage: AddingImage(
            //       image: _image, url: _imageController.text.toString()),
            // );
						return ImageUploader(
							imageController: _imageController, 
							addingImage: AddingImage(
								image: ValueNotifier(_image), url: ValueNotifier(_imageController.text.toString())));
          });
    }
    return;
  }

  Future addingTag(BuildContext context, TextEditingController _tagController) {
    List<dynamic> newTag = [];
    if (!(_tagController.text == 'null' ||
        _tagController.text == null ||
        _tagController.text.trim() == '' ||
        _tagController.text.trim() == null)) {
      newTag = _tagController.text.split(";");
      newTag = newTag.sublist(0, newTag.length - 1);
    }
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          final _formKey = GlobalKey<FormState>();
          String? addTag;

          return CupertinoActionSheet(
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100.0),
                child: RaisedButton.icon(
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    icon: const Icon(MaterialIcons.playlist_add),
                    label: const Text('Add Tags'),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Add Tag'),
                              content: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 0.0, 0.0, 0.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: TextField(
                                            keyboardType: TextInputType.text,
                                            // decoration: new InputDecoration(
                                            labelText: 'Tag',
                                            // ),
                                            validator: (value) => value!.isEmpty 
                                                ? "Tags can't be empty"
                                                : null,
                                            onSaved: (value) {
                                              return addTag = value!;
                                            }),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        top: 25.0,
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            FlatButton(
                                                textColor: Colors.white,
                                                // color: Colors.blue,
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Dismiss')),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0),
                                              child: RaisedButton.icon(
                                                  color: Colors.lightBlue,
                                                  textColor: Colors.white,
                                                  icon:
                                                      const Icon(EvilIcons.tag),
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      _formKey.currentState!
                                                          .save();
                                                      // setState(() {
                                                      // tagForChip!=null?tagForChip += addTag + ' ;' : tagForChip = addTag + ' ;';
                                                      newTag.add(addTag);
                                                      // newTag = tagsForChips;
                                                      // });
                                                      Navigator.of(context)
                                                          .pop();
                                                    }
                                                  },
                                                  label: const Text('Add Tag')),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              ),
            ],
            message: SizedBox(child: CreateChips(newTag)),
            cancelButton: Column(
              children: <Widget>[
                RaisedButton.icon(
                  textColor: Colors.white,
                  icon: const Icon(EvilIcons.check),
                  onPressed: () {
                    // setState(() {
                    _tagController.text = '';
                    for (final i in newTag) {
                      _tagController.text += "$i; ";
                    }
                    _tagController.text = _tagController.text;
                    // print(_tagController.text + ':tags line807');
                    // });
                    Navigator.of(context).pop();
                  },
                  label: const Text(
                    'Done',
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class PermissionsHandler {
  final BuildContext context;

  PermissionsHandler(this.context);
  Future<bool> confirmStatus() async {
    final status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    }
    return showToast(status);
  }

  Future<bool> checkStatus() async {
    final status = await Permission.storage.status;
    switch (status) {
      case PermissionStatus.granted:
        return true;
      default:
        {
          final res = await requestPermission();
          return res;
        }
    }
  }

  bool showToast(PermissionStatus status) {
    switch (status) {
      case PermissionStatus.granted:
        return true;
			case PermissionStatus.limited: return true;
      // case PermissionStatus.undetermined:
      //   Toast.createError(
      //           message:
      //               'You need to allow storage permissions to upload images')
      //       .show(context);
      //   return false;
      // }
      case PermissionStatus.denied:
        Toast.createError(
                message:
                    'You need to allow storage permissions to upload images')
            .show(context);
        return false;
      case PermissionStatus.permanentlyDenied:
        Toast.createError(
                message:
                    'You need to manually allow storage permissions from settings to upload images')
            .show(context);
        return false;
      case PermissionStatus.restricted:
        Toast.createError(
                message: 'Uploading images is restricted in your device')
            .show(context);
        return false;
    }
    return false;
  }

  Future createActionFlush(BuildContext context) => Toast.createAction(
        message:
            'You need to manually allow storage permissions from settings to upload images',
        duration: const Duration(seconds: 10),
        button: FlatButton(
            onPressed: () async {
              await openAppSettings().then((value) async {
                if (!value) {
                  Toast.createError(
                      message: "Can't open this device's settings");
                  return false;
                }
              });
            },
            child: const Text('Open Settings')),
      ).show(context);

  Future<bool> requestPermission() async {
    try {
      // Toast.createError(
      // 					message: 'You need to allow storage permissions to upload images');
      final status = await Permission.storage.request();
      switch (status) {
        case PermissionStatus.granted:
          return true;
			case PermissionStatus.limited: return true;
        // case PermissionStatus.undetermined:
        //   Toast.createError(
        //           message:
        //               'You need to allow storage permissions to upload images')
        //       .show(context);
        //   break;
        case PermissionStatus.denied:
          Toast.createError(
                  message:
                      'You need to allow storage permissions to upload images')
              .show(context);
          break;
        case PermissionStatus.permanentlyDenied:
          await createActionFlush(context);
          return await confirmStatus();
          // break;
        case PermissionStatus.restricted:
          Toast.createError(
                  message: 'Uploading images is restricted in your device')
              .show(context);
          break;
      }
      return false;
    } catch (e) {
			log('$e', name: 'Permission Handler');
      return false;
    }
  }
}

class LoadingBuilder extends StatelessWidget {
  const LoadingBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
                // height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.8),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          'Updating Post',
                          // !time
                          //     ? (requestPerm
                          //         ? 'Sending request Approval'
                          //         : 'Publishing Post')
                          //     : 'Your connectivity seems to be slow',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SpinKitDualRing(color: CustomColors(context).accentColor),
                    ],
                  ),
                ))),
      ],
    );
  }
}

class ListTileWithButton extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final IconData? icon;
  final String? tooltip;
  final FocusNode? focusNode;
  final String? Function(String?)? validators;
	final bool? alwaysValidate;
  final String Function(String?)? onSaved;
  final void Function(String?)? onChanged;
	final VoidCallback? onIconTap;

  const ListTileWithButton(
      {Key? key,
      this.controller,
      this.label,
      this.onTap,
      this.icon,
      this.tooltip,
      this.padding,
      this.focusNode,
      this.validators,
			this.alwaysValidate = false,
      this.onSaved,
			this.onChanged, 
			this.onIconTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              textInputAction: TextInputAction.next,
              labelText: label,
              keyboardType: TextInputType.multiline,
              maxLines: 0,
              readOnly: true,
              onTap: onTap,
							alwaysValidate: alwaysValidate,
              validator: validators,
              onSaved: onSaved,
							onChanged: onChanged,
            ),
          ),
          SizedBox(
            width: 100,
            child: IconButton(
                tooltip: tooltip,
                icon: Icon(
                  icon,
                  color: CustomColors(context).accentColor,
                  size: 30.0,
                ),
                onPressed: onIconTap?? onTap),
          ),
        ],
      ),
    );
  }
}

class TextField extends StatelessWidget {
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? counterText;
  final EdgeInsets? padding;
  final TextStyle? counterStyle;
  final Widget? counter;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final bool? readOnly;
  final bool? alwaysValidate;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;

  const TextField(
      {Key? key,
      this.maxLines,
      this.controller,
      this.keyboardType,
      this.focusNode,
      this.labelText,
      this.hintText,
      this.validator,
      this.readOnly,
      this.maxLength,
      this.textInputAction,
      this.helperText,
      this.counterText,
      this.counterStyle,
      this.padding,
      this.onTap,
      this.onSaved,
      this.counter,
      this.onChanged, this.alwaysValidate = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: TextFormField(
        toolbarOptions: const ToolbarOptions(
          copy: true,
          paste: true,
          selectAll: true,
          cut: true,
        ),
        maxLines: maxLines == 0 ? null : maxLines ?? 1,
        keyboardType: keyboardType,
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          // counterText: counterText,
          counterStyle: counterStyle,
          counter: counter,
          helperText: helperText,
        ),
        onEditingComplete: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        onChanged: onChanged,
        onTap: onTap,
        validator: validator,
        readOnly: readOnly ?? false,
        autovalidateMode: alwaysValidate!? AutovalidateMode.always : AutovalidateMode.onUserInteraction,
        maxLength: maxLength,
        textInputAction: textInputAction,
        onSaved: onSaved,
      ),
    );
  }
}

extension StringX on String {}


String getTitle(PostDescType type) {
	switch (type) {
		case PostDescType.CREATE_POSTS: 
			return  "Create";
		default: return "Edit";
	}
}