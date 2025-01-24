import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template68/provider/my_state.dart';
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
            onPressed: () {},
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
              subtitle: Text(myState[index].id),
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(myState[index].name[0]),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => myStateNotifier.delete(index),
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
