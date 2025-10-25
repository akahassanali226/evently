// ignore_for_file: must_be_immutable

import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/source/local/prefs_manager.dart';
import 'package:evently/core/utils/route_manager.dart';
import 'package:evently/features/onboarding/data/onboarding_model.dart';
import 'package:evently/features/onboarding/presentation/widgets/navigation_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationBottom extends StatefulWidget {
  int pageIndex;
  OnboardingModel onboardingModel;
  PageController controller;
  NavigationBottom({
    super.key,
    required this.pageIndex,
    required this.onboardingModel,
    required this.controller,
  });

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    double width = MediaQuery.of(context).size.width;
    List<OnboardingModel> onboardingModelList = OnboardingModel.getLsit(
      provider.mode == ThemeMode.dark ? true : false,
    );

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          widget.pageIndex == 0
              ? SizedBox(width: width * 0.18)
              : NavigationButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    if (widget.pageIndex > 0 &&
                        widget.pageIndex <= onboardingModelList.length) {
                      setState(() {
                        widget.controller.previousPage(
                          duration: Duration(milliseconds: 1),
                          curve: Curves.linear,
                        );
                      });
                    }
                  },
                ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onboardingModelList.length, (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      widget.controller.jumpToPage(index);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: width * 0.03),
                    height: 8,
                    width: widget.pageIndex == index ? 24 : 8,

                    decoration: BoxDecoration(
                      color: widget.pageIndex == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                );
              }),
            ),
          ),

          widget.pageIndex == onboardingModelList.length - 1
              ? NavigationButton(
                  icon: Icon(Icons.done),

                  onPressed: () async {
                    await PrefsManager.setOnboardingView();
                    Navigator.pushReplacementNamed(
                      context,
                      RouteManager.loginRoute,
                    );
                  },
                )
              : NavigationButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (widget.pageIndex < onboardingModelList.length &&
                        widget.pageIndex >= 0) {
                      setState(() {
                        widget.controller.nextPage(
                          duration: Duration(milliseconds: 1),
                          curve: Curves.linear,
                        );
                      });
                    }
                  },
                ),
        ],
      ),
    );
  }
}
