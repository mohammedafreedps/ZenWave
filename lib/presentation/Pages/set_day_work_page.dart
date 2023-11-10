import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/data/DB/futureTask/futureTask.dart';
import 'package:zenwave/presentation/Pages/journal_add_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

class SetDayWorkPage extends StatefulWidget {
  // const SetDayWorkPage({super.key});
  final Function refresh;

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
        backgroundColor: BASE_COLOR,
        elevation: 0,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: BASE_COLOR,
        child: Padding(
          padding: EdgeInsets.all(PAGE_PADDING),
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
                style: TextStyle(fontSize: 25, color: PRIMARY_COLOR),
              ),
              Text(
                'Time:  ' +( _selectedTime?.hour.toString()??'')+' : ' +( _selectedTime?.minute.toString()??''),
                style: TextStyle(color: PRIMARY_COLOR, fontSize: 25),
              ),
              TextFieldBorder(_FutureTasks),
              CustomisableButton(
                290,
                90,
                SECONDARY_COLOR,
                PRIMARY_COLOR,
                'Set Date',
                BIG_BUTTON_FONT_SIZE,
                true,
                toPerform: _showDatePicker,
              ),
              CustomisableButton(
                290,
                90,
                SECONDARY_COLOR,
                PRIMARY_COLOR,
                'Set time',
                BIG_BUTTON_FONT_SIZE,
                true,
                toPerform: _showTimePicker,
              ), _selectedDate != null && _selectedTime != null ?
              CustomisableButton(290, 90, SECONDARY_COLOR, PRIMARY_COLOR, 'Add Task',
                  BIG_BUTTON_FONT_SIZE, true,go: JournalAddPage('AddTask','SET',toperform: _savingFutureTask,),HowToGO: 'push',):Text('')
            ],
          ),
        ),
      ),
    );
  }
}
