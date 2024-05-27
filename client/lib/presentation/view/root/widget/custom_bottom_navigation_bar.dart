import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nailed_it/app/config/color_system.dart';
import 'package:nailed_it/app/config/font_system.dart';
import 'package:nailed_it/core/view/base_widget.dart';
import 'package:nailed_it/presentation/view_model/root/root_view_model.dart';

class CustomBottomNavigationBar extends BaseWidget<RootViewModel> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Container(
          height: 112,
          decoration: BoxDecoration(
            color: ColorSystem.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            border: Border(
              top: BorderSide(
                color: ColorSystem.neutral.shade200,
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: ColorSystem.neutral.shade200,
                blurRadius: 10,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: BottomNavigationBar(
              // State Management
              currentIndex: viewModel.selectedIndex,
              onTap: viewModel.fetchIndex,

              // Design
              backgroundColor: ColorSystem.white,
              type: BottomNavigationBarType.fixed,

              // When not selected
              unselectedItemColor: ColorSystem.neutral.shade200,
              unselectedLabelStyle: FontSystem.Sub3,

              // When selected
              selectedLabelStyle: FontSystem.Sub3,
              selectedItemColor: ColorSystem.neutral.shade500,

              // Items
              items: [
                BottomNavigationBarItem(
                    icon: icon(
                      context: context,
                      iconPath: 'assets/icons/notification.svg',
                      color: viewModel.selectedIndex == 0
                          ? ColorSystem.neutral.shade500
                          : ColorSystem.neutral.shade200,
                      height: 28,
                      bottomPadding: 2,
                    ),
                    label: "알림"),
                BottomNavigationBarItem(
                    icon: icon(
                      context: context,
                      iconPath: 'assets/icons/see_more.svg',
                      color: viewModel.selectedIndex == 1
                          ? ColorSystem.neutral.shade500
                          : ColorSystem.neutral.shade200,
                      height: 20,
                      bottomPadding: 4,
                    ),
                    label: "더보기"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget icon({
    required BuildContext context,
    required String iconPath,
    required Color color,
    required double height,
    double bottomPadding = 0,
  }) =>
      SizedBox(
        height: height + bottomPadding,
        child: Column(
          children: [
            FutureBuilder<String>(
              future: DefaultAssetBundle.of(context).loadString(iconPath),
              builder: (context, snapshot) {
                String data = snapshot.data ??
                    "<svg version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 1 1\"></svg>";

                return SvgPicture.string(
                  data.replaceAll(
                    "#000000",
                    '#${color.value.toRadixString(16).substring(2).padLeft(6, '0').toUpperCase()}',
                  ),
                  height: height,
                );
              },
            ),
            if (bottomPadding != 0) SizedBox(height: bottomPadding),
          ],
        ),
      );
}
