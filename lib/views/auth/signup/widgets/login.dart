// Created by Adipt on 17/01/2022

part of '../view.dart';

class LoginText extends StatelessWidget {
  final Function() onTap;

  const LoginText({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Try Again? ',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: 'Login',
            style: GoogleFonts.montserrat(
              color: Colors.green,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
