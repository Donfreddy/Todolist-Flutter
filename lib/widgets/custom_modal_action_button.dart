import 'package:flutter/material.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/translations.dart';
import 'package:todolist/widgets/custom_button.dart';

class CustomModalActionButton extends StatelessWidget {
  final VoidCallback onClose;
  final VoidCallback onSave;

  CustomModalActionButton({@required this.onClose, @required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          onPressed: onClose,
          buttonText: Translations.of(context).text('Close'),
        ),
        CustomButton(
          onPressed: onSave,
          buttonText: Translations.of(context).text('Save'),
          color: customRedColor,
          textColor: Colors.white,
        )
      ],
    );
  }
}
