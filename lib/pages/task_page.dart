import 'package:flutter/material.dart';
import 'package:todolist/widgets/custom_button.dart';
import '../constant.dart';

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class Task {
  final String task;
  final bool isFinish;
  const Task(this.task, this.isFinish);
}

final List<Task> _taskList = [
  new Task('Call Tom about appointment', false),
  new Task('Fix on boarding experience', false),
  new Task('Edit API ducumentation', false),
  new Task('Set up user focus group', false),
  new Task('Have coffee with Sam', true),
  new Task('Meet with Sales', true),
];

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: _taskList.length,
      itemBuilder: (context, index) {
        return _taskList[index].isFinish
            ? _taskComplete(_taskList[index].task)
            : _taskUncomplete(_taskList[index]);
      },
    );
  }

  Widget _taskUncomplete(Task data) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Confirm Task",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(data.task),
                      SizedBox(height: 24),
                      Text('time'),
                      SizedBox(height: 24),
                      CustomButton(
                        buttonText: "Complete",
                        onPressed: () {
                          //TODO: implement database req to complete
                        },
                        color: customRedColor,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              );
            });
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Delete Task",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(data.task),
                      SizedBox(height: 24),
                      Text('date'),
                      SizedBox(height: 24),
                      CustomButton(
                        buttonText: "Delete",
                        onPressed: () {
                          //TODO: implement database request to delete
                        },
                        color: customRedColor,
                        textColor: Colors.white,
                      )
                    ],
                  ),
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_unchecked,
              color: customRedColor,
              size: 20.0,
            ),
            SizedBox(width: 28.0),
            Text(
              data.task,
              style: kTextStyle,
            )
          ],
        ),
      ),
    );
  }

  Widget _taskComplete(String task) {
    return Container(
      foregroundDecoration: BoxDecoration(color: Color(0x60FDFDFD)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.radio_button_checked,
              color: customRedColor,
              size: 20.0,
            ),
            SizedBox(width: 28.0),
            Text(
              task,
              style: kTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
