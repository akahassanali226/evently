// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/utils/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RowElevatedButton extends StatelessWidget {
  String title;
  Function() onPressed;
  RowElevatedButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: double.infinity,
      height: height * 0.06,
      child: ElevatedButton(
        onPressed: onPressed,

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetManager.googleIconUrl),
            SizedBox(width: 10),
            Text(
              title.tr(),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
