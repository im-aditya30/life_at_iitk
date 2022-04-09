import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/app/auth/auth_bloc.dart';
import 'package:life_at_iitk/app/posts/fcm_cubit/fcm_cubit.dart';
import 'package:life_at_iitk/app/posts/post/post_cubit.dart';
import 'package:life_at_iitk/app/posts/repo/repo_bloc.dart';
import 'package:life_at_iitk/app/posts/student/student_cubit.dart';
import 'package:life_at_iitk/presentation/routes/router.gr.dart';

// import 'package:life_at_iitk/presentation/routes/router.dart' as ar;

import '../../../injection.dart';
import '../../routes/router.gr.dart' as ar;

class HomeRoot extends HookWidget {
	static final innerRouterKey = GlobalKey<AutoRouterState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<RepoBloc>()..add(const RepoEvent.loadAppData()),
        ),
        BlocProvider(
					lazy: false,
            create: (context) =>
                getIt<FcmCubit>()..startFCM(context)),
				BlocProvider(
					create: (context) => getIt<PostCubit>()..loadAllBoookmark()),
        BlocProvider(create: (context) => getIt<StudentCubit>()..getUserStudentData()),
				BlocProvider(create: (context) => getIt<ApiBloc>()..add(const ApiEvent.fetchAllPost(timeStamp: 1)))
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
         state.maybeMap(
              unAuthenticated: (_) {
              context.router.replace(const SignInUpPageRoute());
							},
              orElse: () {},
            );
          },
        child: AutoRouter(key: innerRouterKey,),
      ),
    );
  }
}
