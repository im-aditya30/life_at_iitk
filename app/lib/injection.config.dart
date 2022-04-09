// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i3;

import 'package:dartz/dartz.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_messaging/firebase_messaging.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'app/api/api_bloc.dart' as _i24;
import 'app/auth/auth_bloc.dart' as _i25;
import 'app/auth/sign_in_up_bloc/sign_in_form_bloc.dart' as _i22;
import 'app/core/functions.dart' as _i20;
import 'app/posts/fcm_cubit/fcm_cubit.dart' as _i21;
import 'app/posts/post/post_cubit.dart' as _i15;
import 'app/posts/repo/repo_bloc.dart' as _i26;
import 'app/posts/student/student_cubit.dart' as _i23;
import 'domain/api/api_interface.dart' as _i16;
import 'domain/auth/auth_interface.dart' as _i18;
import 'domain/auth/user.dart' as _i9;
import 'domain/database/database_interface.dart' as _i13;
import 'domain/database/posts/post_db_interface.dart' as _i10;
import 'infrastructure/api/api_implementation.dart' as _i17;
import 'infrastructure/auth/firebase_auth.dart' as _i19;
import 'infrastructure/core/injectionable_module.dart' as _i27;
import 'infrastructure/database/database_class.dart' as _i6;
import 'infrastructure/database/hive_class.dart' as _i7;
import 'infrastructure/database/moor/posts/database_class.dart' as _i11;
import 'infrastructure/database/repository.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final injectionableModule = _$InjectionableModule();
  await gh.factoryAsync<_i3.Directory>(() => injectionableModule.appDirectory,
      preResolve: true);
  gh.lazySingleton<_i4.FirebaseAuth>(() => injectionableModule.firebaseAuth);
  gh.lazySingleton<_i5.FirebaseMessaging>(
      () => injectionableModule.firebaseMessaging);
  gh.lazySingleton<_i6.GetDatabase>(() => injectionableModule.database);
  gh.lazySingleton<_i6.GetSSDatabase>(() => injectionableModule.studentDB);
  gh.factory<_i7.HiveDatabase>(() => _i7.HiveDatabase());
  gh.lazySingleton<_i8.Option<_i9.User>>(() => injectionableModule.currentUser);
  gh.singleton<_i10.PostDBInterface>(injectionableModule.postDao);
  gh.factory<_i11.PostDatabase>(() => _i11.PostDatabase());
  await gh.factoryAsync<_i12.SharedPreferences>(() => injectionableModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i13.DBInterface>(() => _i14.Repository(
      get<_i12.SharedPreferences>(),
      get<_i6.GetDatabase>(),
      get<_i7.HiveDatabase>(),
      get<_i6.GetSSDatabase>()));
  gh.factory<_i15.PostCubit>(() =>
      _i15.PostCubit(get<_i13.DBInterface>(), get<_i10.PostDBInterface>()));
  gh.lazySingleton<_i16.ApiInterface>(() => _i17.APIImplementation(
      get<_i5.FirebaseMessaging>(),
      get<_i13.DBInterface>(),
      get<_i10.PostDBInterface>(),
      get<_i4.FirebaseAuth>()));
  gh.lazySingleton<_i18.AuthInterface>(() => _i19.FirebaseAuthInterface(
      get<_i4.FirebaseAuth>(),
      get<_i16.ApiInterface>(),
      get<_i13.DBInterface>()));
  gh.factory<_i20.Fcm>(() => _i20.Fcm(get<_i16.ApiInterface>(),
      get<_i10.PostDBInterface>(), get<_i5.FirebaseMessaging>()));
  gh.factory<_i21.FcmCubit>(
      () => _i21.FcmCubit(get<_i5.FirebaseMessaging>(), get<_i20.Fcm>()));
  gh.factory<_i22.SignInFormBloc>(
      () => _i22.SignInFormBloc(get<_i18.AuthInterface>()));
  gh.factory<_i23.StudentCubit>(() =>
      _i23.StudentCubit(get<_i13.DBInterface>(), get<_i16.ApiInterface>()));
  gh.factory<_i24.ApiBloc>(() => _i24.ApiBloc(get<_i13.DBInterface>(),
      get<_i16.ApiInterface>(), get<_i10.PostDBInterface>()));
  gh.factory<_i25.AuthBloc>(() => _i25.AuthBloc(get<_i18.AuthInterface>()));
  gh.factory<_i26.RepoBloc>(
      () => _i26.RepoBloc(get<_i13.DBInterface>(), get<_i23.StudentCubit>()));
  return get;
}

class _$InjectionableModule extends _i27.InjectionableModule {}
