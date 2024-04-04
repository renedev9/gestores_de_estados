import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/provider.dart';


class ChangeNotifierScreen extends ConsumerWidget {
  const ChangeNotifierScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
      ),
      body: _TodoView(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(todosChangeNotifierProvider.notifier).addTodo();
      }),
    );
  }
}

class _TodoView extends ConsumerWidget {
  const _TodoView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final todosChangeNotifier= ref.watch(todosChangeNotifierProvider);
    final todos=todosChangeNotifier.todos;
    return Column(
      children: [
        

       
        const SizedBox( height: 5 ),

        /// Listado de personas a invitar
         Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo= todos[index];
              return SwitchListTile(
                title:  Text(todo.description),
                value: todo.done, 
                onChanged: ( value ) {
                  ref.read(todosChangeNotifierProvider.notifier).toogleTodo(todo.id);
                }
              );
            },
          ),
        ) 
      ],
    );
  }
}