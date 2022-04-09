import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_at_iitk/app/core/functions.dart';
import 'package:life_at_iitk/app/posts/student/student_cubit.dart';
import 'package:life_at_iitk/domain/notfs/notifs_model.dart';
import 'package:life_at_iitk/injection.dart';
import '../../app/auth/auth_bloc.dart';
import '../routes/router.gr.dart';

class SplashPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {
						
					},
          authenticated: (_) {
						context.read<StudentCubit>().getUserStudentData();
						context.router.replace(const HomeRootRoute());
          },
          unAuthenticated: (_) =>
              context.router.replace(const SignInUpPageRoute()),
        );
      },
			child: Scaffold(
				body: Stack(
					fit: StackFit.expand,
					// mainAxisAlignment: MainAxisAlignment.center,
				  children: [
				    Align(
							child: Image.asset("assets/launch.png",width: 200,height: 200,)),
						// const SizedBox(height: 40),
						Align(
							// top: MediaQuery.of(context).size.height * 0.5 + 40,
							child: Container(
								margin: EdgeInsets.only(
									top: MediaQuery.of(context).size.height *0.6
								),
								child: const Center(child: CircularProgressIndicator()))),
				  ],
				)
			)
    );
  }
}


