// import 'package:auto_route/auto_route.dart';
import 'dart:developer';
import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_at_iitk/app/api/api_bloc.dart';
import 'package:life_at_iitk/presentation/core/colors.dart';
import 'package:life_at_iitk/presentation/core/widgets/flush_toast.dart';
import '../../../app/auth/auth_bloc.dart';
import '../../../app/auth/sign_in_up_bloc/sign_in_form_bloc.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../../injection.dart';
import '../../core/widgets/text_input.dart';
import '../../routes/router.gr.dart';


class SignInUpPage extends StatefulWidget {
  @override
  _SignInUpPageState createState() => _SignInUpPageState();
}

class _SignInUpPageState extends State<SignInUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoginForm = true;
  // bool _isLoading = false;
  bool _obsecureText = true;
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form?.validate()??false) {
      form?.save();
			// log('Form Validated');
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    _emailController.text = "";
    _passwordController.text = "";
    _confirmPasswordController.text = "";
  }

  void resetForm() {
    _formKey.currentState?.reset();
		_confirmPasswordController.text = "";
    unfocusForm();
  }

  void unfocusForm() {
    _emailFocus.unfocus();
    _passwordFocus.unfocus();
    _confirmPasswordFocus.unfocus();
  }

  void toggleFormMode() {
    resetForm();
    _emailController.text = "";
    _passwordController.text = "";
    _confirmPasswordController.text = "";
    setState(() {
      _isLoginForm = !_isLoginForm;
      _obsecureText = true;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: BlocListener<ApiBloc, ApiState>(
					listener: (context, state) {
						// log('$state', name: 'Signin Page');
						if(!context.read<ApiBloc>().state.load.contains(API.fetchAppData)){
							context.read<ApiBloc>().state.apiFailureOrSuccessOption.fold(
								() {
									context.router.replace(const HomeRootRoute());
									context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
									// context.read<StudentCubit>().getUserStudentData();
								}, 
								(either) => either.fold(
									(l) {
										// log(l);
										Toast.createApiError(l).show(context);
										context.read<AuthBloc>().add(const AuthEvent.signedOut());
									}, 
													(_) {
														context.router.replace(const HomeRootRoute());
									context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
													}));
						}
					},
					child: BlocConsumer<SignInFormBloc, SignInFormState>(
										listener: (context, state) {
											// log('$state', name: 'Signin PageBloc');
											state.authFailureOrSuccessOption.fold(
													() {},
													(either) => either.fold(
															(AuthFailure failure) => failure.maybeWhen(
																orElse: () {
																		resetForm();
																		context
																				.read<SignInFormBloc>()
																				.add(const SignInFormEvent.resetForm());
																		return Toast.createError(
																				message: failure.map(
																						errorWhileMakingRequest: (_) => 'An error occurred while proceeding with your request',
																						serverError: (_) => 'A server error occurred',
																						unknownError: (_) =>
																								'An unknown error occurred',
																						userNameAlreadyInUse: (_) =>
																								'This username is already registered with us',
																						tooManyRequests: (_) =>
																								'Too many requests have been reported from your side, try agin later',
																						notVerified: (_) =>
																								'Please verify your account through the link sent to your mail',
																						disabledAccount: (_) =>
																								'Your account has been disabled, try contacting the admin',
																						noInternet: (_) => 'Seems like you are offline 😑',
																						invalidEmailAndPasswordCombination: (_) =>
																								'Wrong credentials 🤔'))
																			
																			..show(context);
																}, 
																notVerified: () {
																		resetForm();
																		context
																				.read<SignInFormBloc>()
																				.add(const SignInFormEvent.resetForm());
																		return Flushbar(
																			message:
																					'Please verify your account through the link sent to your mail box',
																			icon: const Icon(
																				Icons.info_outline,
																				color: Colors.blue,
																			),
																			leftBarIndicatorColor: Colors.blue,
																			mainButton: FlatButton(
																				onPressed: () => context.read<SignInFormBloc>().add(
																						const SignInFormEvent.sendVerificationEmail()),
																				child: const Text("Resend"),
																			),
																			duration: const Duration(seconds: 8),
																		)..show(context);
																}
															),
											(_) { 
													if(state.isAuthenticated){
														!_isLoginForm? Toast.createInformation(
																message: 'Please check your mail to verify your account!!!').show(context)
														: context.read<ApiBloc>().add(const ApiEvent.fetchAppData());
													}
												}
									));
        },
				 builder: (context, state) {
          void onButtonPress() {
            unfocusForm();
						// log('Primary Button Pressed ${_isLoginForm}',name: 'SignUp Page');
            if (_isLoginForm) {
              context.read<SignInFormBloc>().add(
                  const SignInFormEvent.signInWithUserNameAndPasswordPressed());						
              return;
            }
						validateAndSave();
            // if () {
							log("signing Up", name: 'Create Account press');
              context.read<SignInFormBloc>().add(const SignInFormEvent
                  .registerWithUserNameAndPasswordPressed());
            // }
          }

          return Stack(
            fit: StackFit.expand,
            children: [
              Form(
                key: _formKey,
                autovalidateMode: state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                    Image.asset('assets/launch.png', 
											height: 200, width: 200
										),
                    // showEmailInput(context),
                    TextInputWidget(
                        hint: 'CC Username',
                        iconData: Icons.mail,
                        onFieldSubmit: (_) =>
                            FocusScope.of(context).requestFocus(_passwordFocus),
                        // textEditingController: _emailControll
                        focusNode: _emailFocus,
                        onChanged: (value) => context
                            .read<SignInFormBloc>()
                            .add(SignInFormEvent.userNameChanged(value)),
                        keyboardType: TextInputType.emailAddress,
                        padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                        // validator: (value) => value.isEmpty
                        //     ? "Username can't be empty"
                        //     : (value.contains('@') ? 'Invalid Username' : (_) => ''),
                        validator: (_) => context
                            .read<SignInFormBloc>()
                            .state
                            .userName
                            .value
                            .fold(
                                (l) => l.failedValue,
                                // l.maybeMap(
                                //       orElse: () => "Required",
                                //       invalidUserName: (_) =>
                                //           'Invalid UserName',
                                //     ),
                                (_) => null),
                        onSaved: (value) => _emailController.text =
                            '${value.trim()}@iitk.ac.in'),
                    // showPasswordInput(context),
                    TextInputWidget(
                        hint: 'Password',
                        iconData: Icons.lock,
                        keyboardType: TextInputType.visiblePassword,
                        obsecureText: _obsecureText,
                        focusNode: _passwordFocus,
                        onChanged: (value) {
                          context
                              .read<SignInFormBloc>()
                              .add(SignInFormEvent.passwordChanged(value));
                          _passwordController.text = value;
                        },
                        textInputAction: _isLoginForm
                            ? TextInputAction.send
                            : TextInputAction.done,
                        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                        onFieldSubmit: (text) {
                          return _isLoginForm
                              ? onButtonPress()
                              : FocusScope.of(context)
                                  .requestFocus(_confirmPasswordFocus);
                        },
                        // isDense: true,
                        hasSuffix: true,
                        toolTipMsg:
                            _obsecureText ? "Show Password" : "Hide Password",
                        onSuffixTap: () {
                          setState(() {
                            _obsecureText = !_obsecureText;
                          });
                        },
                        // autoValidate: true,
                        helperText: !_isLoginForm
                            ? 'Length of password should be greater than 6'
                            : '',
                        validator: (_) => context
                            .read<SignInFormBloc>()
                            .state
                            .password
                            .value
                            .fold((l) => l.failedValue, (_) => ''),
                        onSaved: (value) => _passwordController.text = value),

                    if (_isLoginForm)
                      const SizedBox()
                    else
                      showConfirmPasswordInput((_) {
                        unfocusForm();
                        onButtonPress();
                      }),
                    // showPrimaryButton(context),
                    AbsorbPointer(
                      absorbing: state.isSubmitting,
                      child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                          child: SizedBox(
                            height: 40.0,
                            child: RaisedButton(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              onPressed: onButtonPress,
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
                                  : Text(
                                      _isLoginForm ? 'Login' : 'Create account',
                                      style: const TextStyle(
                                          fontSize: 20.0, color: Colors.white)),
                            ),
                          )),
                    ),
                    const SizedBox(height: 5.0),
                    AbsorbPointer(
                      absorbing: state.isSubmitting,
                      child: showSecondaryButton(
                        () {
                          // SystemChannels.textInput.invokeMethod('TextInput.hide');
                          toggleFormMode();
                          context
                              .read<SignInFormBloc>()
                              .add(const SignInFormEvent.resetForm());
                        },
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    if (_isLoginForm)
                      AbsorbPointer(
                          absorbing: state.isSubmitting,
                          child: showForgotPassButton())
                    else
                      const SizedBox(),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
							if((state.isSubmitting && BlocProvider.of<AuthBloc>(context).state.maybeMap(
								orElse: () => true,
								authenticated: (_) => false)) || context.watch<ApiBloc>().state.load.contains(API.fetchAppData)) // TODO: Add api implementation 
								Container(
									color: Colors.black.withOpacity(0.6),
									child: Center(child: Column(
										mainAxisAlignment: MainAxisAlignment.center,
										children: <Widget>[
											if(state.isSubmitting && BlocProvider.of<AuthBloc>(context).state.maybeMap(
													orElse: () => true,
													authenticated: (_) => false))
												...[if(_isLoginForm)
													const Text('Signing in',style: TextStyle(color: Colors.white))
												else const Text('Signing up',style: TextStyle(color: Colors.white)),]
											else const Text('Fetching up your data from server!!!',style: TextStyle(color: Colors.white)),
											const SizedBox(height: 10,),
											SpinKitThreeBounce(color: CustomColors(context).accentColor,size: 30)
										],
									)),
								)
						],
          );
        }),
      ),
			)
    );
  }

  Widget showConfirmPasswordInput(void Function(String) onFieldSubmit) {
    return TextInputWidget(
      hint: 'Confirm Password',
      iconData: Icons.lock,
      keyboardType: TextInputType.visiblePassword,
      obsecureText: true,
      textEditingController: _confirmPasswordController,
      focusNode: _confirmPasswordFocus,
      textInputAction:
          _isLoginForm ? TextInputAction.send : TextInputAction.done,
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      onFieldSubmit: onFieldSubmit,
      autoValidate: true,
      validator: (value) {
        // log(_confirmPasswordController.text);
        // log(_passwordController.text);
        return (_passwordController.text.isEmpty)
                ? null
                : (value != _passwordController.text || value.isEmpty)
                    ? 'Passwords does not match'
                    : null;
      },
      onSaved: (value) => _confirmPasswordController.text = value,
    );
  }

  Widget showPrimaryButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: RaisedButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              context.read<SignInFormBloc>().add(
                  const SignInFormEvent.signInWithUserNameAndPasswordPressed());
            },
            // color: Colors.black38,
            // splashColor: Colors.black,
            child: Text(_isLoginForm ? 'Login' : 'Create account',
                style: const TextStyle(fontSize: 20.0, color: Colors.white)),
          ),
        ));
  }

  Widget showSecondaryButton(VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: SizedBox(
        height: 22.0,
        child: FlatButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: onPressed,
          child: Text(
              _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        ),
      ),
    );
  }

  Widget showForgotPassButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 4.0),
      child: SizedBox(
        height: 18.0,
        child: FlatButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: () {
            // _formKey.currentState.reset();
            // SystemChannels.textInput.invokeMethod('TextInput.hide');
            unfocusForm();
            // context.router
            //     .push()
						// context.router.pushNamed("/authenticate/reset-password");
						context.router.push(
							ResetPasswordRoute(
							onPop: (value) {
								if (value == true) {
									late Flushbar<bool> flush;
									flush = Flushbar<bool>(
										mainButton: IconButton(
												icon: const Icon(Icons.close),
												onPressed: () => flush.dismiss()),
										message:
												"An email with the reset password link has been sent to your mailbox",
										leftBarIndicatorColor: Colors.blue,
										icon: const Icon(Icons.info_outline, color: Colors.blue),
									)..show(context);
								}
							}
						));
            // Navigator.of(context).push(new MaterialPageRoute(
            //     settings: RouteSettings(name: 'Reset Password'),
            //     builder: (BuildContext context) =>
            //          ResetPassword(auth: Auth())));
          },
          child: const Text('Forgot Password',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w300)),
        ),
      ),
    );
  }
}
