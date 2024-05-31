import 'package:flutter/material.dart';
import 'package:todo_app_front_end/core/constants/app_styles.dart';
import 'package:todo_app_front_end/core/constants/color_palatte.dart';
import 'package:todo_app_front_end/core/enums/auth_terms_and_condition_type.dart';
import 'package:todo_app_front_end/widgets/custom_check_box.dart';

class AuthTermsAndConditionWidget extends StatelessWidget {
  final Function(bool) onChanged;
  final AuthTermsAndConditionType type;

  const AuthTermsAndConditionWidget(
      {super.key, required this.onChanged, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomCheckBox(
          onChanged: (value) {
            onChanged(value ?? false);
          },
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.72,
          child: RichText(
            softWrap: true,
            text: TextSpan(
              children: [
                TextSpan(text: type.text, style: AppTextStyle.bodyRegular_dark),
                TextSpan(
                  text: ' Term and Conditions',
                  style: AppTextStyle.bodyBold_dark.copyWith(
                    wordSpacing: 1.0,
                    color: ColorPalette.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
