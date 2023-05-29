import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'tool_what_to_eat_state.dart';

class ToolWhatToEatLogic extends GetxController {
  final ToolWhatToEatState state = ToolWhatToEatState();

  var questionList = ['火锅', '烤肉', '串串'].obs;
  var currentQuestion = ''.obs;
  var isAnimating = false.obs;

  @override
  void onReady() {
    _loadQuestions();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void _loadQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    final questions = prefs.getStringList('questions');
    if (questions != null && questions.isNotEmpty) {
      questionList.clear();
      questionList.addAll(questions);
    }
  }

  void _saveQuestions() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('questions', questionList);
  }

  void addQuestion() async {
    final controller = TextEditingController();
    final result = await Get.dialog(
      AlertDialog(
        title: const Text('添加'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: '请输入随机项'),
          onSubmitted: (value) => Get.back(result: value),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Get.back(result: controller.text),
            child: const Text('确定'),
          ),
        ],
      ),
    );
    if (result != null && result.isNotEmpty) {
      questionList.add(result);
      _saveQuestions();
    }
  }

  void editQuestion(int index) async {
    final selectedQuestion = questionList[index];
    final controller = TextEditingController(text: selectedQuestion);

    final newQuestion = await Get.dialog(
      AlertDialog(
        title: const Text('修改'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: '请输入新的随机项'),
          onSubmitted: (value) => Get.back(result: value),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () => Get.back(result: controller.text),
            child: const Text('确定'),
          ),
        ],
      ),
    );

    if (newQuestion != null && newQuestion.isNotEmpty) {
      questionList[index] = newQuestion;
      _saveQuestions();
    }
  }

  void deleteQuestion(int index) {
    questionList.removeAt(index);
    _saveQuestions();
  }

  void startAnimation() {
    isAnimating.value = true;
    int count = 0;
    int maxCount = 30;
    var rng = Random.secure();
    const animationDuration = Duration(milliseconds: 100);
    Timer.periodic(animationDuration, (timer) {
      currentQuestion.value = questionList[rng.nextInt(questionList.length)];
      if (++count >= maxCount) {
        timer.cancel();
        isAnimating.value = false;
      }
    });
  }
}
