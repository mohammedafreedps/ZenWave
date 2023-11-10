import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/data/DB/journals/deletedJournal.dart';
import 'package:zenwave/presentation/Pages/journal_add_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/journal_list.dart';

class GratitudejournalList extends StatefulWidget {
  const GratitudejournalList({super.key});

  @override
  State<GratitudejournalList> createState() => _GratitudejournalListState();
}

class _GratitudejournalListState extends State<GratitudejournalList> {
  DateTime? _selectedDate;

  List _allGratitudeJournal = [];
  List _searchResuls = [];

  _getDataFromPersonalJournalDB() async {
    _allGratitudeJournal = gratitudeJournalBox.values.toList();
    _searchResuls = _allGratitudeJournal;
  }

  _searchJournals(DateTime searchDate) {
    int _searchDay = searchDate.day;
    int _searchMonth = searchDate.month;
    int _searchYear = searchDate.year;
    print('searching block');
    _searchResuls = _allGratitudeJournal.where((journal) {
      return journal.day == _searchDay &&
          journal.month == _searchMonth &&
          journal.year == _searchYear;
    }).toList();
  }

  _deleteJournal(index) async {
    setState(() {
      final _give = gratitudeJournalBox.getAt(index);
      final _giver = deletedJournal(_give.content, _give.day, _give.month, _give.year, 'Gratitude');
      deletedJournalBox.put(DateTime.now().toString(), _giver);
      gratitudeJournalBox.deleteAt(index);
      _getDataFromPersonalJournalDB();
    });
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2040))
        .then((value) {
      setState(() {
        _selectedDate = value;
        if (_selectedDate != null) {
          _searchJournals(_selectedDate!);
        }
      });
    });
  }

  @override
  void initState() {
    _getDataFromPersonalJournalDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BASE_COLOR,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: BASE_COLOR,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PAGE_PADDING),
            child: Column(
              children: [
                CustomisableButton(
                  220,
                  70,
                  SECONDARY_COLOR,
                  PRIMARY_COLOR,
                  'Serch',
                  20,
                  true,
                  toPerform: _showDatePicker,
                ),
                SizedBox(
                  height: 50,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: _searchResuls.length,
                    itemBuilder: (BuildContext context, int index) {
                      final jorns = _searchResuls[index];
                      return InkWell(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Do you want to delete'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('NO')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _deleteJournal(index);
                                        },
                                        child: Text('YES'))
                                  ],
                                );
                              });
                        },
                        child: JournalListItem(jorns.day, jorns.month,
                            jorns.year, jorns.content, 'Gratitude', false),
                      );
                    }),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        elevation: Elevetion,
        backgroundColor: SECONDARY_COLOR,
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return JournalAddPage('Gratitude', 'SAVE');
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
