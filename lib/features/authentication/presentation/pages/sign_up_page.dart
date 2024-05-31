import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_front_end/core/constants/app_styles.dart';
import 'package:todo_app_front_end/core/constants/color_palatte.dart';
import 'package:todo_app_front_end/core/enums/auth_terms_and_condition_type.dart';
import 'package:todo_app_front_end/core/validators/validators.dart';
import 'package:todo_app_front_end/features/authentication/presentation/widgets/auth_terms_and_condition_widget.dart';
import 'package:todo_app_front_end/utils/custom_spacers.dart';
import 'package:todo_app_front_end/widgets/custom_button.dart';
import 'package:todo_app_front_end/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _emailTC, _passwordTC, _nameTC, _phoneTC;
  late StreamController<bool> _btnStream;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _btnStream = StreamController<bool>.broadcast();
    _emailTC = TextEditingController();
    _passwordTC = TextEditingController();
    _nameTC = TextEditingController();
    _phoneTC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailTC.dispose();
    _passwordTC.dispose();
    _nameTC.dispose();
    _phoneTC.dispose();
    _btnStream.close();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  bool get isValid =>
      _emailTC.text.isNotEmpty &&
      _passwordTC.text.isNotEmpty &&
      _nameTC.text.isNotEmpty &&
      _phoneTC.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.greyscale800,
      body: Stack(
        children: [
          // const SignupLoginBackGroundImage(),
          _buildBackButton(),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24.h),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Welcome to',
                style: AppTextStyle.h1Dark_mr.copyWith(
                  color: ColorPalette.primary,
                ),
              ),
              CustomSpacers.width6,
              // const AppLogo(),
            ],
          ),
          CustomSpacers.height12,
          CustomTextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                _btnStream.add(isValid);
              }
            },
            validator: (value) => Validators.validateName(value ?? ''),
            controller: _nameTC,
            hint: 'Full Name',
            title: 'Full Name',
          ),
          CustomSpacers.height16,
          CustomTextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                _btnStream.add(isValid);
              }
            },
            validator: (value) => Validators.validateEmail(value ?? ''),
            controller: _emailTC,
            hint: 'Enter your Email',
            title: 'Email Address',
          ),
          CustomSpacers.height16,
          CustomTextField(
            maxLength: 10,
            onChanged: (value) {
              if (value.isNotEmpty) {
                _btnStream.add(isValid);
              }
            },
            keyboardType: TextInputType.phone,
            validator: (value) => Validators.validateNumber(value ?? ''),
            controller: _phoneTC,
            hint: 'Enter your Number',
            title: 'Email Number',
          ),
          CustomSpacers.height16,
          CustomTextField(
            onChanged: (value) {
              if (value.isNotEmpty) {
                _btnStream.add(isValid);
              }
            },
            isPasswordField: true,
            controller: _passwordTC,
            hint: 'Enter your Password',
            title: 'Password',
          ),
          CustomSpacers.height24,
          AuthTermsAndConditionWidget(
            onChanged: (value) {},
            type: AuthTermsAndConditionType.signUp,
          ),
          CustomSpacers.height16,
          _buildButton(),
          CustomSpacers.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Have an account?',
                style: AppTextStyle.bodyMedium_dark.copyWith(
                  color: ColorPalette.greyscale700,
                ),
              ),
              CustomSpacers.width4,
              GestureDetector(
                onTap: () {},
                // onTap: () =>
                //     CustomNavigator.pushTo(context, AppPages.loginPage),
                child: Text(
                  'Sign in',
                  style: AppTextStyle.bodyMedium_dark.copyWith(
                      color: ColorPalette.primary, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return StreamBuilder(
      stream: _btnStream.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!) {
          return CustomButton.primary(
            strButtonText: 'Sign in',
            buttonAction: () {
              if (_formKey.currentState!.validate()) {
                // CustomNavigator.pushReplace(
                //     context, AppPages.completeYourProfilePage);
              }
            },
          );
        }
        return CustomButton.primary(
          strButtonText: 'Sign up',
          buttonAction: () {},
          isDisabled: true,
        );
      },
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16.h,
      left: 16.w,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          Text(
            'Create New Account',
            style: AppTextStyle.h3Light_mr,
          ),
        ],
      ),
    );
  }
}
