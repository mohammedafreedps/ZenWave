import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
import 'package:zenwave/business/services/hapticfeedback.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Consts/values.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/journals/gratitudeJournal.dart';
import 'package:zenwave/data/DB/journals/personalJournal.dart';
import 'package:zenwave/presentation/Pages/journal_option_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

class JournalAddPage extends StatefulWidget {
  final String setTo;
  final String buttontext;
  final Function? toperform;

  JournalAddPage(this.setTo, this.buttontext, {this.toperform});

  @override
  State<JournalAddPage> createState() => _JournalAddPageState();
}

class _JournalAddPageState extends State<JournalAddPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController jounalAddDescriptionController =
        TextEditingController();
    TextEditingController jounalAddTitleController = TextEditingController();
    DateTime? _selectedDate;



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
      hapticFeedback('s');
      if (_selectedDate == null) {
        print('null statement add');
        await personalJournalBox.put(
            DateTime.now().toString(),
            personalJournal(jounalAddTitleController.text,jounalAddDescriptionController.text,
                DateTime.now().day, DateTime.now().month, DateTime.now().year,false));
      } else if (_selectedDate != null) {
        print('not null statement add');
        await personalJournalBox.put(
            DateTime.now().toString(),
            personalJournal(jounalAddTitleController.text,jounalAddDescriptionController.text,
                _selectedDate!.day, _selectedDate!.month, _selectedDate!.year,false));
      }
    }

    saveGratitudeJournal() async {
      hapticFeedback('s');
      if (_selectedDate == null) {
        print('null statement add');
        await gratitudeJournalBox.put(
            DateTime.now().toString(),
            gratutudeJournal(jounalAddTitleController.text,jounalAddDescriptionController.text,
                DateTime.now().day, DateTime.now().month, DateTime.now().year,false));
      } else if (_selectedDate != null) {
        print('not null statement add');
        await gratitudeJournalBox.put(
            DateTime.now().toString(),
            gratutudeJournal(jounalAddTitleController.text,jounalAddDescriptionController.text,
                _selectedDate!.day, _selectedDate!.month, _selectedDate!.year,false));
      }
    }

    saveTo() {
      if (widget.setTo == 'Personal') {
        print('Personal saved');
        savePersonalJournal();
      } else if (widget.setTo == 'Gratitude') {
        saveGratitudeJournal();
      } else if (widget.setTo == 'Deleted') {
        print('Deleted restored');
      } else if (widget.setTo == 'AddTask') {
        print('to add workgin');
        if (widget.toperform != null) {
          widget.toperform!(jounalAddDescriptionController.text);
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
          widget.setTo,
          style: TextStyle(color: PRIMARY_COLOR, fontSize: 28),
        ),
      ),
      body: Container(
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
        padding: EdgeInsets.symmetric(horizontal: PAGE_PADDING),
        color: BASE_COLOR,
        child: SingleChildScrollView(
          child: Column(
            children: [
              PhysicalModel(
                color: SECONDARY_COLOR,
                elevation: Elevetion,
                borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                  child: Container(
                      padding: EdgeInsets.all(PAGE_PADDING + 10),
                      width: JOURNAL_ADDPAGE_CONTAINER_WIDTH,
                      height: JOURNAL_ADDPAGE_CONTAINER_HEIGHT,
                      color: SECONDARY_COLOR,
                      child: Column(
                        children: [
                          CustomisableButton(
                            PLANWORK_BUTTON_WIDTH!,
                            PLANWORK_BUTTON_HEIGHT!,
                            BASE_COLOR,
                            PRIMARY_COLOR,
                            'Change Date',
                            SETDAY_BUTTON_FONTSIZE!,
                            false,
                            toPerform: _showDatePicker,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text('Title'),
                          TextFieldBorder(jounalAddTitleController),
                          SizedBox(
                            height: 40,
                          ),
                          Text('Description'),
                          TextFieldBorder(jounalAddDescriptionController),
                        ],
                      )),
                ),
              ),
              SizedBox(height: 25,),
              CustomisableButton(
                HOME_BUTTONS_WIDTH!,
                HOME_BUTTONS_HEIGHT!,
                SECONDARY_COLOR,
                PRIMARY_COLOR,
                widget.buttontext,
                HOME_BUTTONS_FONTSIZE!,
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
