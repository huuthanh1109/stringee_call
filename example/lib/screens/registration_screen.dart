import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:stringee_flutter_plugin_example/config/Palette.dart';
import 'package:stringee_flutter_plugin_example/screens/screens.dart';
import 'package:stringee_flutter_plugin_example/services/registration_service.dart';
import 'package:stringee_flutter_plugin_example/widgets/widgets.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final registrationService = RegistrationService();
  TextEditingController nameController;
  TextEditingController passController;
  TextEditingController passhashController;
  TextEditingController dateOfBirthController;
  TextEditingController accountController;
  TextEditingController tokenController;
  TextEditingController phoneController;
  bool _isCheckFieldName = false;
  bool _isCheckFieldAccount = false;
  bool _isCheckFieldPass = false;
  bool _isCheckFieldPassHash = false;

  bool _isCheckValue = false;

  // Future<String> uploadImage(filepath, url) async {
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.files.add(
  //     http.MultipartFile('image_path', File(filepath).readAsBytes().asStream(),
  //         File(filepath).lengthSync(),
  //         filename: filepath.split("/").last),
  //   );
  //   var res = await request.send();
  // }

  File _image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      var imageTemporary = File(image.path);
      setState(() => _image = imageTemporary);
    } on PlatformException catch (e) {
      print('error');
    }
  }

  Future<String> uploadImage(url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files
        .add(await http.MultipartFile.fromPath('image_path', _image.path));
    var res = await request.send();
    print('res...........${res.reasonPhrase.toString()}');
    return res.reasonPhrase;
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    accountController = TextEditingController();
    passController = TextEditingController();
    passhashController = TextEditingController();
    dateOfBirthController = TextEditingController();
    tokenController = TextEditingController();
    phoneController = TextEditingController();

    accountController.addListener(() {
      final isCheck = accountController.text.isNotEmpty;
      setState(() {
        _isCheckFieldAccount = isCheck;
      });
    });

    nameController.addListener(() {
      final isCheck = nameController.text.isNotEmpty;
      setState(() {
        _isCheckFieldName = isCheck;
      });
    });

    passController.addListener(() {
      final isCheck = passController.text.isNotEmpty;
      setState(() {
        _isCheckFieldPass = isCheck;
      });
    });

    passhashController.addListener(() {
      final isCheck = passhashController.text.isNotEmpty;
      final isCheckValue = passController.text;
      setState(() {
        if (passhashController.text == isCheckValue) {
          _isCheckValue = false;
          _isCheckFieldPassHash = true;
        } else {
          _isCheckValue = true;
          _isCheckFieldPassHash = false;
        }
      });
    });
  }


  @override
  void dispose() {
    nameController.dispose();
    accountController.dispose();
    passController.dispose();
    passhashController.dispose();
    dateOfBirthController.dispose();
    tokenController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print('image: ${_image.toString()}');
    // print('image1: ${_image.path.toString()}');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.white,
        // backgroundColor: Palette.grey90,
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
                Stack(
                  children: [
                    Container(
                      width: screenWidth,
                      height: screenHeight * 0.25,
                      padding: EdgeInsets.only(right: screenWidth * 0.1),
                      decoration: const BoxDecoration(
                        color: Palette.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "If you don't have an account,",
                            style: TextStyle(
                              color: Palette.grey63,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'Create Account.',
                            style: TextStyle(
                              color: Palette.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: screenWidth * 0.1,
                      left: screenWidth * 0.1,
                      right: screenWidth * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                  color: Palette.black,
                                ),
                                Text(
                                  'Back',
                                  style: TextStyle(
                                    color: Palette.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.ellipsis,
                            size: 30,
                            color: Palette.black,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: screenWidth,
                  height: screenHeight,
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
                        icon: CupertinoIcons.person_crop_circle_fill,
                        title: "Account (*)",
                        controller: accountController,
                        isPassWord: false,
                        isDateTime: false,
                        isPhone: false,
                      ),
                      const SizedBox(height: 16),
                      RoundeInput(
                        size: screenWidth,
                        icon: Icons.lock,
                        title: "Password (*)",
                        isPassWord: true,
                        isDateTime: false,
                        isPhone: false,
                        controller: passController,
                      ),
                      const SizedBox(height: 16),
                      RoundeInput(
                        size: screenWidth,
                        icon: Icons.lock,
                        title: "Enter the password (*)",
                        isPassWord: true,
                        isDateTime: false,
                        isPhone: false,
                        controller: passhashController,
                        isNotSame: _isCheckValue,
                      ),
                      const SizedBox(height: 16),
                      RoundeInput(
                        size: screenWidth,
                        icon: Icons.person,
                        title: "Name (*)",
                        controller: nameController,
                        isPassWord: false,
                        isDateTime: false,
                        isPhone: false,
                      ),
                      const SizedBox(height: 16),
                      RoundeInput(
                        size: screenWidth,
                        icon: Icons.phone_android,
                        title: "Phone Number (*)",
                        isPassWord: false,
                        isDateTime: false,
                        isPhone: true,
                        controller: phoneController,
                      ),

                      const SizedBox(height: 16),

                      RoundeInput(
                        size: screenWidth,
                        icon: CupertinoIcons.calendar,
                        title: "Date of birth",
                        isPassWord: false,
                        isDateTime: true,
                        isPhone: false,
                        controller: dateOfBirthController,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.only(left: screenWidth * 0.1),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => pickImage(ImageSource.gallery),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Palette.textColor.withAlpha(20),
                                ),
                                child: Center(
                                  child: _image == null
                                      ? Image.asset(
                                          'assets/images/add-image-gray.png',
                                          width: 45,
                                          height: 45,
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.file(
                                            _image,
                                            fit: BoxFit.cover,
                                            width: 60,
                                            height: 60,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            const Gap(12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Chọn ảnh đại diên',
                                  style: TextStyle(
                                    color: Palette.textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Gap(4),
                                Text(
                                  'Lựa chọn ảnh đại diện cho riêng bạn.',
                                  style: TextStyle(
                                    color: Palette.grey63,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // const SizedBox(height: 16),
                      // RoundeInput(
                      //   size: screenWidth,
                      //   icon: Icons.vpn_key_sharp,
                      //   title: "Token",
                      //   isPassWord: false,
                      //   isDateTime: false,
                      //isPhone: false,
                      //   controller: tokenController,
                      // ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.1),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Note: (*) is value can\'t be empty',
                            style: TextStyle(
                              color: Palette.grey46,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      (_isCheckFieldName &&
                              _isCheckFieldPass &&
                              _isCheckFieldPassHash &&
                              _isCheckFieldAccount)
                          ? RoundedButton(
                              size: screenWidth,
                              color: Palette.darkRed46,
                              title: "Registration",
                              onTap: () {
                                registrationService
                                    .fetchRegister1(
                                  name: nameController.text,
                                  phone_number: phoneController.text,
                                  date_of_birth: dateOfBirthController.text,
                                  // image_path: '',
                                  image_path: _image.path,
                                  account: accountController.text,
                                  password: passController.text,
                                  token_call: tokenController.text,
                                )
                                    .then(
                                  (isSuccess) {
                                    // showCupertinoDialog(
                                    //   context: context,
                                    //   builder: (BuildContext ctx) {
                                    //     return CupertinoAlertDialog(
                                    //       title:
                                    //           const Text('Đăng ký thành công'),
                                    //       // content: const Text(
                                    //       //     "Có vẻ tên tài khoản không thuộc tài khoản nào không. Vui lòng kiểm tra tên tài khoản và thử lại"),
                                    //       actions: [
                                    //         CupertinoDialogAction(
                                    //           onPressed: () {
                                    //             setState(
                                    //               () {
                                    //                 Navigator.of(context).pop;
                                    //               },
                                    //             );
                                    //           },
                                    //           child: Text('Hủy'),
                                    //           isDefaultAction: false,
                                    //           isDestructiveAction: false,
                                    //         ),
                                    //       ],
                                    //     );
                                    //   },
                                    // );
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: ((context) => LoginScreen(
                                                  accountValue:
                                                      accountController.text,
                                                ))));
                                  },
                                );
                              })
                          : RoundedButton(
                              size: screenWidth,
                              color: Palette.grey63,
                              title: "Registration",
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
