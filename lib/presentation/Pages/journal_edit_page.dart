import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/Boxes.dart';
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
  TextEditingController jounalEditDescriptionController =
      TextEditingController();
  TextEditingController jounalEditTitleController = TextEditingController();
  
  DateTime? _selectedDate;
  List _allData = [];

  _getDataFromPersonalJournalDB() async {
    if (widget.from == 'Personal') {
      _allData = await personalJournalBox.values.toList();
      _setAllValue();
    }
  }

  _setAllValue() {
    setState(() {
      jounalEditDescriptionController.text = _allData[widget.index].content;
      jounalEditTitleController.text = _allData[widget.index].title;
    });
  }

  @override
  void initState() {
    _getDataFromPersonalJournalDB();

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
        print('null statement add');
        personaljounalEdit = personalJournalBox.getAt(widget.index);
        personaljounalEdit!.title = jounalEditTitleController.text;
        personaljounalEdit!.content = jounalEditDescriptionController.text;
        personaljounalEdit!.edited = true;
        personaljounalEdit!.day = DateTime.now().day;
        personaljounalEdit!.month = DateTime.now().month;
        personaljounalEdit!.year = DateTime.now().year;
        personalJournalBox.putAt(widget.index, personaljounalEdit);
      } else if (_selectedDate != null) {
        print('not null statement add');
        personaljounalEdit = personalJournalBox.getAt(widget.index);
        personaljounalEdit!.title = jounalEditTitleController.text;
        personaljounalEdit!.content = jounalEditDescriptionController.text;
        personaljounalEdit!.edited = true;
        personaljounalEdit!.day = _selectedDate!.day;
        personaljounalEdit!.month = _selectedDate!.month;
        personaljounalEdit!.year = _selectedDate!.year;
        personalJournalBox.putAt(widget.index, personaljounalEdit);
      }
    }

    saveGratitudeJournal() async {
      await gratitudeJournalBox.put(
          DateTime.now().toString(),
          gratutudeJournal(jounalEditDescriptionController.text,
              DateTime.now().day, DateTime.now().month, DateTime.now().year));
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
          width: double.infinity,
          height: 990,
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
