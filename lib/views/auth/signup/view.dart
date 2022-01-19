// Created by Adipt on 17/01/2022

import 'dart:typed_data';

import 'package:appentus_flutter/app/extensions.dart';
import 'package:appentus_flutter/data/user.dart';
import 'package:appentus_flutter/views/shared_widgets/primary_button.dart';
import 'package:appentus_flutter/views/shared_widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

part 'controller.dart';

part 'widgets/signup_text.dart';

part 'widgets/login.dart';

part 'widgets/image_pick.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final state = watch(_stateProvider);
    final controller = watch(_stateProvider.notifier);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                const SignUpText(),
                const SizedBox(
                  height: 20.0,
                ),
                ImagePick(
                  image: state.image,
                  onPressed: controller.onSelectingImage,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                QTextField(
                  hintText: 'EMAIl',
                  onChanged: controller.onEmailChanged,
                  keyBoardType: TextInputType.emailAddress,
                ),
                QTextField(
                  hintText: 'NAME',
                  onChanged: controller.onNameChanged,
                ),
                QTextField(
                  hintText: 'PHONE',
                  onChanged: controller.onPhoneChanged,
                  keyBoardType: TextInputType.number,
                ),
                QTextField(
                  hintText: 'PASSWORD',
                  onChanged: controller.onPasswordChanged,
                  isPasswordVisible: state.isPasswordVisible,
                  onVisibilityChanged: controller.onVisibilityChanged,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                PrimaryButton(
                  title: 'SignUp',
                  onPressed: controller.onSubmit,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: LoginText(
                    onTap: controller.routeToLoginView,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
