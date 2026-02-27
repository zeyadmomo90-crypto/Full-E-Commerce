import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: ' By logging , you agree to our ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),

          TextSpan(
            text: 'Terms & Conditions ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextSpan(text: 'and ', style: Theme.of(context).textTheme.bodyLarge),
          TextSpan(
            text: 'Privacy Policy ',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
