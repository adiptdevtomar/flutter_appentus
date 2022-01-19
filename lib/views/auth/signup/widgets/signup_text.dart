// Created by Adipt on 17/01/2022

part of '../view.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Sign',
          style: GoogleFonts.montserrat(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Up',
                style: GoogleFonts.montserrat(
                    fontSize: 60.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 1
                ),
              ),
              TextSpan(
                text: '.',
                style: GoogleFonts.montserrat(
                    fontSize: 60.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    height: 1
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}