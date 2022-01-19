// Created by Adipt on 17/01/2022

import 'package:appentus_flutter/app/extensions.dart';
import 'package:appentus_flutter/app/routing/app_router.dart';
import 'package:appentus_flutter/utils/shared_preferences.dart';
import 'package:appentus_flutter/views/map/view.dart';
import 'package:appentus_flutter/views/shared_widgets/primary_button.dart';
import 'package:appentus_flutter/views/shared_widgets/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/user.dart';

part 'controller.dart';

part 'widgets/login_text.dart';

part 'widgets/register.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final state = watch(_stateProvider);
    final controller = watch(_stateProvider.notifier);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: (state.isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const LoginText(),
                      const SizedBox(
                        height: 50.0,
                      ),
                      QTextField(
                        hintText: 'EMAIl',
                        onChanged: controller.onEmailChanged,
                      ),
                      QTextField(
                        hintText: 'PASSWORD',
                        onChanged: controller.onPasswordChanged,
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      PrimaryButton(
                        title: 'Login',
                        onPressed: controller.onLogin,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: RegisterText(
                          onTap: controller.routeToRegisterView,
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
