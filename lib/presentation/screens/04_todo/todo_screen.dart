import 'package:estados_app/config/config.dart';
import 'package:estados_app/domain/domain.dart';
import 'package:estados_app/presentation/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';


class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider + Providers'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {
          
         /*  ref.read(todosProvider.notifier).update((state) => [
            ...state,
            Todo(id: const Uuid().v4(), description: RandomGenerator.getRandomName(), completedAt: null)
          ]); */
          ref.read(todosProvider.notifier).createTodo(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}


class _TodoView extends ConsumerWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final currentFilter= ref.watch(todoCurrentFilterProvider);
    final todos= ref.watch(filteredTodosProvider);
    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: [
            ButtonSegment(value: FilterType.all, icon: Text('Todos')),
            ButtonSegment(value: FilterType.completed, icon: Text('Invitados')),
            ButtonSegment(value: FilterType.pending, icon: Text('No invitados')),
          ], 
          selected:  <FilterType>{currentFilter },
          onSelectionChanged: (value) {
            //ref.read(todoFilterProvider.notifier).update((state) => value.first);
            ref.read(todoCurrentFilterProvider.notifier).changeCurrentFilter(value.first);
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
                  ref.read(todosProvider.notifier).toggleTodo(todo.id);
                }
              );
            },
          ),
        )
      ],
    );
  }
}