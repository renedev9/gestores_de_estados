import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/provider.dart';


class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
      ),
      body: _TodoView(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read(todosStateNotifierProvider.notifier).addTodo();
      }),
    );
  }
}

class _TodoView extends ConsumerWidget {
  const _TodoView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final currentFilter= ref.watch(todoFilterProvider);
    final todos= ref.watch(filteredGuestProvider);
    return Column(
      children: [
        

        SegmentedButton(
          segments: [
            ButtonSegment(value: TodoFilter.all, icon: Text('Todos')),
            ButtonSegment(value: TodoFilter.completed, icon: Text('Invitados')),
            ButtonSegment(value: TodoFilter.pending, icon: Text('No invitados')),
          ], 
          selected:  <TodoFilter>{currentFilter },
          onSelectionChanged: (value) {
            ref.read(todoFilterProvider.notifier).update((state) => value.first);
          },
        ),
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
                  ref.read(todosStateNotifierProvider.notifier).toogleTodo(todo.id);
                }
              );
            },
          ),
        ) 
      ],
    );
  }
}