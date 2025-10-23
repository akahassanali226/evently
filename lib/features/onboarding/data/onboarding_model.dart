import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/utils/asset_manager.dart';

class OnboardingModel {
  final String imageUrl;
  final String title;
  final String description;

  OnboardingModel({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  static List<OnboardingModel> getLsit(bool isDark) {
    return [
      OnboardingModel(
        imageUrl: AssetManager.bothOnboarding1Url,
        title: "onboarding1Title".tr(),
        description: "onboarding1Description".tr(),
      ),
      OnboardingModel(
        imageUrl: isDark
            ? AssetManager.darkboarding2Url
            : AssetManager.lightboarding2Url,
        title: "onboarding2Title".tr(),
        description: "onboarding2Description".tr(),
      ),
      OnboardingModel(
        imageUrl: isDark
            ? AssetManager.darkboarding3Url
            : AssetManager.lightboarding3Url,
        title: "onboarding3Title".tr(),
        description: "onboarding3Description".tr(),
      ),
    ];
  }
}
