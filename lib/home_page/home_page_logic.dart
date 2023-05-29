import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_tool/main_tool_view.dart';
import '../tool_page/tool_m_d_editor/tool_m_d_editor_view.dart';
import '../tool_page/tool_what_to_eat/tool_what_to_eat_view.dart';
import 'home_page_state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();

  var currentIndex = 0.obs;
  var selectIndex = 0.obs;
  var selectKey = 'home'.obs;

  var pages = {
    "home": const MainToolPage(),
    "my": const PlaceholderWidget(Colors.white),
    "what_to_eat": const ToolWhatToEatPage(),
    "md_editor": const ToolMDEditorPage(),
  };

  void changeIndex(pageName) {
    selectIndex.value = pages.keys.toList().indexOf(pageName);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  const PlaceholderWidget(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}