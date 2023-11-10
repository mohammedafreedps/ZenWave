import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/data/DB/journals/gratitudeJournal.dart';
import 'package:zenwave/data/DB/journals/personalJournal.dart';
import 'package:zenwave/presentation/Pages/journal_option_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

class JournalAddPage extends StatefulWidget {
  // const JournalAddPage({super.key});
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
    TextEditingController jounalAddpageController = TextEditingController();

    savePersonalJournal() async {
      await personalJournalBox.put(
          DateTime.now().toString(),
          personalJournal(jounalAddpageController.text, DateTime.now().day,
              DateTime.now().month, DateTime.now().year));
    }

    saveGratitudeJournal() async {
      await gratitudeJournalBox.put(
          DateTime.now().toString(),
          gratutudeJournal(jounalAddpageController.text, DateTime.now().day,
              DateTime.now().month, DateTime.now().year));
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
          widget.toperform!(jounalAddpageController.text);
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
                      child: TextFieldBorder(jounalAddpageController)),
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
