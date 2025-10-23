import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/source/local/prefs_manager.dart';
import 'package:evently/core/utils/asset_manager.dart';
import 'package:evently/core/utils/route_manager.dart';
import 'package:evently/core/reusable_components/custom_elevated_button.dart';
import 'package:evently/core/reusable_components/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedLangguage = "en";
  List<String> languageValues = ["en", "ar"];
  String selectedTheme = "Light";
  List<String> themeValues = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    selectedLangguage = context.locale.languageCode;
    provider.mode == ThemeMode.dark ? selectedTheme = "Dark" : "Light";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AssetManager.headerUrl,
          width: width * 0.4,
          fit: BoxFit.fitWidth,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              Image.asset(AssetManager.lightHomeUrl),
              SizedBox(height: height * 0.04),
              Text(
                "Personalize Your Experience".tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: height * 0.02),

              Text(
                "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style."
                    .tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Language".tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Theme".tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ToggleSwitch(
                    selected: selectedTheme,
                    selectedValues: themeValues,
                    icon1: AssetManager.sunIconUrl,
                    icon2: AssetManager.moonIconUrl,
                    isColored: true,
                    onChanged: (value) {
                      setState(() {
                        selectedTheme = value;
                      });
                      if (selectedTheme == "Light") {
                        provider.changeTheme(ThemeMode.light);
                        PrefsManager.setTheme(ThemeMode.light);
                      } else {
                        provider.changeTheme(ThemeMode.dark);
                        PrefsManager.setTheme(ThemeMode.dark);
                      }
                    },
                  ),
                ],
              ),

              Spacer(),
              CustomElevatedButton(
                title: "Let's Start",

                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteManager.loginRoute,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
