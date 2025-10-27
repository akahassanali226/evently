import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/reusable_components/custom_elevated_button.dart';
import 'package:evently/core/reusable_components/custom_text_form_field.dart';
import 'package:evently/core/reusable_components/row_elevated_button.dart';
import 'package:evently/core/reusable_components/toggle_switch.dart';
import 'package:evently/core/utils/asset_manager.dart';
import 'package:evently/core/utils/route_manager.dart';
import 'package:evently/core/validation/app_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String selectedLangguage = "en";

  List<String> languageValues = ["en", "ar"];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    selectedLangguage = context.locale.languageCode;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AssetManager.logoUrl,
                    width: width * 0.4,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: height * 0.05),
                  CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    validator: (email) => AppValidation.emailValidation(email),
                    hintText: "Email".tr(),
                    controller: emailController,
                    icon: Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: SvgPicture.asset(
                        AssetManager.messageIconUrl,

                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    validator: (password) =>
                        AppValidation.passwordValidation(password),
                    hintText: "Password".tr(),
                    controller: passwordController,
                    icon: Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: SvgPicture.asset(
                        AssetManager.lockIconUrl,

                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    isPassword: true,
                  ),
                  SizedBox(height: height * 0.02),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      "Forgot Password?".tr(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  SizedBox(height: height * 0.02),

                  CustomElevatedButton(
                    title: "Login".tr(),

                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        emailLogin();
                      }
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have Account ?".tr(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          decorationColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteManager.registerRoute,
                          );
                        },
                        child: Text(
                          "Create Account".tr(),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.primary,
                          indent: 30,
                          endIndent: 30,
                        ),
                      ),
                      Text(
                        "Or".tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.primary,
                          indent: 30,
                          endIndent: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),

                  RowElevatedButton(
                    title: "Login With Google".tr(),

                    onPressed: () {
                      googleLogin();
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  ToggleSwitch(
                    selected: selectedLangguage,
                    selectedValues: languageValues,
                    icon1: AssetManager.usIconUrl,
                    icon2: AssetManager.egIconUrl,
                    onChanged: (value) {
                      setState(() {
                        selectedLangguage = value;
                        context.setLocale(Locale(selectedLangguage));
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  emailLogin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      log("jijm,");
      Navigator.pushNamed(context, RouteManager.feedRoute);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  googleLogin() async {
    // Google Sign-in

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final credential = await FirebaseAuth.instance.signInWithCredential(
        googleCredential,
      );
      log("jijm,");
      Navigator.pushNamed(context, RouteManager.feedRoute);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
