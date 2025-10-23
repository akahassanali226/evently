import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/reusable_components/custom_elevated_button.dart';
import 'package:evently/core/reusable_components/custom_text_form_field.dart';
import 'package:evently/core/reusable_components/toggle_switch.dart';
import 'package:evently/core/utils/asset_manager.dart';
import 'package:evently/core/utils/route_manager.dart';
import 'package:evently/core/validation/app_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String selectedLangguage = "en";

  List<String> languageValues = ["en", "ar"];

  @override
  Widget build(BuildContext context) {
    selectedLangguage = context.locale.languageCode;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController rePasswordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,

        foregroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "Register".tr(),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
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
                    validator: (name) => AppValidation.nameValidation(name),
                    hintText: "Name".tr(),
                    controller: nameController,
                    icon: Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: SvgPicture.asset(
                        AssetManager.nameIconUrl,

                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
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
                  CustomTextFormField(
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    validator: (rePassword) =>
                        AppValidation.rePasswordValidation(
                          password: passwordController.text,
                          rePassword: rePassword,
                        ),
                    hintText: "Re Password".tr(),
                    controller: rePasswordController,
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

                  CustomElevatedButton(
                    title: "Register".tr(),

                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, RouteManager.feedRoute);
                      }
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account ?".tr(),
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          decorationColor: Theme.of(
                            context,
                          ).colorScheme.secondary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login".tr(),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
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
}
