import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template68/provider/my_state.dart';
import 'package:template68/routes/routes.dart';
import 'package:template68/widgets/sheet_add.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myState = ref.watch(myStateProvider);
    final myStateNotifier = ref.watch(myStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever, color: Colors.red),
            onPressed: () => myStateNotifier.clear(),
          ),
        ],
      ),
      floatingActionButton: SheetAdd(),
      body: ListView.builder(
        itemCount: myState.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListTile(
              title: Text(myState[index].name),
              subtitle: Text(myState[index].email),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  myState[index].name[0],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  myStateNotifier.delete(index);
                },
              ),
              onTap: () {
                Get.toNamed(Routes.detailPage, arguments: index);
              },
            ),
          );
        },
      ),
    );
  }
}
