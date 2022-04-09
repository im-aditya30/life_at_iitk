// import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/domain/models/hive/council.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/presentation/core/functions.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/core/widgets/text_input.dart';
import 'package:provider/provider.dart';
import '../../../hive_extension.dart';

class MakeCoordinator extends StatefulHookWidget {
  const MakeCoordinator({Key? key}) : super(key: key);

  @override
  _MakeCoordinatorState createState() => _MakeCoordinatorState();
}

class _MakeCoordinatorState extends State<MakeCoordinator> {
  final _formKey = GlobalKey<FormState>();
  final Council councilData = Hive.getData<Council>();
  final userData = Hive.getData<User>();
  List<String> getCouncil() {
    if (userData.isLevel3) {
      return councilData.subCouncil.keys.toList();
    }
    return councilData.coordOfCouncil;
  }

  List<String> getEntities(String? council) {
    if (council == null) return [];
    if (userData.isLevel3) {
      return (councilData.subCouncil[council]?.entity
                      .map((e) => e.toString())
                      .toList() ??
                  [])
              .cast<String>() +
          (councilData.subCouncil[council]?.misc ?? []).cast<String>();
    }
    return councilData.subCouncil[council]?.coordiOfInCouncil ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final textF = useFocusNode();
    final textController = useTextEditingController(text: '');
    final ValueNotifier<String?> _selCouncil = useState(null);
    final ValueNotifier<String?> _selEntity = useState(null);

    final _entityItems = useState(<String>[]);
    void onSelectedCouncil(String council) {
      if (council != _selCouncil.value) {
        _selCouncil.value = council;
        _entityItems.value = [];
        _selEntity.value = null;
        _entityItems.value = getEntities(council);
      }
    }

    return BlocListener<ApiBloc, ApiState>(
      listenWhen: (p, c) => p.load.contains(API.makeCoordinator) != c.load.contains(API.makeCoordinator),
      listener: (context, state) {
        if (!state.load.contains(API.makeCoordinator)) {
					// print(state);
          state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold((f) => Toast.createApiError(f).show(context), (_) async{
								Toast.createSuccess(message: 'Done !!!').show(context);
                    if (textController.text == userData.id) {
                      final _councilData = councilData.copyWith(
                          coordOfCouncil: councilData.coordOfCouncil
                              .update(_selCouncil.value!),
                          subCouncil: councilData.subCouncil
                            ..update(
                                _selCouncil.value!,
                                (value) => value.copyWith(
                                    coordiOfInCouncil: councilData
                                        .subCouncil[_selCouncil.value]!
                                        .coordiOfInCouncil
                                        .update(_selEntity.value!))));
                      // print(_councilData.toMap());
                      await Hive.getBox<Council>().put(0, _councilData);
                      await Hive.getBox<User>().put(
                          0,
                          userData.copyWith(
                            admin: true,
                          ));
                    }
                  }));
        }
      },
      child: CustomScaffold(
          title: "Make Coordinator",
          body: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextInputWidget(
                      label: 'CC ID',
                      textEditingController: textController,
                      autoValidate: true,
                      isDense: false,
                      focusNode: textF,
                      validator: (value) => value.isEmpty
                          ? "CC ID can't be empty"
                          : (value.contains('@') ? 'Invalid CC Id' : null),
                      onSaved: (value) {
                        return textController.text = value;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: DropdownButtonFormField<String>(
                        icon: const Icon(Entypo.chevron_down),
                        items: getCouncil().map((location) {
                          // log(location);
                          return DropdownMenuItem(
                            value: location,
                            child: Text(convertToCouncilName(location)),
                          );
                        }).toList(),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                            labelText: 'Council', isDense: true),
                        onTap: () => FocusScope.of(context).unfocus(),
                        value: _selCouncil.value,
                        onChanged: (newValue) {
                          onSelectedCouncil(convertFromCouncilName(newValue!));
                        },
                        validator: (val) =>
                            val == null ? "Council can't be null" : null,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      icon: const Icon(Entypo.chevron_down),
                      items: _entityItems.value.map((location) {
                        return DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        );
                      }).toList(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: 'Entity',
                        isDense: true,
                      ),
                      onTap: () => FocusScope.of(context).unfocus(),
                      value: _selEntity.value,
                      onChanged: (newValue) => _selEntity.value = newValue,
                      validator: (val) =>
                          val == null ? "Entity can't be null" : null,
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: 120.0,
                      child: BlocBuilder<ApiBloc, ApiState>(
                        buildWhen: (p, c) =>
                            p.load.contains(API.makeCoordinator) != c.load.contains(API.makeCoordinator),
                        builder: (context, state) {
                          return RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {
                              if (state.load.contains(API.makeCoordinator)) return;
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
																Toast.createInformation(message: 'Making Coordinator !!!').show(context);
                                context.read<ApiBloc>().add(
                                    ApiEvent.makeCoordinator(
                                        id: textController.text,
                                        council: _selCouncil.value!,
                                        sub: _selEntity.value!));
                              }
                            },
                            child: state.load.contains(API.makeCoordinator)
                                ? const Padding(
                                    padding:
                                        EdgeInsets.only(top: 2.0, bottom: 4.0),
                                    child: SpinKitFadingCircle(
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  )
                                : const Text(
                                    'Save',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

extension ListX<T> on List<T> {
  List<T> update(T item) {
    final index = indexWhere((test) => test == item);
    if (index != -1) {
      this[index] = item;
      return this;
    }
    return this..add(item);
  }
}
