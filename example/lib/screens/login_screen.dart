import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stringee_flutter_plugin_example/blocs/loading_data_bloc.dart';
import 'package:stringee_flutter_plugin_example/config/Palette.dart';
import 'package:stringee_flutter_plugin_example/models/user.dart';
import 'package:stringee_flutter_plugin_example/screens/screens.dart';
import 'package:stringee_flutter_plugin_example/services/login_servide.dart';
import 'package:stringee_flutter_plugin_example/services/shared_preferences.dart';
import 'package:stringee_flutter_plugin_example/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  final String accountValue;
  const LoginScreen({Key key, this.accountValue}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginService = LoginService();
  bool isLogin;
  TextEditingController accountController;
  TextEditingController passController;
  bool _isCheckFieldAccount = false;
  bool _isCheckFieldPass = false;

  @override
  void initState() {
    super.initState();
    accountController = TextEditingController(text: widget.accountValue);
    passController = TextEditingController();
    accountController.addListener(() {
      final isCheck = accountController.text.isNotEmpty;
      setState(() {
        _isCheckFieldAccount = isCheck;
      });
    });
    passController.addListener(() {
      final isCheck = passController.text.isNotEmpty;
      setState(() {
        _isCheckFieldPass = isCheck;
      });
    });
    // _getEvent();
  }

  // void checkPreviousSessionAndRedirect() async {
  //   String loginToken = await LocalDb.getAttribute('loginToken');
  //   if (loginToken != null) {
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, RouteViews.MAIN, (Route<dynamic> route) => false);
  //   }
  // }

  @override
  void dispose() {
    accountController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // final UserBloc userBloc = context.read<UserBloc>();
    return SafeArea(
        child: BlocProvider(
      create: (BuildContext context) => UserBloc(),
      child: BlocBuilder<UserBloc, List<User>>(
        builder: (context, state) => Scaffold(
          backgroundColor: Palette.white,
          body: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.unfocus();
                }
              },
              child: Column(
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.35,
                    padding: EdgeInsets.only(left: screenWidth * 0.1),
                    decoration: const BoxDecoration(
                      color: Palette.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hey,',
                          style: TextStyle(
                            color: Palette.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const Text(
                          'Login Now.',
                          style: TextStyle(
                            color: Palette.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Text(
                              'If you are new /',
                              style: TextStyle(
                                color: Palette.grey63,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          RegistrationScreen()))),
                              child: Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Resgister Now',
                                  style: TextStyle(
                                    color: Palette.black.withOpacity(0.6),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.65,
                    decoration: const BoxDecoration(
                      color: Palette.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        RoundeInput(
                          size: screenWidth,
                          icon: Icons.person,
                          title: "Account",
                          controller: accountController,
                          isPassWord: false,
                          isDateTime: false,
                          isPhone: false,
                        ),
                        const SizedBox(height: 16),
                        RoundeInput(
                          size: screenWidth,
                          icon: Icons.lock,
                          title: "Password",
                          isPassWord: true,
                          isDateTime: false,
                          isPhone: false,
                          controller: passController,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(screenWidth * 0.1, 16, 0, 28),
                          child: Row(
                            children: [
                              const Text(
                                'Forgot Passcode? /',
                                style: TextStyle(
                                  color: Palette.grey63,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => print('quen mat khau'),
                                child: Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(
                                      color: Palette.black.withOpacity(0.6),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        (_isCheckFieldAccount && _isCheckFieldPass)
                            ? RoundedButton(
                                size: screenWidth,
                                color: Palette.darkRed46,
                                title: "Login",
                                onTap: () => loginService
                                    .fetchLogin(
                                        account: accountController.text,
                                        pass: passController.text)
                                    .then(
                                  (isSuccess) {
                                    if (isSuccess["statusCode"] == 200) {
                                      DataSharedPreferences.setToken(
                                          '${json.decode(isSuccess["body"])["user"]["token"]}');

                                      context
                                          .read<UserBloc>()
                                          .add(UserEvent.userData);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: ((context) => CallScreen(
                                                    state: state,
                                                    onTap: () {},
                                                    user: json.decode(
                                                            isSuccess["body"])[
                                                        "user"],
                                                  )
                                              // BlocProvider(
                                              //       create: (BuildContext context) =>
                                              //           UserBloc(),
                                              //       child:
                                              //           BlocBuilder<UserBloc, List<User>>(
                                              //         builder: (context, state) =>

                                              //             CallScreen(
                                              //               state: state,
                                              //           onTap: () {},
                                              //           user: json.decode(
                                              //                   isSuccess["body"])[
                                              //               "user"],
                                              //         ),
                                              //       ),
                                              //     )
                                              ),
                                        ),
                                      );
                                      // CallContainerScreen())));
                                    } else if (isSuccess["statusCode"] == 500) {
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (BuildContext ctx) {
                                          return CupertinoAlertDialog(
                                            title: Text(
                                              '${json.decode(isSuccess["body"])["message"]}',
                                            ),
                                            content: Text(
                                                '${json.decode(isSuccess["body"])["sub_message"]}'),
                                            actions: [
                                              CupertinoDialogAction(
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  );
                                                },
                                                child: Text('Hủy'),
                                                isDefaultAction: false,
                                                isDestructiveAction: false,
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else if (isSuccess["statusCode"] == 401) {
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (BuildContext ctx) {
                                          return CupertinoAlertDialog(
                                            title: Text(
                                              '${json.decode(isSuccess["body"])["message"]}',
                                            ),
                                            content: Text(
                                                '${json.decode(isSuccess["body"])["sub_message"]}'),
                                            actions: [
                                              // The "Yes" button
                                              CupertinoDialogAction(
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  );
                                                },
                                                child: Text('Lúc khác'),
                                                isDefaultAction: false,
                                                isDestructiveAction: false,
                                              ),
                                              CupertinoDialogAction(
                                                onPressed: () {
                                                  setState(
                                                    () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  );
                                                },
                                                child: Text('Đăt lại'),
                                                isDefaultAction: true,
                                                isDestructiveAction: false,
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                ),
                              )
                            : RoundedButton(
                                size: screenWidth,
                                color: Palette.grey63,
                                title: "Login",
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
