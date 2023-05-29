import 'package:aggregation_app/home_page/home_page_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_tool_logic.dart';
import 'main_tool_state.dart';

class MainToolPage extends StatelessWidget {
  const MainToolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainToolLogic logic = Get.put(MainToolLogic());
    final MainToolState state = Get
        .find<MainToolLogic>()
        .state;

    final HomePageLogic homePageLogic = Get.find<HomePageLogic>();

    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '工具',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(100, 14, 14, 14)),
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      homePageLogic.changeIndex("what_to_eat");
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color.fromARGB(100, 15, 125, 204)
                        )
                    ),
                    child: const Text('今天吃什么'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      homePageLogic.changeIndex("md_editor");
                    },
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: Color.fromARGB(100, 15, 204, 97)
                        )
                    ),
                    child: const Text('md编辑器'),
                  ),
                ],
              )
            ],
          ),
        )
        // Divider(),
      ],
    );
  }
}
