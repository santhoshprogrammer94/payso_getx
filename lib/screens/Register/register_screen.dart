import 'package:flutter/material.dart';
import 'package:payso/components/back_button_widget.dart';
import 'package:payso/components/button_widget.dart';
import 'package:get/get.dart';
import 'package:payso/components/input_textfield_widget.dart';
import 'package:payso/controllers/auth_controller.dart';
import 'package:payso/screens/LanguageSelection/select_language.dart';

import 'components/content_widget.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();
  String phoneNumber = '';
  final _formKey = GlobalKey<FormState>();
  String phoneEmpty = ('phoneEmpty');
  AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.1),
            child: Column(
              children: <Widget>[
                // Container(
                //   alignment: Alignment.topLeft,
                //   width: Get.width,
                //   child:
                //       BackButtonWidget(onTap: () => Get.off(SelectLanguage())),
                // ),
                Container(
                  width: Get.width * 0.7,
                  child: Image.asset('./assets/images/register.png'),
                ),
                ContentWidget(),
                InputTextFieldWidget(
                  controller: phoneController,
                  onFieldSubmitted: (value) {
                    if (_formKey.currentState.validate()) {
                      _authController.registerUser(
                          phoneController.text, context);
                    }
                  },
                  validator: (value) {
                    if (value.isEmpty || value.length != 10) {
                      return 'phoneEmpty'.tr;
                    }
                    return null;
                  },
                  hintText: 'phoneHint'.tr,
                  prefix: Container(
                    width: Get.width / 3.8,
                    child: Row(
                      children: [
                        Image.asset(
                          "./assets/icons/india.png",
                          width: 30.0,
                          height: 30.0,
                        ),
                        // Spacer(),
                        Text(
                          '+(91)',
                        ),
                        // Spacer(),
                      ],
                    ),
                  ),
                ),
                ButtonWidget(
                  buttonText: 'otpButton'.tr,
                  onTapped: () {
                    if (_formKey.currentState.validate()) {
                      _authController.registerUser(
                          phoneController.text, context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
