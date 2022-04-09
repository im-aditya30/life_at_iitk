import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/app/posts/student/student_cubit.dart';
import 'package:life_at_iitk/domain/models/hive/council.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/models/student.dart';
import 'package:life_at_iitk/hive_extension.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/functions.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/core/widgets/loaders.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProfilePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final councilData = Hive.getData<Council>();
		final userBox = Hive.getBox<User>();
    final userData = Hive.getData<User>();
    final List<String> por = [];
    Student studentData;
    final List<String> hall = List.generate(13, (index) => 'Hall ${index + 1}');
    final _hall = useTextEditingController();
    final _room = useTextEditingController();
    final _program = useTextEditingController();
    final _department = useTextEditingController();
    useEffect(() {
      for (final council in councilData.coordOfCouncil) {
        por.addAll(councilData.subCouncil[council]!.coordiOfInCouncil);
      }
      hall.insertAll(13, ['Type 5', 'Type 1B', 'Type 1', 'SBRA', 'RA', 'NRA']);
      hall.insertAll(0, ['GH', 'DAY', 'CPWD', 'ACES']);
      return;
    }, const []);
    final mediaWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<StudentCubit, StudentState>(
      buildWhen: (p, c) => p.isLoading != c.isLoading,
      builder: (context, state) {
        studentData = state.profileData;
        // state.maybeMap(orElse: ()=> Student.defaultData(userData.id),loadedStudentData: (s) => s.data?? Student.defaultData(userData.id));
        _hall.text = studentData.hall;
        _department.text = studentData.dept;
        _program.text = studentData.program;
        _room.text = studentData.room;
				userBox.put(0, userData.copyWith(gender: studentData.gender));
        // print(studentData.toMap());
        // log(state.toString(), name: 'ProfilePage');
        return IgnorePointer(
          ignoring: state.isLoading,
          child: Material(
              child: ListView(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 200,
                        margin: const EdgeInsets.only(bottom: 130),
                        color: Theme.of(context).colorScheme.brightness ==
                                Brightness.dark
                            ? Colors.blueGrey[800]
                            : Colors.blueGrey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 10,
                          children: <Widget>[
                            // if (studentData?.dept
                            //         ?.replaceAll(' ', '')
                            //         ?.isNotEmpty ==
                            //     true)
                            DetailsTile(
                              width: (mediaWidth - 150) * 0.6,
                              controller: _department,
                              label: 'Department',
                              onPressed: () => _updateDialog(
                                  context: context,
																	curentVal: _department.text,
																	data: dept,
                                  studentData: studentData,
                                  type: UpdateProfile.DEPT,
																	textEditingController: _department
																	),
                            ),
                            // if (studentData?.program
                            //         ?.replaceAll(' ', '')
                            //         ?.isNotEmpty ==
                            //     true)
                            DetailsTile(
                              width: (mediaWidth - 120) * 0.3,
                              controller: _program,
                              label: 'Program',
                              onPressed: () => _updateDialog(
                                  context: context,
																	curentVal: _program.text,
																	data: program,
                                  studentData: studentData,
                                  type: UpdateProfile.PROGRM,
                                  textEditingController: _program),
                            ),
                            // if (studentData?.room
                            //         ?.replaceAll(' ', '')
                            //         ?.isNotEmpty ==
                            //     true)
                            DetailsTile(
                              width: (mediaWidth - 32) * 0.5 - 70,
                              controller: _room,
                              label: 'Room',
                              onPressed: () => _updateDialog(
                                  context: context,
																	curentVal: _room.text,
																	data: null,
                                  studentData: studentData,
                                  type: UpdateProfile.ROOM,
                                  textEditingController: _room),
                            ),
                            // if (studentData?.hall
                            //         ?.replaceAll(' ', '')
                            //         ?.isNotEmpty ==
                            //     true)
                            DetailsTile(
                              width: (mediaWidth - 32) * 0.5 - 70,
                              controller: _hall,
                              label: 'Hall',
                              onPressed: () => _updateDialog(
                                  context: context,
                                  data: hall,
																	curentVal: _hall.text,
                                  studentData: studentData,
                                  type: UpdateProfile.HALL,
                                  textEditingController: _hall,
                                  // deptController: _department,
                                  // programController: _program,
                                  // roomController: _room
																	),
                            ),
                            if (studentData.hometown
                                    .replaceAll(' ', '')
                                    .isNotEmpty ==
                                true)
                              TextFormField(
                                initialValue: studentData.hometown,
                                readOnly: true,
                                decoration: const InputDecoration(
                                    labelText: 'Hometown',
                                    border: OutlineInputBorder()),
                              )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (por.isNotEmpty == true)
                        const Center(
                          child: Text(
                            "POR's",
                            style: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      if (por.isNotEmpty) const SizedBox(height: 10.0),
                      for (var i in por) Chip(label: Text(i)),
                      const SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Qr Code',
                              style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Center(
                        child: QrImage(
                          data: '${userData.id}@iitk.ac.in',
                          foregroundColor:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                          size: 200.0,
                        ),
                      ),
                      const SizedBox(height: 25.0),
                    ],
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () => context.router.pop(),
                      )),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'E-iCard',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          margin: const EdgeInsets.only(top: 110),
                          constraints: BoxConstraints(
                              minWidth: MediaQuery.of(context).size.width - 40,
                              minHeight: 200),
                          child: Card(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.black
                                    : Colors.white,
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 70.0),
                              child: Column(
                                children: [
                                  if (userData.name.isNotEmpty == true ||
                                      studentData.name.isNotEmpty == true)
                                    Text(
                                      userData.name.isNotEmpty == true
                                          ? userData.name
                                          : studentData.name,
                                      style: const TextStyle(
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.bold,
                                        height: 1.4,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Text(
                                      '${userData.id}@iitk.ac.in',
                                      style: const TextStyle(
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.bold,
                                        height: 1.4,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ),
                                  if (userData.rollno.isNotEmpty ||
                                      studentData.rollNo.isNotEmpty)
                                    Text(
                                      userData.rollno.isNotEmpty
                                          ? userData.rollno
                                          : studentData.rollNo,
                                      style: const TextStyle(
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.bold,
                                        height: 1.4,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ))),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: ValueListenableBuilder<Box<User>>(
                              valueListenable:
                                  Hive.getBox<User>().listenable(keys: [0]),
                              builder: (context, box, _) {
                                return box.getUser.profile.isNotEmpty
                                    ? CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            MemoryImage(box.getUser.profile))
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(
                                            "assets/${state.userSData.gender.toLowerCase()}profile.png"));
                              }))),
                  BlocConsumer<StudentCubit, StudentState>(
										listener: (context, state) {
											if(!state.isProfilePicLoading){
												state.dbFailure?.fold(() {}, 
												(l) => Toast.createDBError(l).show(context));
												state.apiFailure?.fold(() {}, 
												(l) => Toast.createApiError(l, isProfile: true).show(context));
											}
										},
										listenWhen: (p, c) =>
                        p.isProfilePicLoading != c.isProfilePicLoading,
                    buildWhen: (p, c) =>
                        p.isProfilePicLoading != c.isProfilePicLoading,
                    builder: (context, state) {
                      return Positioned(
                        top: 60,
                        left: MediaQuery.of(context).size.width * 0.5 + 25,
                        child: AbsorbPointer(
                          absorbing:
                              // false,
                              state.isProfilePicLoading,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Colors.white,
                              elevation: 5,
                              child: Tooltip(
                                message: 'Re-fetch profile picture',
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  splashColor: Colors.transparent,
                                  onTap: () async {
                                    await context
                                        .read<StudentCubit>()
                                        .loadUserProfile(userData.id!);
                                  },
                                  child: state.isProfilePicLoading
                                      ? Center(
                                          child: Container(
                                          width: 30,
                                          height: 30,
                                          padding: const EdgeInsets.all(6),
                                          child: CircularProgressIndicator(
                                              backgroundColor:
                                                  CustomColors(context)
                                                      .textColor,
                                              // /*Theme.of(context).brightness == Brightness.dark ? Colors.white : */Colors.black,
                                              strokeWidth: 2.2),
                                        ))
                                      : const Icon(
                                          Icons.refresh,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Visibility(
                    visible: state.isLoading,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      color: Colors.black.withOpacity(0.6),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: InfiniteLoader(),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
        );
      },
    );
  }

  Future _updateDialog({
    required UpdateProfile type,
    required BuildContext context,
    required Student studentData,
    // required TextEditingController hallController,
    // required TextEditingController deptController,
    // required TextEditingController programController,
    required TextEditingController textEditingController,
    // required TextEditingController roomController,
    required List<String>? data,
		required String curentVal,
    // required List<String> dept,
    // required List<String> program,
  }) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          // ignore: unnecessary_parenthesis
          final String _typeValue = (() {
            switch (type) {
              case UpdateProfile.DEPT:
                return "dept";
              case UpdateProfile.HALL:
                return UPDATE_PROFILE_HALL;
              case UpdateProfile.PROGRM:
                return UPDATE_PROFILE_PROGRM;
              case UpdateProfile.ROOM:
                return UPDATE_PROFILE_ROOM;
              default:
                return '';
            }
          }());
          String _value = () {
            switch (type) {
              case UpdateProfile.DEPT:
                return studentData.dept;
              case UpdateProfile.HALL:
                return hallName(studentData.hall);
              case UpdateProfile.PROGRM:
                return studentData.program;
              case UpdateProfile.ROOM:
                return studentData.room;
              default:
                return '';
            }
          }();
          // late String prev;
          // bool _loading = false;
          // type == 'hall'?hallName(studentData.hall) : studentData.room;
          return StatefulBuilder(builder: (context, setStat) {
            final _formKey = GlobalKey<FormState>();
            // final type2 = type;
            return AlertDialog(
              elevation: 5.0,
              contentPadding: const EdgeInsets.all(20),
              actionsOverflowButtonSpacing: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              title: Center(
                  child: Text('Update ${_typeValue.capitaliseFirst}')),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Material(
                      color: Colors.transparent,
                      child: Container(
                        child: type == UpdateProfile.HALL ||
                                type == UpdateProfile.PROGRM ||
                                type == UpdateProfile.DEPT
                            ? DropdownButtonFormField<String>(
                                items: data!.map((location) {
                                  return DropdownMenuItem(
                                    value: type == UpdateProfile.DEPT
                                        ? convertAbbrvofDeptToFF(location)
                                        : location,
                                    child: SizedBox(
                                      width: MediaQuery.of(context)
                                              .size
                                              .width -
                                          200,
                                      child: AutoSizeText(
                                          type == UpdateProfile.HALL
                                              ? hallName(location)
                                              : (type == UpdateProfile.DEPT
                                                  ? convertAbbrvofDeptToFF(
                                                      location)
                                                  : location)),
                                    ),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                    labelText: type == UpdateProfile.DEPT? 'Department' : _typeValue.capitaliseFirst,
                                    hintText: type == UpdateProfile.DEPT? 'Select Department' :
																		'Select ${_typeValue.capitaliseFirst}',
                                    isDense: true),
                                onChanged: (newValue) => setStat(() {
                                  _value = type == UpdateProfile.HALL
                                      ? hallName(newValue!)
                                      : (type == UpdateProfile.DEPT
                                          ? convertAbbrvofDeptToFF(
                                              newValue!)
                                          : newValue!);
                                }),
                                value: _value,
                                validator: (value) => value == null ||
                                        value.isEmpty
                                    ? 'The field is required to update record'
                                    : null,
                                onSaved: (value) => _value =
                                    type == UpdateProfile.HALL
                                        ? hallName(value!)
                                        : (type == UpdateProfile.DEPT
                                            ? convertAbbrvofDeptToFF(value!)
                                            : value!),
                              )
                            : TextFormField(
                                toolbarOptions: const ToolbarOptions(
                                  copy: true,
                                  paste: true,
                                  selectAll: true,
                                ),
                                keyboardType: TextInputType.text,
                                initialValue: 
																		// type2 == UpdateProfile.ROOM
                                    // ? 
																				// textEditingController.text
																				// studentData.room
                                    // : 
																				textEditingController.text,
                                decoration: InputDecoration(
                                    labelText: type == UpdateProfile.ROOM
                                        ? 'Room'
                                        : 'Department',
                                    helperText: type == UpdateProfile.ROOM
                                        ? 'Room should be like A-508'
                                        : 'Your department'),
                                validator: (value) => value!.isEmpty
                                    ? 'The field is required to update record'
                                    : null,
                                onSaved: (value) => _value = value!,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                BlocConsumer<StudentCubit, StudentState>(
                    listener: (context, state) {
											log(state.isUpdating.toString(),name:'STATE');
                      if (state.isUpdating == false) {
                        state.apiFailure!.fold(() {
															// Student _student;
															textEditingController.text = _value;
                          state.dbFailure!.fold(() {
                            Toast.createSuccess(
                                    message:
																		type == UpdateProfile.DEPT?
																			"Successfully updated your department!!!"
                                    :'Successfully updated your ${_typeValue.toLowerCase()}!!!')
                                .show(context);
                            // hallController.text = studentData.hall;
                            // roomController.text = studentData.room;
                            // deptController.text = studentData.dept;
                            // programController.text = studentData.program;
														context.read<StudentCubit>().getUserStudentData();
														Navigator.pop(context);
                          }, (a) {
                            Toast.createError(
                                message: 'Updation Failed!!!').show(context);
																	textEditingController.text = curentVal;
                          });
															return;
                        }, (a) {
                          Toast.createApiError(a).show(context);
															textEditingController.text = curentVal;
															return ;
                        });
                       state.dbFailure!.fold(() {
                            Toast.createSuccess(
                                    message:
                                        'Successfully Updated your ${_typeValue.toLowerCase()}')
                                .show(context);
														
														context.read<StudentCubit>().getUserStudentData();
														Navigator.pop(context);
                          }, (a) {
                            Toast.createError(
                                message: 'Updation Failed!!!').show(context);
                            textEditingController.text = curentVal;
                          });
                      }
                    },
                    listenWhen: (p, c) => p.isUpdating != c.isUpdating,
                    buildWhen: (p, c) => p.isUpdating != c.isUpdating,
                    builder: (context, state) {
                      log(state.toString(), name: 'Profile');
                      return AbsorbPointer(
                        absorbing: state.isUpdating,
                        //  ||
                        //     context
                        //         .watch<ApiBloc>()
                        //         .state
                        //         .load
                        //         .contains(API.updateSUser),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 88,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 80),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const AutoSizeText('Dismiss')),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 8),
																		width: 100,
                                // constraints: BoxConstraints(
                                //     maxWidth:
                                //         MediaQuery.of(context).size.width -
                                //             178),
                                // widthFactor: 0.6,
                                //   heightFactor: 1,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    primary: Colors.blue,
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      Toast.createInformation(
                                              message: 'Updating !!!')
                                          .show(context);
                                      context
                                          .read<StudentCubit>()
                                          .updateStudentData(
                                              studentData,
                                              MapEntry(
                                                _typeValue.toLowerCase(),
                                                _value,
                                              ));
                                      // context
                                      //     .read<ApiBloc>()
                                      //     .add(ApiEvent.updateStudentData(
                                      //         rollNo: studentData.rollNo,
                                      //         value: MapEntry(
                                      //           _typeValue.toLowerCase(),
                                      //           _value,
                                      //         )));
                                      // Navigator.pop(context);
                                    }
                                  },
                                  child: state.isUpdating
                                      // ||
                                      //         context
                                      //             .watch<ApiBloc>()
                                      //             .state
                                      //             .load
                                      //             .contains(API.updateSUser)
                                      ? const SizedBox(
																						height: 20,
																						width: 20,
                                        child: Center(
                                            child: CircularProgressIndicator(
																												// value: 20,
                                                  backgroundColor:
                                              Colors.white,
                                                  strokeWidth: 2,
                                                ),
                                          ),
                                      )
                                      : const AutoSizeText(
                                          'Update ',
                                          maxLines: 1,
                                          minFontSize: 2,
                                          maxFontSize: 15,
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                  // )),
                                ),
                              )
                            ],
                          ),
                          // },
                        ),
                      );
                      // ),
                    })
              ],
            );
          });
        });
  }
}

const String UPDATE_PROFILE_ROOM = "Room";
const String UPDATE_PROFILE_HALL = "Hall";
const String UPDATE_PROFILE_DEPT = "Department";
const String UPDATE_PROFILE_PROGRM = "Program";

enum UpdateProfile { ROOM, HALL, DEPT, PROGRM }

String hallName(String hall) {
  if (hall.toLowerCase() == 'hall') {
    return 'Hall';
  }
  if (hall.toLowerCase().contains('hall')) {
    // ignore: parameter_assignments
    hall = hall.replaceAll(' ', '');
    // print(hall);
    switch (hall.toLowerCase()) {
      case 'hallx':
        return 'Hall 10';
        // break;
      case 'hallxi':
        return 'Hall 11';
        // break;
      default:
        return '${hall[0].toUpperCase()}${hall.substring(1, 4).toLowerCase()} ${hall.substring(4)}';
    }
  } else {
    return hall.toUpperCase();
  }
}

class DetailsTile extends StatelessWidget {
  const DetailsTile({
    Key? key,
    required this.width,
    required TextEditingController controller,
    required this.label,
    required this.onPressed,
  })  : _controller = controller,
        super(key: key);

  final double width;
  final TextEditingController _controller;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: width,
          // (mediaWidth - 150) * 0.6,
          child: TextFormField(
            readOnly: true,
            controller: _controller,
            decoration: InputDecoration(
                border: const OutlineInputBorder(), labelText: label),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: onPressed,
          // {
          // _updateDialog(UpdateProfile.DEPT);
          // },
          tooltip: 'Update $label',
        ),
      ],
    );
  }
}

final List<String> program = [
  'BS',
  'BS-MBA',
  'BS-MS',
  'BS-MT',
  'BT-MBA',
  'BT-MS',
  'BTech',
  'DIIT',
  'Exchng Prog.',
  'MBA',
  'MDes',
  'MS-Research',
  'MSc(2 Yr)',
  'MSc(Int)',
  'MSc-PhD(Dual)',
  'MT(Dual)',
  'MTech',
  'PGPEX-VLM',
  'PhD',
  'Prep.',
  'SURGE'
];
final List<String> dept = [
  'Department',
  'AE',
  'BSBE',
  'CE',
  'CHE',
  'CHM',
  'CSE',
  'Cognitive Sciences',
  'DOAA',
  'DORA',
  'Dean Of Research & Development',
  'ECO',
  'EE',
  'EEM',
  'ES',
  'HSS',
  'IME',
  'Laser Technology',
  'MDes',
  'ME',
  'MSE',
  'MTH',
  'Mat.& Met.Engg.',
  'Materials Science Programme',
  'Nucc. Eng.& Tech Prog.',
  'PHY',
  'Photonics Science & Engg.',
  'Statistics',
];

extension StringX on String {
  String get capitaliseFirst => this[0].toUpperCase() + substring(1);
}
