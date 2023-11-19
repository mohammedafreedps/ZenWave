import 'package:flutter/material.dart';
import 'package:zenwave/data/DBFunction/future_Tasks.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
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
  int _selectedValue = 1;
  String? _displayDate;
  String? _displayTime;
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
        String day = value!.day.toString();
        String month = value.month.toString();
        String year = value.year.toString();
        _displayDate = '''$day - $month - $year ''';
      });
    });
  }

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _selectedTime = value;
        String hr = value!.hour.toString();
        String min = value.minute.toString();
        _displayTime = '''$hr - $min''';
      });
    });
  }

  _saveData() {
    if (_selectedDate != null &&
        _selectedTime != null &&
        _FutureTasks.text.isNotEmpty) {
      addValueToFutureTask(
          _selectedDate!.day,
          _selectedDate!.month,
          _selectedDate!.year,
          _selectedTime!.minute,
          _selectedTime!.hour,
          _FutureTasks.text,
          _selectedValue);
      widget.refresh();
      Navigator.pop(context);
    }
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
            children: [
              Text('Priority'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                      activeColor: PRIMARY_COLOR,
                      value: 1,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value as int;
                          print(_selectedValue);
                        });
                      }),
                  Text('High'),
                  Radio(
                      activeColor: PRIMARY_COLOR,
                      value: 2,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value as int;
                          print(_selectedValue);
                        });
                      }),
                  Text('Medium'),
                  Radio(
                      activeColor: PRIMARY_COLOR,
                      value: 3,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value as int;
                          print(_selectedValue);
                        });
                      }),
                  Text('Low'),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              _selectedDate == null
                  ? CustomisableButton(
                      190,
                      60,
                      SECONDARY_COLOR,
                      PRIMARY_COLOR,
                      'Select Date',
                      20,
                      true,
                      toPerform: _showDatePicker,
                    )
                  : CustomisableButton(
                      190,
                      60,
                      SECONDARY_COLOR,
                      PRIMARY_COLOR,
                      _displayDate!,
                      20,
                      true,
                      toPerform: _showDatePicker,
                    ),
              SizedBox(
                height: 30,
              ),
              _selectedTime == null
                  ? CustomisableButton(
                      190,
                      60,
                      SECONDARY_COLOR,
                      PRIMARY_COLOR,
                      'Select Time',
                      20,
                      true,
                      toPerform: _showTimePicker,
                    )
                  : CustomisableButton(190, 60, SECONDARY_COLOR, PRIMARY_COLOR,
                      _displayTime!, 20, true,
                      toPerform: _showTimePicker),
              SizedBox(
                height: 50,
              ),
              Text('TASKS'),
              SizedBox(
                height: 30,
              ),
              TextFieldBorder(_FutureTasks),
              SizedBox(
                height: 50,
              ),
              CustomisableButton(
                190,
                60,
                SECONDARY_COLOR,
                PRIMARY_COLOR,
                'Save',
                20,
                true,
                toPerform: _saveData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
