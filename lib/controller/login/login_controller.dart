import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_app/core/constants/colors.dart';
import 'package:test_app/view/home/home.dart';

class LoginContoller extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var email = '';
  var pass = '';

  @override
  void onInit() {
    emailController;
    passwordController;
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (value.isEmpty) {
      return "Required Field";
    } else if (!regex.hasMatch(value)) {
      return "This is not a valid email";
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Minimum 6 characters";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    Get.offAll(HomePage());
    Get.snackbar(
      "Success",
      "Logged in Successfully",
      backgroundColor: kGrey,
    );
  }
}
