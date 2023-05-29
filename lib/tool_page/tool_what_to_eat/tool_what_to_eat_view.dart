import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tool_what_to_eat_logic.dart';
import 'tool_what_to_eat_state.dart';

class ToolWhatToEatPage extends StatelessWidget {
  const ToolWhatToEatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ToolWhatToEatLogic logic = Get.put(ToolWhatToEatLogic());
    final ToolWhatToEatState state = Get
        .find<ToolWhatToEatLogic>()
        .state;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
              '今天吃什么',
              style: TextStyle(color: Color.fromARGB(255, 121, 121, 121)),
            )),
        backgroundColor: const Color.fromARGB(255, 247, 247, 247),
        elevation: 0.1,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: logic.questionList.length,
                itemBuilder: (context, index) =>
                    Dismissible(
                      key: Key(logic.questionList[index]),
                      background: Container(
                        color: Colors.red,
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                        ),
                      ),
                      onDismissed: (direction) => logic.deleteQuestion(index),
                      child: ListTile(
                        title: Text(logic.questionList[index]),
                        onTap: () => logic.editQuestion(index),
                      ),
                    ),
              );
            }),
          ),
          Obx(() {
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Text(logic.currentQuestion.value),
                  ElevatedButton(
                    onPressed: (logic.isAnimating.value ||
                        logic.questionList.isEmpty)
                        ? null
                        : logic.startAnimation,
                    child: const Text('开始随机'),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: logic.addQuestion,
        child: const Icon(Icons.add),
      ),
    );
  }
}
