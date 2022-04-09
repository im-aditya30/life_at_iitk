import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
// import 'package:life_at_iitk/domain/api/api_interface.dart';
import '../../domain/api/api_failure.dart';
import '../../domain/api/api_interface.dart';
import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/auth_interface.dart';
import '../../domain/auth/auth_map.dart';
import '../../domain/auth/user.dart' ;
import '../../domain/auth/value_objects.dart';
import '../../domain/database/database_interface.dart';
// import '../api/api_implementation.dart';
import 'firebase_user_method.dart';

@LazySingleton(as: AuthInterface)
class FirebaseAuthInterface implements AuthInterface {
  final FirebaseAuth _firebaseAuth;
	final ApiInterface apiInterface;
	final DBInterface _dbInterface;
  FirebaseAuthInterface(this._firebaseAuth, this.apiInterface, this._dbInterface);

	// static ApiInterface apiInterface;

  @override
  Future<Either<AuthFailure, Unit>> registerWithUserNameAndPassword(
      {required UserName userName, required Password password}) async {
    final emailAddress = userName.getOrCrash();
    final _password = password.getOrCrash();
    try {
      final UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailAddress, password: _password)
          .timeout(const Duration(seconds: 30));

      final authMap = AuthEmailMap(result.user!.uid, emailAddress);
      await apiInterface.createUserDataAtDatabase(auth: authMap);
      await result.user?.sendEmailVerification();
      return right(unit);
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return left(const AuthFailure.userNameAlreadyInUse());
        // case 'operation-not-allowed' : return left(const AuthFailure.disabledAccount());
        case 'network-request-failed':
          return left(const AuthFailure.noInternet());
        default:
          return left(const AuthFailure.serverError());
      }
    } on SocketException {
      return left(const AuthFailure.noInternet());
    } on ApiFailure catch (e) {
			log('$e', name: 'Error on Firebase signup function');
			if(e == const ApiFailure.noInternet()){
				return left(const AuthFailure.noInternet());
			}else if(e == const ApiFailure.errorWhileMakingRequest()){
				return left(const AuthFailure.errorWhileMakingRequest());
			}else if(e == const ApiFailure.serverError()){
				return left(const AuthFailure.serverError());
			}else {
				return left(const AuthFailure.unknownError());
			}
		} catch (e) {
			log('$e', name: 'Error on Firebase signup function');
			print(e);
      return left(const AuthFailure.unknownError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithUserNameAndPassword(
      {required UserName userName, required Password password}) async {
    final emailAddress = userName.getOrCrash();
    final _password = password.getOrCrash();
    try {
			// await Future.delayed(const Duration(seconds: 6), () => throw const AuthFailure.notVerified());
      final UserCredential result = await _firebaseAuth
          .signInWithEmailAndPassword(email: emailAddress, password: _password)
          .timeout(const Duration(seconds: 10));
      // final authMap = AuthIdMap(
      //     result.user.uid, emailAddress.replaceAll("@iitk.ac.in", ""));
      if (!result.user!.emailVerified) throw const AuthFailure.notVerified();
			
			await apiInterface.sendDeviceToken(auth: AuthIdMap(
          result.user!.uid, emailAddress.replaceAll("@iitk.ac.in", "")));
			await _dbInterface.saveAuthMap(authIdMap: AuthIdMap(
          result.user!.uid, emailAddress.replaceAll("@iitk.ac.in", "")));
      return right(unit);
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return left(const AuthFailure.invalidEmailAndPasswordCombination());
        case 'wrong-password':
          return left(const AuthFailure.invalidEmailAndPasswordCombination());
        case 'user-disabled':
          return left(const AuthFailure.disabledAccount());
        case 'network-request-failed':
          return left(const AuthFailure.noInternet());
      }
      log(e.toString(), name: 'Sign in firebase Function Errr');
      return left(const AuthFailure.serverError());
    } on SocketException {
      return left(const AuthFailure.noInternet());
    } on ApiFailure catch (e) {
			if(e == const ApiFailure.noInternet()){
				return left(const AuthFailure.noInternet());
			}else if(e == const ApiFailure.errorWhileMakingRequest()){
				return left(const AuthFailure.errorWhileMakingRequest());
			}else if(e == const ApiFailure.serverError()){
				return left(const AuthFailure.serverError());
			}else {
				return left(const AuthFailure.unknownError());
			}
		} on TimeoutException catch(e){
			log(e.toString());
			return left(const AuthFailure.noInternet());
		}on AuthFailure catch(e){
			log(e.toString());
			if(e == const AuthFailure.notVerified())
				return left(const AuthFailure.notVerified());
			return left(const AuthFailure.unknownError());
		}catch (e) {
      log(e.toString());
      return left(const AuthFailure.unknownError());
    }
  }

  // @override
  // Future<Either<AuthFailure, Unit>> createUserDataAtDatabase(
  //     {AuthEmailMap authEmailMap}) {
  //   // Response response TODO:
  //   try {} catch (e) {
  //     throw left(AuthFailure.unknownError());
  //   }
  // }

  @override
  Future<Either<AuthFailure, Unit>> resetPassword({required UserName userName}) async {
    final emailAddress = userName.getOrCrash();
    try {
      await _firebaseAuth
          .sendPasswordResetEmail(email: emailAddress)
          .timeout(const Duration(seconds: 30));
			return right(unit);
      // return await Future.delayed(const Duration(seconds: 10), () => right(unit));
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return left(const AuthFailure.invalidEmailAndPasswordCombination());
        case 'user-disabled':
          return left(const AuthFailure.disabledAccount());
        case 'network-request-failed':
          return left(const AuthFailure.noInternet());
      }
      log(e.message ?? "ERROR");
      return left(const AuthFailure.serverError());
    } on SocketException {
      return left(const AuthFailure.noInternet());
    } catch (e) {
      log(e.toString());
      return left(const AuthFailure.unknownError());
    }
  }


  @override
  Future<Either<AuthFailure, Unit>> sendVerificationEmail() async {
    try {
			final user = _firebaseAuth.currentUser;
			if(user == null ){
				throw const AuthFailure.errorWhileMakingRequest();
			}
			else {
				await _firebaseAuth.currentUser?.sendEmailVerification();
				return right(unit);
			}
		} on SocketException {
      return left(const AuthFailure.noInternet());
    } on AuthFailure catch(e){
			return left(e);
		}catch (e) {
      log(e.toString());
      return left(const AuthFailure.unknownError());
    }
  }

  @override
  Future<void> signOut() async{
		
		await _firebaseAuth.signOut().catchError(print);
	}

  @override
  Option<User> getCurrentUser() {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser?.emailVerified == true) return optionOf(firebaseUser?.toUserType()); 
		return optionOf(null);
  }
}
