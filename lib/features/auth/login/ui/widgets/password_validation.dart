import 'package:flutter/material.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/features/auth/login/ui/widgets/build_validation_row.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.lowerCase,
    required this.upperCase,
    // required this.specialChar,
    required this.number,
    required this.minLength,
  });
  final bool lowerCase;
  final bool upperCase;
  // final bool specialChar;
  final bool number;
  final bool minLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildValidationRow(
          text: 'At least 1 lowercase letter',
          finishVLD: lowerCase,
        ),
        verticalSpace(10),
        BuildValidationRow(
          text: 'At least 1 uppercase letter',
          finishVLD: upperCase,
        ),
        verticalSpace(10),
        // BuildValidationRow(
        //   text: 'At least 1 special character',
        //   finishVLD: specialChar,
        // ),
        verticalSpace(10),
        BuildValidationRow(text: 'At least 1 number', finishVLD: number),
        verticalSpace(10),
        BuildValidationRow(
          text: 'At least 8 characters long',
          finishVLD: minLength,
        ),
      ],
    );
  }
}
