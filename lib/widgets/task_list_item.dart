import 'package:flutter/material.dart';
import '../models/task.dart';
import '../screens/task_detail_screen.dart'; // タスク詳細画面のインポート

class TaskListItem extends StatelessWidget {
  final Task task;
  final Function(Task) onTaskCompleted; // タスク完了時に呼ばれるコールバック

  TaskListItem({required this.task, required this.onTaskCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // カードの背景色
        borderRadius: BorderRadius.circular(12), // 角を丸くする
        boxShadow: [
          BoxShadow(
            color: Colors.black26, // 影の色
            blurRadius: 8, // 影のぼかし
            offset: Offset(0, 2), // 影の位置
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), // マージンを追加
      child: ListTile(
        contentPadding: EdgeInsets.all(16), // パディングを追加
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: task.completed ? Colors.grey : Colors.black, // 完了タスクはグレー
            decoration: task.completed ? TextDecoration.lineThrough : null, // 完了タスクに取り消し線
          ),
        ),
        trailing: AnimatedSwitcher(
          duration: Duration(milliseconds: 300), // アニメーションの持続時間
          child: Checkbox(
            key: ValueKey<bool>(task.completed), // アニメーションのためにキーを設定
            value: task.completed,
            onChanged: (value) {
              if (value != null) {
                onTaskCompleted(task); // タスク完了時にコールバックを呼び出す
              }
            },
            activeColor: Colors.blue, // チェックボックスのアクティブカラー
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailScreen(task: task), // タスク詳細画面にタスクを渡す
            ),
          );
        },
      ),
    );
  }
}