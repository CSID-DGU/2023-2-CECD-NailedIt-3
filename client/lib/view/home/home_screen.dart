import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nailed_it/config/app_routes.dart';
import 'package:nailed_it/view/base/base_screen.dart';
import 'package:nailed_it/view_model/home/home_view_model.dart';
import 'package:nailed_it/widget/appbar/default_appbar.dart';

import 'component/nursery_item.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(72),
      child: DefaultAppBar(
        title: 'Home',
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: viewModel.nurseryBriefStates.length,
      itemBuilder: (BuildContext context, int index) {
        return NurseryItem(
          state: viewModel.nurseryBriefStates[index],
          onTap: () {
            Get.toNamed(
              Routes.NURSERY,
              arguments: {
                'nurseryId': viewModel.nurseryBriefStates[index].id,
              },
            );
          },
        );
      },
    );
  }
}
