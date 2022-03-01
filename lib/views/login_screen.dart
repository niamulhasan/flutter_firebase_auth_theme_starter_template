import 'package:express/config/colors_themes.dart';
import 'package:express/providers/auth_provider.dart';
import 'package:express/views/home/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_form_field_validator/text_form_field_validator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _numberFormKey = GlobalKey<FormState>();
  final _codeFormKey = GlobalKey<FormState>();

  final TextEditingController _phoneNumberTextController =
      TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, auth, Widget? child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              bottom: 0.0,
              child: SvgPicture.asset("assets/decoration/bottom_leaves.svg"),
            ),
            Positioned(
              top: 80.0,
              child: CircleAvatar(
                backgroundColor: MyColors.midYellowBG,
                child: SvgPicture.asset("assets/decoration/avater.svg"),
                radius: 68.0,
              ),
            ),
            Positioned(
              bottom: 150.0,
              child: SvgPicture.asset(
                "assets/decoration/logo.svg",
                width: 180.0,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 38.0,
                      color: MyColors.primaryDeep,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Form(
                      key: _numberFormKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                            child: TextFormField(
                              controller: _phoneNumberTextController,
                              validator: (value) => FormValidator.validate(
                                value,
                                required: true,
                                min: 14,
                                minMessage:
                                    "Number can only contains 14 characters",
                                max: 14,
                                maxMessage:
                                    "Number can only contains 14 characters",
                                regex: RegExp(r"^\+880(\d+)*"),
                                regexMessage:
                                    "Please enter a valid phone number",
                              ),
                              decoration: const InputDecoration(
                                labelText: "Mobile Number with country code",
                                hintText: "+8801818811123",
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_numberFormKey.currentState!.validate()) {
                                auth.verifyNumber(
                                    _phoneNumberTextController.text);
                              }
                            },
                            child: const Text("Verify Number"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // ElevatedButton(
                //   onPressed: () async {
                //     String? number = "000";
                //     number = await _autoFill.hint;
                //     print(number);
                //   },
                //   child: Text(
                //     "Get Current Number",
                //     style: TextStyle(color: MyColors.textBody),
                //   ),
                // )

                Form(
                  key: _codeFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: TextField(
                          controller: _smsController,
                          decoration: InputDecoration(
                            labelText: "Verification Code",
                          ),
                        ),
                      ),
                      ElevatedButton(
                        // onPressed: () {
                        //   _authService.loginWithPhoneNumber(
                        //       smsCode: _smsController.text);
                        // },
                        onPressed: () async {
                          if (_codeFormKey.currentState!.validate()) {
                            bool isLoginSucceed =
                                await auth.login(_smsController.text);
                            if (isLoginSucceed) {
                              auth.setIsLoggedIn(true);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            } else {
                              auth.setIsLoggedIn(false);
                            }
                          }
                        },
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
