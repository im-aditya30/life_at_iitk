// import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/app/posts/fcm_cubit/fcm_cubit.dart';
import 'package:life_at_iitk/domain/models/hive/council.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/functions.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import '../../../hive_extension.dart';
import '../../../infrastructure/core/extensions.dart';

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  final Set<String> items = {};
  // double width = 0;
  User? userData;
  Council? councilData;

  @override
  void initState() {
    super.initState();
    userData = Hive.getBox<User>().get(0, defaultValue: User.defaultBox());
    councilData = Hive.getBox<Council>()
        .get(0, defaultValue: const Council(subCouncil: {}));
    final Set<String> prefs = userData?.prefs.toSet() ?? {};
    // log("${councilData?.subCouncil.length}", name: 'Prefs');
    councilData?.subCouncil.forEach((key, value) {
      // print(prefs);
      if (value.entity.isNotEmpty) {
        items.add(convertToCouncilName(key));
        value.entity.forEach((element) {
          element.isSelected =
              // print("${element.toString()} : ${
              prefs.contains(element.toString());
          // }");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: items.length,
      child: CustomScaffold(
        appBar: AppBar(
            title: Text("Preferences", 
							style: TextStyle(
								color: CustomColors(context).textColor
							)),
            bottom: TabBar(isScrollable: true, tabs: [
              ...items.map(
                (e) => Tab(
                    child: SizedBox(
                  width: width * 0.3,
                  child: Center(
                      child: Text(
                    convertToCouncilName(e),
                  )),
                )),
              )
            ])),
        body: BlocConsumer<ApiBloc, ApiState>(
          listener: (context, state) {
            if (state.load.contains(API.prefs))
              Toast.createInformation(message: 'Updating Preferences!!!')
                  .show(context);
							state.value.fold(() => {},
								(a) {
									if(a is Prefs) {
										Hive.getBox<User>().putAt(
																0,
																userData!.copyWith(
																		prefs: a.sel.toList()));
										BlocProvider.of<FcmCubit>(context).subsUnsubsTopic(
                                    subscribe: a.sel.toList(),
                                    unsubscribe: a.unSel.toList());	
									}
								});
            state.apiFailureOrSuccessOption.fold(
                () {},
                (a) => a.fold(
                    (l) => Toast.createApiError(l).show(context),
                    (_) => Toast.createSuccess(
                            message: 'Your preferences have been updated!!!')
                        .show(context)));
          },
          listenWhen: (previous, current) =>
              previous.load.contains(API.prefs) !=
              current.load.contains(API.prefs),
          buildWhen: (previous, current) =>
              previous.load.contains(API.prefs) !=
              current.load.contains(API.prefs),
          builder: (context, state) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Center(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: TabBarView(
                            children: [
                              for (SubCouncil value
                                  in councilData!.subCouncil.values.toList())
                                // ...councilData.subCouncil.values.map((value) {
                                if (value.entity.isNotEmpty)
                                  tile(value.entity)
                            ]),
                      ),
                      SizedBox(
                        height: 50.0,
                        child: Container(
                          color: CustomColors(context).bgColor,
                          alignment: Alignment.bottomCenter,
                          height: 50,
                          width: width,
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () async {
                              final Prefs? prefs = await confirmdialog(councilData!, userData!);
																if(prefs!= null){
																	BlocProvider.of<ApiBloc>(context).add(
																		ApiEvent.updatePreferences(
																				prefs: prefs));
																}
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(
                                color: Colors.white,
                                // fontFamily: 'Comfortaa',
                                // fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.load.contains(API.prefs))
                  Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black.withOpacity(0.8),
                      child:
                          const Center(child: CircularProgressIndicator())),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget tile(List<Entity> entityList) {
    return ListView.builder(
        itemCount: entityList.length,
        itemBuilder: (context, index) {
          final Entity entity = entityList[index];
          // log(entity.isSelected.toString(), name: 'PREF TILE SEL ENTITY');
          return InkWell(
            onTap: () {}, //TODO add details
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    entity.toString(),
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      // fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Checkbox(
                        activeColor: Colors.accents[5],
                        value: entity.isSelected,
                        onChanged: (value) async {
                          if (!value!) {
                            final status = await confirmdialogForPrefs(entity);
                            if (status == true) {
                              // setState(() {
                              entityList[index].isSelected = false;
                              // });
                              // entity.copyWith(isSelected: false);
                            }
                          } else {
                            setState(() {
                              // entity.copyWith(isSelected: value);
                              entityList[index].isSelected = value;
                            });
                          }
                        },
                      )
                      // ),
                      ),
                )
              ],
            ),
          );
        });
  }

  Future<bool?> confirmdialogForPrefs(
    Entity entity,
  ) {
    return showDialog<bool?>(
        context: context,
        builder: (context) => HookBuilder(builder: (context) {
              final TextEditingController _controller = TextEditingController();
              final _formKey = GlobalKey<FormState>();
              useEffect(() {
                _controller.text = "";
                return _controller.dispose;
              }, const []);

              return AlertDialog(
                title: Row(
                  children: const [
                    Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                    Text('  Alert',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        )),
                  ],
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                        'Do you really want to unsubscribe \n ${entity.toString()}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        )),
                    const SizedBox(height: 10.0),
                    Text(
                      'Note: You will not be able to receive any notification from ${entity.toString()}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 10.0,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10.0),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Type ',
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: entity.toString(),
                                  style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ' to continue',
                                  style: TextStyle(
                                      color: Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black))
                            ])),
                    //  SizedBox(height: 20.0),
                    Material(
                      color: Colors.transparent,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            paste: true,
                            selectAll: true,
                          ),
                          keyboardType: TextInputType.text,
                          decoration:
                              InputDecoration(hintText: entity.toString()),
                          controller: _controller,
                          validator: (value) => value!.isEmpty
                              ? "Field can't be empty"
                              : value != entity.toString() &&
                                      value != entity.toString().toLowerCase()
                                  ? 'Type the correct name of topic to Unsubscribe it'
                                  : null,
                          onSaved: (val) => _controller.text = val!,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        CupertinoButton(
                          onPressed: () {
                            // setState(() {
                            // // entity.copyWith(isSelected: true);
                            // entity.isSelected = true;
                            // });
                            Navigator.pop(context, false);
                          },
                          child: const Text('Cancel'),
                        ),
                        RaisedButton(
                            color: Colors.red.shade900,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                if (_controller.text == entity.toString() ||
                                    _controller.text ==
                                        entity.toString().toLowerCase()) {
                                  // setState(() {
                                  // print(false);
                                  // // value;
                                  // entity = entity.copyWith(isSelected: value ?? true);
                                  entity.isSelected = false;
                                  // // Navigator.pop(context);
                                  // });
                                  Navigator.pop(context, true);
                                }
                              }
                            },
                            child: const Text('Unsubscribe',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Comfortaa',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                )))
                      ],
                    ),
                  ],
                ),
              );
            }));
  }

  Future<Prefs?> confirmdialog(Council councilData, User userData) {
    return showDialog<Prefs>(
        context: context,
        builder: (context) => HookBuilder(builder: (context) {
              final TextEditingController _controller = TextEditingController();
              final _formKey = GlobalKey<FormState>();
              useEffect(() {
                _controller.text = "";
                return _controller.dispose;
              }, const []);
              return AlertDialog(
                title: Row(
                  children: const [
                    Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                    Text('  Alert',
                        style: TextStyle(
                          color: Colors.red,
                          // fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        )),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Do you really want to save changes',
                      style: TextStyle(
                        color: Colors.red,
                        // fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Note: You will not be able to receive notifications for the unsubscribed topics',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    const SizedBox(height: 10.0),
                    RichText(
                        text: TextSpan(
                            text: 'Type ',
                            style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Yes ',
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'to continue',
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black))
                        ])),
                    const SizedBox(height: 10.0),
                    Material(
                      color: Colors.transparent,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            paste: true,
                            selectAll: true,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Yes',
                          ),
                          controller: _controller,
                          validator: (value) =>
                              value!.isEmpty ? "Field can't be empty" : null,
                          onSaved: (val) => _controller.text = val!,
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  CupertinoButton(
                    onPressed: () => Navigator.pop(context, null),
                    child: const Text('Cancel'),
                  ),
                  RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          FocusScope.of(context).unfocus();
                          final Set<String> selectedValues = {};
                          final Set<String> unSelectedValues = {};
                          final Map<String, dynamic> updatedCouncils = {};
                          councilData.subCouncil.forEach((key, value) {
														// print("$key : {\n${value.entity.length}\n}");
														
                          	final Set<String> tempSelectedValues = {};
                          	final Set<String> tempUnSelectedValues = {};
                            // ignore: avoid_function_literals_in_foreach_calls
                            value.entity.forEach((e) => e.isSelected == true
                                ? tempSelectedValues.add(e.toString())
                                : tempUnSelectedValues.add(e.toString()));
                            updatedCouncils.putOrUpdate(key, () {
                              return {
                                "entity": tempSelectedValues.toList(),
                                "misc": value.misc,
                              };
                            });
														selectedValues.addAll(tempSelectedValues);
                            selectedValues.addAll(value.misc);
                          });
													// print(updatedCouncils);
                          Navigator.pop(context, Prefs(
                                    sel: selectedValues,
                                    unSel: unSelectedValues,
                                    upCouncil: updatedCouncils));
                        }
                      },
                      color: Colors.red.shade900,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      child: const Text('Save Changes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ))),
                ],
              );
            }));
  }
}

class Prefs {
  final Set<String> sel;
  final Set<String> unSel;
  final Map<String, dynamic> upCouncil;

  Prefs({required this.sel, required this.unSel, required this.upCouncil});
}
