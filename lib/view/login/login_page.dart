import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/login/login_controller.dart';
import 'package:test_app/core/constants/colors.dart';
import 'package:test_app/core/constants/dimensions.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  LoginContoller loginContoller = Get.put(LoginContoller());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  color: kGrey,
                  borderRadius: kRadius20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //<<<<<Title>>>>>//
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kBlack,
                      ),
                    ),
                    kHeight30,

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: loginContoller.loginFormKey,
                        child: Column(
                          children: [
                            //
                            //<<<<<Email>>>>>//
                            TextFormField(
                              focusNode: FocusNode(),
                              style: const TextStyle(color: kBlack),
                              controller: loginContoller.emailController,
                              onSaved: (value) {
                                loginContoller.email = value!;
                              },
                              validator: (value) {
                                return loginContoller.validateEmail(value!);
                              },
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle:
                                    TextStyle(color: kBlack.withOpacity(.5)),
                                border:
                                    OutlineInputBorder(borderRadius: kRadius10),
                                prefixIcon: Icon(CupertinoIcons.mail,
                                    color: kBlack.withOpacity(.5)),
                                filled: true,
                                fillColor: kWhite,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kRed),
                                  borderRadius: kRadius10,
                                ),
                              ),
                            ),
                            kHeight15,
                            //
                            //<<<<<Password>>>>>//
                            TextFormField(
                              focusNode: FocusNode(),
                              style: const TextStyle(color: kBlack),
                              controller: loginContoller.passwordController,
                              onSaved: (value) {
                                loginContoller.pass = value!;
                              },
                              validator: (value) {
                                return loginContoller.validatePassword(value!);
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle:
                                    TextStyle(color: kBlack.withOpacity(.5)),
                                border:
                                    OutlineInputBorder(borderRadius: kRadius10),
                                prefixIcon: Icon(CupertinoIcons.lock,
                                    color: kBlack.withOpacity(.5)),
                                filled: true,
                                fillColor: kWhite,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kRed),
                                  borderRadius: kRadius10,
                                ),
                                suffixIcon: Icon(CupertinoIcons.eye,
                                    color: kBlack.withOpacity(.5)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    kHeight30,
                    Container(),

                    //<<<<<Button>>>>>//
                    ElevatedButton(
                      onPressed: () {
                        print("ontap");
                        loginContoller.checkLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        shape: RoundedRectangleBorder(borderRadius: kRadius30),
                        fixedSize: Size(size.width * .9, 50),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 20,
                          color: kWhite,
                        ),
                      ),
                    ),
                    kHeight40,

                    //<<<<<Forget>>>>>//
                    const Text(
                      "Forget the Password?",
                      style: TextStyle(
                        color: kWhite,
                        fontSize: 16,
                      ),
                    ),
                    kHeight30,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
