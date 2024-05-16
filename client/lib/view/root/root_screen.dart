import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/view/base/base_screen.dart';
import 'package:nailed_it/view/home/home_screen.dart';
import 'package:nailed_it/view/profile/profile_screen.dart';
import 'package:nailed_it/view/root/widget/custom_bottom_navigation_bar.dart';
import 'package:nailed_it/view_model/root/root_view_model.dart';

class RootScreen extends BaseScreen<RootViewModel> {
  const RootScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Obx(
          () => IndexedStack(
        index: viewModel.selectedIndex,
        children: const [
          HomeScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) =>
      const CustomBottomNavigationBar();
}