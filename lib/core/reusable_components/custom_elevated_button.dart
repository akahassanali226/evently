// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  String title;
  Function() onPressed;
  CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: height * 0.06,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        child: Text(
          title.tr(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).scaffoldBackgroundColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
