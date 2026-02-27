import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ppp/core/helpers/spacing.dart';
import 'package:ppp/core/widgets/custom_list_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen')),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundImage: const AssetImage(
                        'assets/images/shopping-apps.jpg',
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Zeyad Mohamed',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          verticalSpace(5),
                          Text(
                            'Zeyadmomo90@gmail.com',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(100),
                TextButton(
                  onPressed: () {},
                  child: const CustomTextTile(
                    title: 'Edit Profile',
                    leadingIcon: Icons.edit,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const CustomTextTile(
                    title: 'Shopping Address',
                    leadingIcon: Icons.store,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const CustomTextTile(
                    title: 'Oreder History',
                    leadingIcon: Icons.history,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const CustomTextTile(
                    title: 'Cards',
                    leadingIcon: Icons.credit_card,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const CustomTextTile(
                    title: 'Notifications',
                    leadingIcon: Icons.notifications,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const CustomTextTile(
                    title: 'Logout',
                    leadingIcon: Icons.logout,
                    trailingIcon: Icons.arrow_forward_ios,
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
