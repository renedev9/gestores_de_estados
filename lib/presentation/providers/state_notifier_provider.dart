

import 'package:estados_app/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../domain/domain.dart';
import 'todo_providers.dart';

 final todosStateNotifierProvider = StateNotifierProvider<TodosNotifier,List<Todo>>((ref) {
  return TodosNotifier();
}); 
const _uuid=Uuid();

final filteredGuestProvider = Provider.autoDispose<List<Todo>>((ref) {
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

class TodosNotifier extends StateNotifier<List<Todo>>{
  TodosNotifier():super([
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now())
  ]);

void addTodo(){
  //*Automaticamente cambia el estado del StateNotifier
  state=[
    ...state,
     Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
  ]; 
}

void toogleTodo(String id){
  state=state.map((todo) {
    if(todo.id!=id)return todo;
    
    if(todo.done) return todo.copyWith(completedAt: null);

    return todo.copyWith(completedAt: DateTime.now());
    
  }).toList();
}
}