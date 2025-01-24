import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template68/provider/my_state.dart';
import 'package:template68/widgets/sheet_edit.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myState = ref.watch(myStateProvider);
    final int index = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage'),
        centerTitle: true,
        actions: [
          SheetEdit(index),
        ],
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          width: 300,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(myState[index].name, style: const TextStyle(fontSize: 24)),
                Text(myState[index].email,
                    style: const TextStyle(fontSize: 24)),
                Text(myState[index].password,
                    style: const TextStyle(fontSize: 24)),
                Text(myState[index].image,
                    style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
