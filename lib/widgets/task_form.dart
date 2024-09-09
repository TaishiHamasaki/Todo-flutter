import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  final Function(String) onTaskAdded;

  const TaskForm({Key? key, required this.onTaskAdded}) : super(key: key);

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  String _taskTitle = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onTaskAdded(_taskTitle);
      _taskTitle = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'タスクを入力'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'タスクを入力してください';
              }
              return null;
            },
            onSaved: (value) {
              _taskTitle = value!;
            },
          ),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('追加'),
          ),
        ],
      ),
    );
  }
}