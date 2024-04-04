import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(
      child: MaterialApp(home: HomePage()),
    ));

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Todo> todos = ref.watch(todosProvider);
    return Scaffold(
      body: ListView(
        children: [
          for (final todo in todos)
            CheckboxListTile(
              value: todo.completed,
              title: Text(todo.description),
              onChanged: (value) {
                return ref.read(todosProvider.notifier).toggle(todo.id);
              },
            )
        ],
      ),
    );
  }
}

class Todo {
  const Todo({required this.id, required this.description, required this.completed});
  final String id;
  final String description;
  final bool completed;

  Todo copyWith({
    String? id,
    String? description,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);
  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo
    ];
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId) todo.copyWith(completed: !todo.completed) else todo
    ];
  }
}

final todosProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  TodoNotifier todoNotifier = TodoNotifier();
  todoNotifier.addTodo(const Todo(id: '001', description: '下午茶', completed: true));
  todoNotifier.addTodo(const Todo(id: '002', description: '加班', completed: false));
  return todoNotifier;
});
