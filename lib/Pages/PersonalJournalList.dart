import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Model/Models.dart';
import 'package:zenwave/Pages/JournalAddPage.dart';
import 'package:zenwave/Widgets/JournalListItem.dart';

class PersonalJournalLists extends StatefulWidget {
  const PersonalJournalLists({super.key});

  @override
  State<PersonalJournalLists> createState() => _PersonalJournalListsState();
}

class _PersonalJournalListsState extends State<PersonalJournalLists> {
  String _SerchWords = '?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: baseColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PagePadding),
            child: Column(
              children: [
                TextField(
                  onChanged: (words) {
                    setState(() {
                      _SerchWords = words;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Search by Date',
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: primaryColor))),
                ),
                SizedBox(
                  height: 30,
                ),
                _SerchWords.length > 1
                    ? Text('Date: ' + _SerchWords)
                    : Text(''),
                SizedBox(
                  height: 50,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: JournalEntry.length,
                    itemBuilder: (BuildContext context, int index) {
                      final jorns = JournalEntry[index];
                      return journalListItem(
                          jorns.date, jorns.content, 'Personal', false);
                    }),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        elevation: Elevetion,
        backgroundColor: secondaryColor,
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return JournalAddPage('Personal', 'SAVE');
          }));
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
