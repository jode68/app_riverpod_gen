import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template68/provider/my_state.dart';

class SheetAdd extends ConsumerWidget {
  const SheetAdd({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myState = ref.watch(myStateProvider.notifier);

    return FloatingActionButton(
      onPressed: () {
        myState.clearInput();
        Get.bottomSheet(
          backgroundColor: Colors.white,
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: myState.nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: myState.emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: myState.passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () => Get.back(),
                        child: const Text('Cancel'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        onPressed: () => myState.add(),
                        child: const Text('Submit'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
