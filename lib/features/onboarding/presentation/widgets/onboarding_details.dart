// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/features/onboarding/data/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingDetails extends StatelessWidget {
  OnboardingModel onboardingModel;
  OnboardingDetails({super.key, required this.onboardingModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          onboardingModel.title.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: height * 0.02),
        Text(
          onboardingModel.description,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
