// Created by Adipt on 17/01/2022

part of '../view.dart';

class RegisterText extends StatelessWidget {
  final Function() onTap;

  const RegisterText({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'New User? ',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: 'Register',
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
