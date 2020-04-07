import 'package:flutter/material.dart';
import 'package:todolist/translations.dart';
import 'package:todolist/widgets/custom_date_time_picker.dart';
import 'package:todolist/widgets/custom_modal_action_button.dart';
import 'package:todolist/widgets/custom_textfield.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();

  Future _pickDate() async {
    DateTime datepick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));
    if (datepick != null)
      setState(() {
        _selectedDate = datepick;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Text(
              Translations.of(context).text('Add new task'),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          CustomTextField(labelText: Translations.of(context).text('Enter task name')),
          SizedBox(height: 12),
          CustomDateTimePicker(
            onPressed: _pickDate,
            icon: Icons.date_range,
            value: new DateFormat.MMMEd(Translations.of(context).currentLanguage == 'en' ?  "en_EN" : "fr_FR").format(_selectedDate),
          ),
          SizedBox(
            height: 24.0,
          ),
          CustomModalActionButton(
            onClose: () {
              Navigator.of(context).pop();
            },
            onSave: () {},
          ),
        ],
      ),
    );
  }
}
