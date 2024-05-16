import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:nailed_it/config/color_system.dart';
import 'package:nailed_it/view/base/base_widget.dart';
import 'package:nailed_it/view_model/root/root_view_model.dart';

class CustomBottomNavigationBar extends BaseWidget<RootViewModel> {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(() => Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
          ),
          child: BottomNavigationBar(
            elevation: 1,
            currentIndex: controller.selectedIndex,
            onTap: controller.fetchIndex,

            // 선택에 따라 icon·label 색상 변경
            selectedItemColor: ColorSystem.blue[200]!,
            unselectedItemColor: ColorSystem.grey,

            // 선택에 따라 label text style 변경
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            selectedLabelStyle: const TextStyle(fontSize: 10),

            // 탭 애니메이션 변경 (fixed: 없음)
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,

            // Bar에 보여질 요소. icon과 label로 구성.
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/home.svg',
                    colorFilter: controller.selectedIndex == 0
                        ? ColorFilter.mode(
                            ColorSystem.blue[200]!,
                            BlendMode.srcIn,
                          )
                        : ColorFilter.mode(
                            ColorSystem.grey,
                            BlendMode.srcIn,
                          ),
                    height: 28,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    colorFilter: controller.selectedIndex == 1
                        ? ColorFilter.mode(
                            ColorSystem.blue[200]!,
                            BlendMode.srcIn,
                          )
                        : ColorFilter.mode(
                            ColorSystem.grey,
                            BlendMode.srcIn,
                          ),
                    width: 20,
                    height: 24,
                  ),
                  label: "Profile"),
            ],
          ),
        ));
  }
}
