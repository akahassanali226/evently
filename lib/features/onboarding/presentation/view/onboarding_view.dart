import 'package:evently/core/providers/theme_provider.dart';
import 'package:evently/core/reusable_components/custom_elevated_button.dart';
import 'package:evently/features/onboarding/data/onboarding_model.dart';
import 'package:evently/features/onboarding/presentation/widgets/navigation_bottom.dart';
import 'package:evently/features/onboarding/presentation/widgets/onboarding_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController(initialPage: 0);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    double width = MediaQuery.of(context).size.width;
    List<OnboardingModel> onboardingModelList = OnboardingModel.getLsit(
      provider.mode == ThemeMode.dark ? true : false,
    );
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),

              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      pageIndex = value;
                    });
                    pageIndex = value;
                  },
                  itemCount: onboardingModelList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(onboardingModelList[index].imageUrl);
                  },
                ),
              ),
              SizedBox(height: height * 0.05),
              OnboardingDetails(
                onboardingModel: onboardingModelList[pageIndex],
              ),

              SizedBox(height: height * 0.05),
              NavigationBottom(
                pageIndex: pageIndex,
                onboardingModel: onboardingModelList[pageIndex],
                controller: controller,
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
