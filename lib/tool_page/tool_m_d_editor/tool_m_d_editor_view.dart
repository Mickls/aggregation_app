import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tool_m_d_editor_logic.dart';
import 'tool_m_d_editor_state.dart';

class ToolMDEditorPage extends StatelessWidget {
  const ToolMDEditorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ToolMDEditorLogic logic = Get.put(ToolMDEditorLogic());
    final ToolMDEditorState state = Get.find<ToolMDEditorLogic>().state;

    return Container();
  }
}
