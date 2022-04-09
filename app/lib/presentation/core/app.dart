import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:life_at_iitk/app/posts/post/post_cubit.dart';
import 'package:life_at_iitk/app/posts/student/student_cubit.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:provider/provider.dart';
import '../../app/api/api_bloc.dart';
import '../../app/auth/auth_bloc.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';

const Map<ThemeMode, String> theme = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const Map<String, ThemeMode> themefromString = {
  'system': ThemeMode.system,
  'dark': ThemeMode.dark,
  'light': ThemeMode.light
};

class App extends StatelessWidget {
  // static final navigatorKey = GlobalKey<NavigatorState>();
	// final _innerRouterKey = GlobalKey<AutoRouterState>();
	final _router = Router();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        ),
        BlocProvider(create: (context) => getIt<ApiBloc>()),
				BlocProvider(create: (context) => getIt<PostCubit>()),
        BlocProvider(create: (context) => getIt<StudentCubit>()),
      ],
      child: ValueListenableBuilder<Box<String>>(
        valueListenable: Hive.box<String>('theme').listenable(keys: [0]),
        builder: (context, value, _) => MultiProvider(
          providers: [
						Provider<Directory>(
							create: (context) => getIt<Directory>())
					],
          child: GestureDetector(
						onTap: () {
							final FocusScopeNode currentFocus = FocusScope.of(context);
							if (!currentFocus.hasPrimaryFocus) {
								currentFocus.unfocus();
							}
						},
            child: FeatureDiscovery(
              child: MaterialApp.router(
                // navigatorKey: navigatorKey,
                title: "Life@IITK",
                debugShowCheckedModeBanner: false,
                // onGenerateRoute: Router(),
                darkTheme: CustomTheme(context).darkTheme,
                theme: CustomTheme(context).lightTheme,
                themeMode: themefromString[
                    value.get(0, defaultValue: theme[ThemeMode.system])],
                // builder: ExtendedNavigator.builder(
                //     navigatorKey: navigatorKey,
                //     router: Router(),
                //     builder: (context, extendedNav) =>
                //         SafeArea(child: extendedNav!)),
								routerDelegate: _router.delegate(),
             		routeInformationParser: _router.defaultRouteParser(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
