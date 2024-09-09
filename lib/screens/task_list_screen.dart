import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_list_item.dart';
import '../widgets/task_form.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class TaskAddScreen extends StatelessWidget {
  final Function(Task) onTaskAdded;

  const TaskAddScreen({Key? key, required this.onTaskAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('タスクを追加'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: TaskForm(
          onTaskAdded: (taskName) {
            // String型のtaskNameをTask型に変換
            final newTask = Task(title: taskName); // Taskクラスのコンストラクタに合わせて修正
            onTaskAdded(newTask);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  void _addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _toggleTaskCompletion(Task task) {
    setState(() {
      task.toggleCompleted(); // タスクの完了状態を反転
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: Container(
        color: Colors.grey[200], // 背景色を淡いグレーに設定
        padding: EdgeInsets.all(16), // 内部のパディングを追加
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskListItem(
              task: tasks[index],
              onTaskCompleted: _toggleTaskCompletion, // タスク完了時に呼ばれるコールバック
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskAddScreen(
                onTaskAdded: _addTask, // タスク追加時に呼ばれるコールバック
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}