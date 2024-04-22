import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../config/config.dart';
import '../../domain/domain.dart';

part 'todo_providers.g.dart';

enum FilterType{all,completed,pending}
const uuid= Uuid();


@riverpod
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() {
    return FilterType.all;
  }

  void changeCurrentFilter(FilterType newFilter){
    state=newFilter;
  }

}

@riverpod
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
    ];
  }

  void createTodo(String description){
    state=[
      ...state,
      Todo(id: uuid.v4(),description: description,completedAt: null)
    ];
  }

  void toggleTodo(String id){
    state=state.map((todo){
      if(todo.id==id){
        todo= todo.copyWith(completedAt: todo.done?null:DateTime.now());
      }
      return todo;
    }).toList();
  }

}

@riverpod
List<Todo> filteredTodos (FilteredTodosRef ref) {
  final currentFilter= ref.watch(todoCurrentFilterProvider);
 final todos= ref.watch(todosProvider);

  
  switch (currentFilter){
    case FilterType.all:
      return todos;
    case FilterType.completed:
      return todos.where((element) => element.done).toList();
    case FilterType.pending:
      return todos.where((element) => !element.done).toList();
  }
  
}