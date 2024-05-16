import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textEditingController = TextEditingController();
  List<String> _todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 245, 156),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Todo List',
            style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodoItem,
        tooltip: 'Add task',
        backgroundColor: Colors.cyan,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (BuildContext context, int index) {
        final todoItem = _todoItems[index];
        return ListTile(
          title: Text(todoItem),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 10, 105, 13),
                ),
                onPressed: () => _editTodoItem(index),
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () => _deleteTodoItem(index),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addTodoItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Add Task',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.blue),
          ),
          content: TextField(
            controller: _textEditingController,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Task',
              labelStyle: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _todoItems.add(_textEditingController.text);
                  _textEditingController.clear();
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Add',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _editTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task',
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 5, 134, 60))),
          content: TextField(
            controller: TextEditingController(text: _todoItems[index]),
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Task',
              labelStyle: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _todoItems[index] = _textEditingController.text;
                  _textEditingController.clear();
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Save',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  void _deleteTodoItem(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Task',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          content: const Text('Are you sure you want to delete this task?',
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _todoItems.removeAt(index);
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Delete',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}
