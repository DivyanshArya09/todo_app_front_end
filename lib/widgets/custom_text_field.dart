import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_front_end/core/constants/app_styles.dart';
import 'package:todo_app_front_end/core/constants/color_palatte.dart';
import 'package:todo_app_front_end/core/enums/password_validation_status,dart';
import 'package:todo_app_front_end/core/enums/text_field_type.dart';
import 'package:todo_app_front_end/core/validators/validators.dart';
import 'package:todo_app_front_end/utils/custom_spacers.dart';

class CustomTextField extends StatefulWidget {
  final String? errorText;
  final bool enableBorder;
  final TextEditingController controller;
  final double? height;
  final double? borderRadius;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool? isPasswordField;
  final String? hint;
  final String? label;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final bool disabled;
  final Color? fillColor;
  final EdgeInsets? scrollPadding;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final int? minLines;
  final void Function(String)? onSubmitted;
  final String? title;
  final String? prefixText;
  final IconData? prefixIcon;
  final VoidCallback? onTap;
  final Color? borderColor;
  final TextFieldType? fieldType;

  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    this.focusNode,
    this.prefix,
    this.isPasswordField = false,
    this.suffix,
    this.borderColor,
    this.textInputAction,
    this.maxLength,
    this.keyboardType,
    this.hint,
    this.fieldType = TextFieldType.PRIMARY,
    this.label,
    this.maxLines,
    this.minLines,
    this.height = 52,
    this.borderRadius = 8,
    this.errorText,
    this.onTap,
    this.onChanged,
    this.autoFocus = false,
    this.disabled = false,
    this.fillColor = ColorPalette.white,
    this.textCapitalization = TextCapitalization.none,
    this.scrollPadding,
    this.onSubmitted,
    this.title,
    this.prefixText,
    this.prefixIcon,
    this.enableBorder = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late StreamController<bool> _obscureTextController;
  late StreamController<PasswordValidationStatus> _passwordStrengthController;

  @override
  void initState() {
    _obscureTextController = StreamController<bool>.broadcast();
    _passwordStrengthController =
        StreamController<PasswordValidationStatus>.broadcast();
    super.initState();
  }

  @override
  void dispose() {
    _obscureTextController.close();
    _passwordStrengthController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isPasswordField! && widget.validator != null) {
      throw ArgumentError(
          'isPasswordField can\'t be true if validator is not null because the password strength indicator will not work properly ');
    }
    return widget.isPasswordField! ? _buildPasswordField() : _buildTextField();
  }

  Widget _buildPasswordField() {
    return StreamBuilder<bool>(
      stream: _obscureTextController.stream,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(obscureText: snapshot.data ?? false),
            CustomSpacers.height10,
            _buildPasswordStrengthIndicator(),
          ],
        );
      },
    );
  }

  Widget _buildPasswordStrengthIndicator() {
    return StreamBuilder<PasswordValidationStatus>(
      stream: _passwordStrengthController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && widget.controller.text.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 5.h,
                    width: MediaQuery.of(context).size.width * .35,
                    child: LinearProgressIndicator(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      value: snapshot.data!.score,
                      color: snapshot.data!.color,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    snapshot.data!.value,
                    style: AppTextStyle.bodyMedium_dark.copyWith(
                      color: snapshot.data!.color,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                height: 22.h,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      snapshot.data!.icon,
                      CustomSpacers.width6,
                      Text(
                        snapshot.data!.message,
                        style: AppTextStyle.bodyMedium_dark.copyWith(
                          color:
                              snapshot.data == PasswordValidationStatus.MEDIUM
                                  ? ColorPalette.primary
                                  : snapshot.data!.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildTextField({bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null && widget.title!.isNotEmpty) ...[
          Text(widget.title!, style: AppTextStyle.inSemiBold_14),
          CustomSpacers.height10,
        ],
        TextFormField(
          style: widget.fieldType!.inputStyle,
          controller: widget.controller,
          obscuringCharacter: '*',
          obscureText: obscureText,
          validator: widget.validator,
          focusNode: widget.focusNode,
          buildCounter: (context,
              {required currentLength, required isFocused, maxLength}) {
            return null;
          },
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          maxLines: widget.isPasswordField! ? 1 : widget.maxLines,
          minLines: widget.minLines,
          onChanged: (value) {
            if (widget.isPasswordField!) {
              _passwordStrengthController.sink.add(
                Validators.checkStrength(value),
              );
            }
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          onFieldSubmitted: widget.onSubmitted,
          textCapitalization: widget.textCapitalization,
          scrollPadding: widget.scrollPadding ?? EdgeInsets.zero,
          autofocus: widget.autoFocus,
          enabled: !widget.disabled,
          decoration: InputDecoration(
            prefixIcon:
                widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
            prefixText: widget.prefixText,
            labelText: widget.label,
            hintText: widget.hint,
            errorText: widget.errorText,
            suffixIcon: widget.isPasswordField!
                ? _buildPassWordSuffix(obscureText)
                : widget.suffix,
            errorStyle: const TextStyle(color: ColorPalette.error),
          ),
        ),
      ],
    );
  }

  Widget _buildPassWordSuffix(bool obscureText) {
    return GestureDetector(
      onTap: () {
        _obscureTextController.sink.add(!obscureText);
      },
      child: Icon(
        obscureText ? Icons.remove_red_eye : Icons.visibility_off,
        color: ColorPalette.black,
        size: 20.sp,
      ),
    );
  }
}
