import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/app/posts/student/student_cubit.dart';
import 'package:life_at_iitk/domain/api/api_failure.dart';
import 'package:life_at_iitk/domain/models/student.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/functions.dart';
import 'package:life_at_iitk/presentation/core/widgets/custom_scaffold.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import 'package:life_at_iitk/presentation/routes/router.gr.dart';
import 'package:life_at_iitk/presentation/screen/profile/profile_page.dart';

class StudentSearchPage extends HookWidget {
 // ignore: prefer_final_fields
	// static _formKey = GlobalKey<FormState>();
	final Set<String> year = List.generate(16,(index){
		if(index == 1) return 'Y8';
		if(index == 2) return 'Y9';
		return index == 0 ? 'Year' : (index==15)? 'Other':'Y${index + 7}';
	}).toSet();
  final List<String> gender = ['Gender','Male','Female'];
  final Set<String> hall = List.generate(15, (index){
		if(index == 0) return 'Hall';
		if(index == 1) return 'GH';
		return 'HALL ${index-1}';
	}).toSet();
  final List<String> program = [
		'Program',
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
  final List<String> bloodGroupList = ['Blood Group','A+','A-','AB+','AB-','B+','B-','O+','O-'];
	@override
	Widget build(BuildContext context) {
		useEffect((){
			hall.union({'DAY', 'CPWD', 'ACES','Type 5', 'Type 1B', 'Type 1', 'SBRA', 'RA', 'NRA'});
			// hall.insertAll(13, ['DAY', 'CPWD', 'ACES','Type 5', 'Type 1B', 'Type 1', 'SBRA', 'RA', 'NRA']);
      // hall.insertAll(0, ['Hall','GH']);
			return;
		},const []);
	final _formKey = useState(GlobalKey<FormState>());
	final _yearIndex = useState('Year');
	final _gender = useState('Gender');
	final _hall = useState('Hall');
	final _program = useState('Program');
	final _department = useState('Department');
	final _bloodGrp = useState('Blood Group');
	final studentVal = useState(Student.defaultData(''));
	final _homeTown = useTextEditingController(text: '');
	final _search = useTextEditingController(text: '');
	final _homeTownF = useFocusNode();
	final _searchF = useFocusNode();
    return MultiBlocListener(
			listeners: [
				BlocListener<StudentCubit, StudentState>(
					listener: (context, state) {
						state.apiFailure?.fold(
							() => state.dbFailure?.fold(() {}, (a) => Toast.createDBError(a)),
							(a) => Toast.createApiError(a));
						
					},
					listenWhen: (p,c) => p.isLoading != c.isLoading || p.isUpdating != c.isUpdating,
				),
				BlocListener<ApiBloc,ApiState>(
					listener: (context, state) {
					},
					listenWhen: (p,c) => p.load.contains(API.fetchAllStudent) != c.load.contains(API.fetchAllStudent),
				),
			],
			child: BlocConsumer<StudentCubit, StudentState>(
				listener: (context, state) {
					if(!state.isUpdating) 
						state.apiFailure?.fold(
							() => Toast.createSuccess(message: 'Database updated successfully !!!').show(context), 
							(a) => Toast.createApiError(a).show(context)
						)?? Toast.createSuccess(message: 'Database updated successfully !!!').show(context);
				},
				listenWhen: (p,c) => p.isUpdating != c.isUpdating,
				buildWhen: (p,c) => p.isLoading != c.isLoading || p.isUpdating != c.isUpdating,
				builder: (context, state) {
					final width = MediaQuery.of(context).size.width * 0.4;
					return CustomScaffold(
								appBarActions: <Widget>[
										IconButton(
											icon: const Icon(Icons.refresh), 
											tooltip: 'Update Database',
											onPressed: (){
												context.read<StudentCubit>().updateStudentDB();
											// context.read<StudentCubit>().ge
										})
									],
								body: SizedBox.expand(
									child: Stack(
										fit: StackFit.expand,
										children: <Widget>[
											SizedBox.expand(
										child: SingleChildScrollView(
											child: Column(    children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(MaterialCommunityIcons.account_search,
                            size: 50,
                          ),
                          SizedBox(width: 10),
                          Text('Student Search',
                            style: TextStyle(
                              fontSize: 30
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)
                        ),
                        color: Theme.of(context).brightness == Brightness.dark? Colors.black : Colors.white,
                        
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).brightness == Brightness.dark? 
                              Theme.of(context).cardColor
                            : Colors.white.withOpacity(0.8),)
                          ),
                          child: Form(
                            key:_formKey.value,
                            child: SingleChildScrollView(
                              child: Container(
                                margin: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          SizedBox(
                                            width: width,
                                            child: DropdownButtonFormField<String>(
                                              items: year.map((y){
                                                return DropdownMenuItem(
                                                  value: y,
                                                  child: Text(y),
                                                );
                                              }).toList(), 
                                              decoration: const InputDecoration(
                                                hintText: 'Choose Year...',
                                              ),
                                              onChanged: (value)=> _yearIndex.value = value!,
                                              value: _yearIndex.value,
                                              onSaved: (value){
                                                if(value?.replaceAll(' ','').isNotEmpty == true && value!=year.first){
                                                  studentVal.value = studentVal.value.copyWith(year: value);
																									return;
                                                }
                                                studentVal.value = studentVal.value.copyWith(year: '');
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: width,
                                            child: DropdownButtonFormField<String>(
                                              items: gender.map((g){
                                                return DropdownMenuItem(
                                                  value: g,
                                                  child: Text(g),
                                                );
                                              }).toList(),
                                              decoration: const InputDecoration(
                                                hintText: 'Choose Gender...',
                                              ),
                                              onChanged: (value)=> _gender.value = value!,
                                              value: _gender.value,
                                              onSaved: (value){
                                                if(value?.replaceAll(' ','').isNotEmpty == true && value!=gender[0]){
                                                  studentVal.value = studentVal.value.copyWith(gender: converttoGenderAbb(value!));
																									return;
                                                }
                                                studentVal.value = studentVal.value.copyWith(gender: '');
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 80,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          SizedBox(
                                            width: width,
                                            child: DropdownButtonFormField<String>(
                                              items: hall.map((hl){
                                                return DropdownMenuItem(
                                                  value: hl,
                                                  child: Text(hallName(hl)),
                                                );
                                              }).toList(), 
                                              decoration: const InputDecoration(
                                                hintText: 'Choose Hall...',
                                              ),
                                              onChanged: (value)=> _hall.value = value!,
                                              value: _hall.value,
                                              onSaved: (value){
                                                if(value?.replaceAll(' ','').isNotEmpty == true && value!=hall.first){
                                                  if(value.toString().toLowerCase() == 'hall 10' || value.toString().toLowerCase() == 'hall 11'){
																										studentVal.value = studentVal.value.copyWith(hall: (value.toString().toLowerCase() == 'hall 10')?'HallX':'HallXI');
																										return;
                                                  }
                                                  studentVal.value = studentVal.value.copyWith(hall: value);
																									return;
                                                }
																								studentVal.value = studentVal.value.copyWith(hall: '');
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: width,
                                            child: DropdownButtonFormField<String>(
                                              items: program.map((prg){
                                                return DropdownMenuItem(
                                                  value: prg,
                                                  child: Text(prg),
                                                );
                                              }).toList(),
                                              isExpanded: true,
                                              onChanged: (value)=> _program.value = value!,
                                              value: _program.value,
                                              onSaved: (value){
                                                if(value?.replaceAll(' ','').isNotEmpty == true && value!= program[0]){
                                                  studentVal.value = studentVal.value.copyWith(program: value);
																									return;
                                                }
																								studentVal.value = studentVal.value.copyWith(program: '');
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.maxFinite,
                                      child: DropdownButtonFormField<String>(
                                        items: dept.map((depart){
                                          return DropdownMenuItem(
                                            value: depart,
                                            child: Text(depart),
                                          );
                                        }).toList(),
                                        onChanged: (value)=> _department.value = value!,
                                        value: _department.value,
                                        onSaved: (value){
                                          if(value?.replaceAll(' ','').isNotEmpty == true && value!= dept[0]){
                                            studentVal.value = studentVal.value.copyWith(dept: value);
																						return;
                                          }
																					studentVal.value = studentVal.value.copyWith(dept: '');
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 18.0),
                                      width: double.maxFinite,
                                      child: DropdownButtonFormField<String>(
                                        items: bloodGroupList.map((bg){
                                          return DropdownMenuItem(
                                            value: bg,
                                            child: Text(bg),
                                          );
                                        }).toList(),
                                        onChanged: (value)=> _bloodGrp.value = value!,
                                        value: _bloodGrp.value,
                                        onSaved: (value){
                                          if(value?.replaceAll(' ','').isNotEmpty == true && value!= bloodGroupList[0]){
                                            studentVal.value = studentVal.value.copyWith(bloodGroup: value);
																						return;
                                          }
																					studentVal.value = studentVal.value.copyWith(bloodGroup: '');
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical:8.0),
                                      child: TextFormField(
                                        toolbarOptions: const ToolbarOptions(
                                          cut: true,
                                          copy: true,
                                          paste: true,
                                          selectAll: true,
                                        ),
																				controller: _homeTown,
																				focusNode: _homeTownF,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          labelText: 'Hometown',
                                        ),
																				onSaved: (value){
                                          if(value?.replaceAll(' ','').isNotEmpty == true){
                                            studentVal.value = studentVal.value.copyWith(hometown: value);
																						return;
                                          }
																					studentVal.value = studentVal.value.copyWith(hometown: '');
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical:8.0),
                                      child: TextFormField(
                                        toolbarOptions: const ToolbarOptions(
                                          copy: true,
                                          paste: true,
                                          selectAll: true,
                                        ),
                                        keyboardType: TextInputType.text,
																				controller: _search,
																				focusNode: _searchF,
                                        decoration: const InputDecoration(
                                          hintText: 'Name, Username or Roll No',
                                        ),
                                        onSaved: (value){
                                          if(value?.replaceAll(' ','').isNotEmpty == true){
                                            studentVal.value = studentVal.value.copyWith(
																							rollNo: value,
																							name: value,
																							username: value);
                                            return ;
                                          }
																					studentVal.value = studentVal.value.copyWith(
																							rollNo: '',
																							name: '',
																							username: '');
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(16.0),
                                      constraints: const BoxConstraints(
                                        minWidth: 150
                                      ),
                                      child: ElevatedButton.icon(
                                        onPressed: ()async{
																					// Form.of(context).validate();
																					// Form.of(context).save();
                                          _formKey.value.currentState!.save();
																					// Focus.of(context).unfocus();
																					_homeTownF.unfocus();
																					_searchF.unfocus();
																					context.read<StudentCubit>().getAllStudentData();
																					context.router.push(SSResultRoute(query: studentVal.value));
                                        }, 
                                        icon: const Icon(Icons.search), 
                                        label: const Text('Search',style: TextStyle(fontSize: 15.0),)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ''' * Note: If you cannot view the profile photos try searching again after connecting to IITK newtwork.''',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: CustomColors(context).noteColor),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            if (state.isUpdating) 
							Container(
              color: Colors.black.withOpacity(0.8),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[                                
                    SpinKitDualRing(color: Theme.of(context).accentColor,size: 40,lineWidth: 5,),
                    const SizedBox(height:15),
                    const Text('Updating Database',style: TextStyle(color:Colors.white),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
				}));
	}
}
bool checkifThereisAvalue(
	String value,
	String checkingValue){
  // value = 
	// log('$value <><> $checkingValue',name: 'SS page');
	value = value.replaceAll(" ", '');
	
	log('$value <><> $checkingValue',name: 'SS page');
  // checkingValue = checkingValue != null ? checkingValue.replaceAll(' ', '') : '';
  return (checkingValue.replaceAll(' ', '').toLowerCase()).toLowerCase().contains(value.toLowerCase());
}
bool checkIfThereisAvalueForProgram(String value, String checkingValue){
  value = value.replaceAll(' ', '');
  value = convertAbbrvofDeptToFF(value).replaceAll(" ", "").toLowerCase();

  // checkingValue = checkingValue?.replaceAll(' ', '')?.toLowerCase()??"";
  return (checkingValue.replaceAll(' ', '').toLowerCase()).contains(value);

}

bool checkIfThereisAvalueForYear(String value, String checkingValue){
  value = value.replaceAll(' ', '');
	if(value.toLowerCase() == 'others'){
		return checkingValue.startsWith((RegExp(r'[0-9]')));
	}else if(value == 'Year' || value.isEmpty){
		return true;
	}else if(value == 'Y8' || value == 'Y9'){
		return checkingValue.startsWith(value);
	}
  final val = int.parse(value.replaceFirst('Y', ''));
	if(checkingValue.startsWith(RegExp(r'[0-9]'))){
		if(val/10 >= 1){
			return checkingValue.startsWith(value.replaceFirst('Y', ''));
		}
	}
	return false;
  // checkingValue = checkingValue?.replaceAll(' ', '')?.toLowerCase()??"";
  // return (checkingValue.replaceAll(' ', '').toLowerCase()).contains(value);

}

String converttoGenderAbb(String gender){
  if (gender == 'Male') {
    return 'M';
  } else if(gender == 'Female'){
    return 'F';
  }else{
    return gender;
  }
}