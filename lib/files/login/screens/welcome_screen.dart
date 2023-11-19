import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uietconnect/homepage/homepage.dart';
import '../theme/theme.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/welcome_button.dart';
import 'signin_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: loginui()
    );
  }

  Widget loginui() {
    return Column(
      children: [
        Flexible(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 40.0,
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                          text: 'UIET-Connect\n',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w600,
                          )),
                      TextSpan(
                          text: '\nPanjab University, Chandigarh',
                          style: TextStyle(
                            fontSize: 18,
                            // height: 0,
                          ))
                    ],
                  ),
                ),
              ),
            )),
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              const Expanded(
                child: WelcomeButton(
                  buttonText: 'Sign in',
                  onTap: SignInScreen(),
                  color: Colors.transparent,
                  textColor: Colors.white,
                ),
              ),
              Expanded(
                child: WelcomeButton(
                  buttonText: 'Sign up',
                  onTap: const SignUpScreen(),
                  color: Colors.white,
                  textColor: lightColorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
