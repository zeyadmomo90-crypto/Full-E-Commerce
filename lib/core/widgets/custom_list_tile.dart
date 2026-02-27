import 'package:flutter/material.dart';

class CustomTextTile extends StatelessWidget {
  const CustomTextTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
  });
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      trailing: Icon(trailingIcon),
    );
  }
}
