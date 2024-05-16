import 'package:flutter/material.dart';
import 'package:nailed_it/view/base/base_screen.dart';
import 'package:nailed_it/view_model/profile/profile_view_model.dart';
import 'package:nailed_it/widget/appbar/default_appbar.dart';
import 'package:nailed_it/widget/button/custom_icon_button.dart';

class ProfileScreen extends BaseScreen<ProfileViewModel> {
  const ProfileScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(72),
      child: DefaultAppBar(
        title: 'Profile',
        actions: [
          CustomIconButton(
            assetPath: 'assets/icons/setting.svg',
            onPressed: () {
              print('Setting button pressed');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
