import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:template68/models/my_model.dart';

part 'my_state.g.dart';

@riverpod
class MyState extends _$MyState {
  @override
  List<MyModel> build() {
    loadData();
    return state;
  }

  void add() {
    if (checkInput()) {
      final data = MyModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          image: nameController.text);
      state = [...state, data];
      saveData();
      Get.back();
    }
  }

  void delete(int index) {
    state = [...state]..removeAt(index);
    saveData();
  }

  void clear() {
    state = [];
    saveData();
  }

  Future<void> saveData() async {
    final box = GetStorage();
    final nameBox = 'listMyModel';
    await box.write(nameBox, state);
  }

  Future<void> loadData() async {
    final box = GetStorage();
    final nameBox = 'listMyModel';
    if (box.hasData(nameBox)) {
      final listMyModel = box.read(nameBox) as List;
      state = listMyModel.map((e) => MyModel.fromJson(e)).toList();
    } else {
      state = [];
    }
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool checkInput() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void clearInput() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
