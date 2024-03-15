import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class DatePickerButton extends StatefulWidget {
  const DatePickerButton({Key? key}) : super(key: key);

  @override
  _DatePickerButtonState createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  List<DateTime?> selectedDates = [];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.multi,
                selectedDayHighlightColor: Colors.indigo,
              ),
              value: selectedDates,
              onValueChanged: (dates) {
                setState(() {
                  selectedDates = dates ?? [];
                });
              },
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(selectedDates);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
