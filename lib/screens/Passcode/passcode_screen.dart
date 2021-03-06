import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payso/Screens/ConfirmPasscode/confirm_passcode_screen.dart';
import 'package:payso/components/button_widget.dart';
import 'package:payso/components/passcode_content_widget.dart';
import 'package:payso/components/pincode_widget.dart';
import 'package:payso/controllers/passcode_controller.dart';
import '../../components/passcode_digit_widget.dart';

class PasscodeScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  PasscodeController passcodeController = Get.put(PasscodeController());
  int passcode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: Get.height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ImageWidget(),
                    PasscodeContentWidget(
                      titleText: "setPasscodeTitle".tr,
                      contentText: "setPasscodeBody".tr,
                    ),
                    PasscodeDigitWidget(),
                    PincodeWidget(
                      boxCount: 4,
                      validator: (value) {
                        if (value.isEmpty || value.length != 4) {
                          return "incorrectSetPasscode".tr;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        passcode = int.parse(value);
                        passcodeController.setPasscode(int.parse(value));
                      },
                      onSubmitted: (val) {
                        if (_formKey.currentState.validate()) {
                          passcode = int.parse(val);
                          passcodeController.setPasscode(int.parse(val));
                        }
                      },
                    ),
                  ],
                ),
                ButtonWidget(
                  buttonText: 'setPasscodeButton'.tr,
                  onTapped: () {
                    if (_formKey.currentState.validate()) {
                      Get.offAll(ConfirmPasscodeScreen());
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

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/passcode.png',
      ),
    );
  }
}
