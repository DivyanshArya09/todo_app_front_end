import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_front_end/core/constants/app_styles.dart';
import 'package:todo_app_front_end/core/constants/color_palatte.dart';
import 'package:todo_app_front_end/core/enums/button_type.dart';
import 'package:todo_app_front_end/widgets/bouncing_widget.dart';

class CustomButton extends StatelessWidget {
  final String strButtonText;
  final bool? isDisabled;
  final VoidCallback buttonAction;
  final ButtonType? buttonType;
  final double? btnRadius;
  final double? btnHeight;
  final Color? borderColor;
  final TextStyle? btnStyle;
  final Color? bgColor;
  final Color? textColor;
  final TextStyle? textStyle;
  const CustomButton.primary({
    Key? key,
    required this.strButtonText,
    required this.buttonAction,
    this.btnRadius = 8,
    this.borderColor = ColorPalette.primary,
    this.buttonType = ButtonType.PRIMARY,
    this.bgColor = ColorPalette.primary,
    this.textColor = ColorPalette.white,
    this.btnStyle,
    this.isDisabled = false,
    this.btnHeight = 52,
    this.textStyle,
  }) : super(key: key);
  const CustomButton.secondary({
    Key? key,
    required this.strButtonText,
    required this.buttonAction,
    this.btnRadius = 8,
    this.borderColor = ColorPalette.primary100,
    this.buttonType = ButtonType.SECONDARY,
    this.bgColor = ColorPalette.primary100,
    this.textColor = ColorPalette.primary,
    this.btnStyle,
    this.isDisabled = false,
    this.btnHeight = 52,
    this.textStyle,
  }) : super(key: key);

  Widget _buildButton() {
    return Container(
      alignment: Alignment.center,
      height: btnHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(btnRadius!.r),
        color: isDisabled! ? ColorPalette.primary100 : bgColor!,
        border: Border.all(
          color: isDisabled! ? ColorPalette.primary100 : borderColor!,
          width: 1,
        ),
      ),
      child: Text(
        strButtonText,
        textAlign: TextAlign.center,
        style: textStyle ??
            AppTextStyle.primaryBtnTextStyle.copyWith(color: textColor),
      ),
    );
  }

  // Widget get _getButton =>
  //     buttonType == ButtonType.PRIMARY ? _buildPrimaryButton() : Container();

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      disableBouncing: isDisabled,
      duration: const Duration(milliseconds: 180),
      scaleFactor: 1.5,
      onPressed: () => buttonAction(),
      child: _buildButton(),
    );
  }
}
