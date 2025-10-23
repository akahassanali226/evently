// ignore_for_file: must_be_immutable

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ToggleBar extends StatelessWidget {
  String title;
  String selected;
  List<String> selectedValues;
  String icon1;
  String icon2;
  ChangeCallback<String> onChanged;
  bool isColored;
  ToggleBar({
    super.key,
    required this.title,
    required this.selected,
    required this.selectedValues,
    required this.icon1,
    required this.icon2,
    required this.onChanged,
    this.isColored = false,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.tr(),
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
        ),

        SizedBox(
          height: 45,
          child: AnimatedToggleSwitch<String>.rolling(
            spacing: width * 0.03,
            iconOpacity: 1,
            onChanged: onChanged,

            style: ToggleStyle(
              backgroundColor: Colors.transparent,
              borderColor: Theme.of(context).colorScheme.primary,
              indicatorColor: Theme.of(context).colorScheme.primary,
              indicatorBorderRadius: BorderRadius.circular(40),
            ),
            current: selected,
            values: selectedValues,
            iconList: [
              SvgPicture.asset(
                icon1,
                height: 35,
                colorFilter: isColored
                    ? ColorFilter.mode(
                        selected == "Light"
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
              SvgPicture.asset(
                icon2,
                height: 35,
                colorFilter: isColored
                    ? ColorFilter.mode(
                        selected == "Dark"
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Theme.of(context).colorScheme.primary,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
