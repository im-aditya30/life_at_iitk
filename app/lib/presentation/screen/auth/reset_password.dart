import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import '../../../app/auth/sign_in_up_bloc/sign_in_form_bloc.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../injection.dart';
import '../../core/widgets/text_input.dart';

class ResetPassword extends StatefulWidget {
	final void Function(bool) onPop;

  const ResetPassword({Key? key, required this.onPop}) : super(key: key);
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final _focusCode = FocusNode();
  @override
  void dispose() {
    _emailController.dispose();
    _focusCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
									widget.onPop.call(false);
									context.router.pop();
								}
                // Navigator.pop(context),
                ),
          ),
          Align(
              child: BlocProvider(
            create: (context) => getIt<SignInFormBloc>(),
            child: BlocConsumer<SignInFormBloc, SignInFormState>(
                listener: (context, state) {
              state.authFailureOrSuccessOption.fold(
                  () {},
                  (either) => either.fold(
                      (AuthFailure failure) => Toast.createError(
                          message: failure.map(
															errorWhileMakingRequest: (_) => 'An error occurred while proceding the request',
                              serverError: (_) => 'A server error occurred',
                              unknownError: (_) => 'An unknown error occurred',
                              userNameAlreadyInUse: (_) =>
                                  'This username is already registered with us',
                              tooManyRequests: (_) =>
                                  'Too many requests have been reported from your side, try agin later',
                              notVerified: (_) =>
                                  'Please verify your account through the link sent to your mail',
                              disabledAccount: (_) =>
                                  'Your account has been disabled, try contacting the admin',
                              noInternet: (_) => 'Seems like you are offline',
                              invalidEmailAndPasswordCombination: (_) =>
                                  'Wrong credentials 🤔'))
                        ..show(context),
                      (_) {
												widget.onPop.call(true);
												context.router.pop();
											}));
            }, builder: (context, state) {
              return Form(
                autovalidate: state.showErrorMessages,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      Center(child: Image.asset("assets/launch.png")),
                      TextInputWidget(
                          hint: 'CC Username',
                          iconData: Icons.mail,
                          focusNode: _focusCode,
                          onChanged: (value) => context
                              .read<SignInFormBloc>()
                              .add(SignInFormEvent.userNameChanged(value)),
                          onFieldSubmit: (_) {
                            _focusCode.unfocus();
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            context.read<SignInFormBloc>().add(
                                const SignInFormEvent.resetPasswordPressed());
                          },
                          keyboardType: TextInputType.emailAddress,
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 30.0, 30.0, 0.0),
                          // validator: (value) =>
                          // 			value.isEmpty
                          //     ? "An Username is required"
                          //     : (value.contains(RegExp( r"^[a-zA-Z]+$")) ? "This doesn't looks like an username" :null),
                          validator: (_) => context
                              .read<SignInFormBloc>()
                              .state
                              .userName
                              .value
                              .fold((l) => l.failedValue, (_) => null),
                          onSaved: (value) => _emailController.text =
                              '${value.trim()}@iitk.ac.in'),
                      BlocBuilder<SignInFormBloc, SignInFormState>(
                        builder: (context, state) {
                          return AbsorbPointer(
                            absorbing: state.isSubmitting,
                            child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: SizedBox(
                                  height: 40.0,
                                  width: double.maxFinite,
                                  child: RaisedButton(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    onPressed: () {
                                      _focusCode.unfocus();
                                      SystemChannels.textInput
                                          .invokeMethod('TextInput.hide');
                                      context.read<SignInFormBloc>().add(
                                          const SignInFormEvent
                                              .resetPasswordPressed());
                                    },
                                    child: context
                                            .watch<SignInFormBloc>()
                                            .state
                                            .isSubmitting
                                        ? const Padding(
                                            padding: EdgeInsets.only(
                                                top: 4.0, bottom: 6.0),
                                            child: SpinKitFadingCircle(
                                              color: Colors.white,
                                              size: 32,
                                            ),
                                          )
                                        : const Text('Reset Password',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white)),
                                  ),
                                )),
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
            }),
          )),
        ],
      )),
    );
  }
}
