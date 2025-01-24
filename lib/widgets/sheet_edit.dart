import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template68/provider/my_state.dart';

class SheetEdit extends ConsumerWidget {
  const SheetEdit(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myState = ref.watch(myStateProvider.notifier);

    return IconButton(
      onPressed: () {
        myState.editData(index);
        Get.bottomSheet(
          backgroundColor: Colors.white,
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: myState.nameController,
                  autofocus: true,
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: false,
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
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
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
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
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
                        onPressed: () => myState.edit(index),
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
      icon: const Icon(Icons.edit),
    );
  }
}
