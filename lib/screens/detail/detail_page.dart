import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template68/provider/my_state.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myState = ref.watch(myStateProvider);
    final myStateNotifier = ref.watch(myStateProvider.notifier);
    final index = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.orange),
            onPressed: () {
              myStateNotifier.delete(index);
              Get.back();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          (index == null) ? '' : myState[index].name,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
