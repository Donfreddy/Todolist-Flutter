import 'package:flutter/material.dart';
import 'package:todolist/widgets/custom_icon_decoration.dart';
import '../constant.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class Event {
  final String time;
  final String task;
  final String desc;
  final bool isFinish;

  const Event(this.time, this.task, this.desc, this.isFinish);
}

final List<Event> _eventList = [
  new Event("08:00", "Have coffe with Sam", "Personal", true),
  new Event("10:00", "Meet with sales", "Work", true),
  new Event("12:00", "Call Tom about appointment", "Work", false),
  new Event("14:00", "Fix onboarding experience", "Work", false),
  new Event("16:00", "Edit API documentation", "Personal", false),
  new Event("18:00", "Setup user focus group", "Personal", false),
];

class _EventPageState extends State<EventPage> {
  double iconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _eventList.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(
            children: <Widget>[
              _lineStyle(context, index, iconSize, _eventList.length,
                  _eventList[index].isFinish),
              _displayTime(_eventList[index].time),
              _displayContent(_eventList[index]),
            ],
          ),
        );
      },
    );
  }

  Widget _lineStyle(BuildContext context, int index, double iconSize,
      int listLenght, bool isFinish) {
    return Container(
      decoration: CustomIconDecoration(
        iconSize: iconSize,
        lineWidth: 1,
        firstData: index == 0 ?? true,
        lastData: index == listLenght - 1 ?? false,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Color(0x20000000),
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ]),
        child: Icon(
          isFinish ? Icons.fiber_manual_record : Icons.radio_button_unchecked,
          size: iconSize,
          color: customRedColor,
        ),
      ),
    );
  }

  Widget _displayTime(String time) {
    return Container(
      width: 80.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          time,
          style: kTextStyle,
        ),
      ),
    );
  }

  Expanded _displayContent(Event event) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x20000000),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                event.task,
                style: kTextStyle,
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                event.desc,
                style: kTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
