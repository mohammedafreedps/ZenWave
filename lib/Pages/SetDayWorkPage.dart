import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/DB/Boxes.dart';
import 'package:zenwave/DB/futureTask/futureTask.dart';
import 'package:zenwave/Pages/JournalAddPage.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';
import 'package:zenwave/Widgets/TextFieldBorder.dart';

class SetDayWorkPage extends StatefulWidget {
  // const SetDayWorkPage({super.key});
  Function refresh;

  SetDayWorkPage(this.refresh);

  @override
  State<SetDayWorkPage> createState() => _SetDayWorkPageState();
}

class _SetDayWorkPageState extends State<SetDayWorkPage> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  TextEditingController _FutureTasks = TextEditingController();

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2040))
        .then((value) {
      setState(() {
        _selectedDate = value;
      });
    });
  }

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _selectedTime = value;
      });
    });
  }

  _savingFutureTask(String task){
    if (_selectedDate != null && _selectedTime != null) {
      int _day = _selectedDate!.day;
      int _month = _selectedDate!.month;
      int _year = _selectedDate!.year;
      int _min = _selectedTime!.minute;
      int _hr = _selectedTime!.hour;
      widget.refresh();
      futureTaskBox.put(DateTime.now().toString(), futureTask(_day, _month, _year, _min, _hr, task));
    }
    
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        elevation: 0,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: baseColor,
        child: Padding(
          padding: EdgeInsets.all(PagePadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Date:  ' +
                    (_selectedDate?.day.toString() ?? '') +
                    ' : ' +
                    (_selectedDate?.month.toString() ?? '') +
                    ' : ' +
                    (_selectedDate?.year.toString() ?? ''),
                style: TextStyle(fontSize: 25, color: primaryColor),
              ),
              Text(
                'Time:  ' +( _selectedTime?.hour.toString()??'')+' : ' +( _selectedTime?.minute.toString()??''),
                style: TextStyle(color: primaryColor, fontSize: 25),
              ),
              TextFieldBorder(_FutureTasks),
              CustomisableButton(
                290,
                90,
                secondaryColor,
                primaryColor,
                'Set Date',
                bigButtonFontSize,
                true,
                toPerform: _showDatePicker,
              ),
              CustomisableButton(
                290,
                90,
                secondaryColor,
                primaryColor,
                'Set time',
                bigButtonFontSize,
                true,
                toPerform: _showTimePicker,
              ), _selectedDate != null && _selectedTime != null ?
              CustomisableButton(290, 90, secondaryColor, primaryColor, 'Add Task',
                  bigButtonFontSize, true,go: JournalAddPage('AddTask','SET',toperform: _savingFutureTask,),HowToGO: 'push',):Text('')
            ],
          ),
        ),
      ),
    );
  }
}
