import 'package:estados_app/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domain.dart';

enum TodoFilter{all,completed,pending}

const uuid=Uuid();

final todoFilterProvider = StateProvider.autoDispose<TodoFilter>((ref) {
  return TodoFilter.all;
});

final todosProvider = StateProvider.autoDispose<List<Todo>>((ref) {
  return [
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now())
  ];
});

final filteredTodosProvider = Provider.autoDispose<List<Todo>>((ref) {
  //? Siempre que se necesite manejar un provider dentro de otro, utilizar siempre watch()
  final selectedFilter= ref.watch(todoFilterProvider);
  final todos= ref.watch(todosProvider);
 
 switch (selectedFilter ) {
   
   case TodoFilter.all:
      return todos;
   case TodoFilter.completed:
      return todos.where((element) => element.done).toList();
   case TodoFilter.pending:
     return todos.where((element) => !element.done).toList();
 }
});