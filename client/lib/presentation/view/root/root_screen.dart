import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/core/view/base_screen.dart';
import 'package:nailed_it/presentation/view/notification/notification_screen.dart';
import 'package:nailed_it/presentation/view/root/widget/custom_bottom_navigation_bar.dart';
import 'package:nailed_it/presentation/view/see_more/see_more_screen.dart';
import 'package:nailed_it/presentation/view_model/root/root_view_model.dart';

class RootScreen extends BaseScreen<RootViewModel> {
  const RootScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: viewModel.selectedIndex,
        children: const [
          NotificationScreen(),
          SeeMoreScreen(),
        ],
      ),
    );
  }

  @override
  Widget? buildBottomNavigationBar(BuildContext context) =>
      const CustomBottomNavigationBar();
}
