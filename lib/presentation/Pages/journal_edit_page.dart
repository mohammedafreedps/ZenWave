import 'package:flutter/material.dart';
import 'package:zenwave/data/DBFunction/gratitude_journal.dart';
import 'package:zenwave/data/DBFunction/personal_journal.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Consts/values.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/journals/gratitudeJournal.dart';
import 'package:zenwave/data/DB/journals/personalJournal.dart';
import 'package:zenwave/presentation/Pages/journal_option_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

class JournalEditPage extends StatefulWidget {
  // const JournalEditPage({super.key});
  final String from;
  final String buttontext;
  final Function? toperform;
  final int index;

  JournalEditPage(this.from, this.buttontext, this.index, {this.toperform});

  @override
  State<JournalEditPage> createState() => _JournalEditPageState();
}

class _JournalEditPageState extends State<JournalEditPage> {
  personalJournal? personaljounalEdit;
  gratutudeJournal? gratitudeJournalEdit;
  TextEditingController jounalEditDescriptionController =
      TextEditingController();
  TextEditingController jounalEditTitleController = TextEditingController();

  DateTime? _selectedDate;
  List _allData = [];

  _getDataFromPersonalJournalDB() async {
    if (widget.from == 'Personal') {
      _allData = await personalJournalBox.values.toList();
      _setAllValuePersonal();
    }
  }

  _setAllValuePersonal() {
    setState(() {
      jounalEditDescriptionController.text = _allData[widget.index].content;
      jounalEditTitleController.text = _allData[widget.index].title;
    });
  }

  _getDataFromGratitudeJournalDB() async {
    if (widget.from == 'Gratitude') {
      _allData = await gratitudeJournalBox.values.toList();
      _setAllValueGratitude();
    }
  }

  _setAllValueGratitude() {
    setState(() {
      jounalEditDescriptionController.text = _allData[widget.index].content;
      jounalEditTitleController.text = _allData[widget.index].title;
    });
  }

  @override
  void initState() {
    if (widget.from == 'Gratitude') {
      _getDataFromGratitudeJournalDB();
    }
    if (widget.from == 'Personal') {
      _getDataFromPersonalJournalDB();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _showDatePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now())
          .then((value) {
        _selectedDate = value;
        print(_selectedDate);
      });
    }

    savePersonalJournal() async {
      if (_selectedDate == null) {
        editValuesInPersonalJournal(
            widget.index,
            jounalEditTitleController.text,
            jounalEditDescriptionController.text,
            DateTime.now().day,
            DateTime.now().month,
            DateTime.now().year,
            true);
      } else if (_selectedDate != null) {
        editValuesInPersonalJournal(
            widget.index,
            jounalEditTitleController.text,
            jounalEditDescriptionController.text,
            _selectedDate!.day,
            _selectedDate!.month,
            _selectedDate!.year,
            true);
      }
    }

    saveGratitudeJournal() async {
      if (_selectedDate == null) {
        editValuesInGratutudeJournal(
            widget.index,
            jounalEditTitleController.text,
            jounalEditDescriptionController.text,
            DateTime.now().day,
            DateTime.now().month,
            DateTime.now().year,
            true);
      } else if (_selectedDate != null) {
        editValuesInGratutudeJournal(
            widget.index,
            jounalEditTitleController.text,
            jounalEditDescriptionController.text,
            _selectedDate!.day,
            _selectedDate!.month,
            _selectedDate!.year,
            true);
      }
    }

    saveTo() {
      if (widget.from == 'Personal') {
        print('Personal saved');
        savePersonalJournal();
        if (widget.toperform != null) {
          widget.toperform!();
        }
      } else if (widget.from == 'Gratitude') {
        saveGratitudeJournal();
        if (widget.toperform != null) {
          widget.toperform!();
        }
      } else if (widget.from == 'Deleted') {
        print('Deleted restored');
      } else if (widget.from == 'AddTask') {
        print('to add workgin');
        if (widget.toperform != null) {
          widget.toperform!(jounalEditDescriptionController.text);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BASE_COLOR,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget.from,
          style: TextStyle(color: PRIMARY_COLOR, fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: SCREEN_WIDTH,
          height: SCREEN_HEIGHT,
          padding: EdgeInsets.all(PAGE_PADDING),
          color: BASE_COLOR,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PhysicalModel(
                color: SECONDARY_COLOR,
                elevation: Elevetion,
                borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                  child: Container(
                      padding: EdgeInsets.all(PAGE_PADDING + 10),
                      width: double.infinity,
                      height: 780,
                      color: SECONDARY_COLOR,
                      child: Column(
                        children: [
                          CustomisableButton(
                            200,
                            60,
                            BASE_COLOR,
                            PRIMARY_COLOR,
                            'Change Date',
                            20,
                            false,
                            toPerform: _showDatePicker,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text('Title'),
                          TextFieldBorder(jounalEditTitleController),
                          SizedBox(
                            height: 40,
                          ),
                          Text('Description'),
                          TextFieldBorder(jounalEditDescriptionController),
                        ],
                      )),
                ),
              ),
              CustomisableButton(
                240,
                69,
                SECONDARY_COLOR,
                PRIMARY_COLOR,
                widget.buttontext,
                20,
                true,
                toPerform: saveTo,
                go: JournalOptionPage(),
                HowToGO: 'pop',
              )
            ],
          ),
        ),
      ),
    );
  }
}
