import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_tool/main_tool_view.dart';
import 'home_page_logic.dart';
import 'home_page_state.dart';

class HomePagePage extends StatelessWidget {
  HomePagePage({Key? key}) : super(key: key);

  final HomePageLogic logic = Get.put(HomePageLogic());

  @override
  Widget build(BuildContext context) {
    final HomePageState state = Get
        .find<HomePageLogic>()
        .state;

    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: logic.selectIndex.value,
          children: logic.pages.values.toList(),
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: logic.currentIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '主页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的',
            )
          ],
        );
      }),
    );
  }

  void onTabTapped(int index) {
    switch (index) {
      case 0:
        logic.selectIndex.value = logic.pages.keys.toList().indexOf("home");
        break;
      case 1:
        logic.selectIndex.value = logic.pages.keys.toList().indexOf("my");
        break;
      default:
        logic.selectIndex.value = 0;
    }
    logic.currentIndex.value = index;
  }
}