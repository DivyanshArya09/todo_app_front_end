import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_front_end/core/constants/app_styles.dart';
import 'package:todo_app_front_end/core/constants/color_palatte.dart';
import 'package:todo_app_front_end/core/enums/auth_terms_and_condition_type.dart';
import 'package:todo_app_front_end/core/validators/validators.dart';
import 'package:todo_app_front_end/features/authentication/presentation/widgets/auth_terms_and_condition_widget.dart';
import 'package:todo_app_front_end/routes/app_routes.dart';
import 'package:todo_app_front_end/routes/customNavigator.dart';
import 'package:todo_app_front_end/utils/custom_spacers.dart';
import 'package:todo_app_front_end/widgets/custom_button.dart';
import 'package:todo_app_front_end/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late StreamController<bool> _btnStream;
  late TextEditingController _emailTC, _passwordTC;
  bool isAgreedWithTerms = false;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _btnStream = StreamController<bool>.broadcast();
    _emailTC = TextEditingController();
    _passwordTC = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _btnStream.close();
    _emailTC.dispose();
    _passwordTC.dispose();
    super.dispose();
  }

  bool get isValid =>
      _emailTC.text.isNotEmpty &&
      _passwordTC.text.isNotEmpty &&
      isAgreedWithTerms;

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
          CustomSpacers.width14,
          Text(
            'Hi, Welcome! 👋',
            style: AppTextStyle.h1Dark_mr,
          ),
          CustomSpacers.height6,
          Text(
            'Hello there, sign in to continue',
            style: AppTextStyle.bodyMedium_dark,
          ),
          CustomSpacers.height30,
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
          CustomSpacers.height6,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              textAlign: TextAlign.end,
              'Forgot Password',
              style: AppTextStyle.h5Dark_in,
            ),
          ),
          CustomSpacers.height24,
          AuthTermsAndConditionWidget(
            onChanged: (value) {
              isAgreedWithTerms = value;
              _btnStream.add(isValid);
            },
            type: AuthTermsAndConditionType.login,
          ),
          CustomSpacers.height16,
          _buildButton(),
          CustomSpacers.height16,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: AppTextStyle.bodyMedium_dark.copyWith(
                  color: ColorPalette.greyscale700,
                ),
              ),
              CustomSpacers.width4,
              GestureDetector(
                onTap: () => CustomNavigator.pushTo(context, AppPages.signUp),
                child: Text(
                  'Create new',
                  style: AppTextStyle.bodyMedium_dark.copyWith(
                      color: ColorPalette.primary, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          CustomSpacers.height16,
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: MediaQuery.of(context).padding.top,
      left: 16.w,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          CustomSpacers.width14,
          Text(
            'Sign in',
            style: AppTextStyle.h3Light_mr,
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
                // CustomNavigator.pushTo(context, AppPages.dashboard);
              }
            },
          );
        }
        return CustomButton.primary(
          strButtonText: 'Sign in',
          buttonAction: () {},
          isDisabled: true,
        );
      },
    );
  }
}
