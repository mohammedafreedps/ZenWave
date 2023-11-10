import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/data/DB/journals/deletedJournal.dart';
import 'package:zenwave/presentation/Pages/journal_add_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/journal_list.dart';

class PersonalJournalLists extends StatefulWidget {
  const PersonalJournalLists({super.key});

  @override
  State<PersonalJournalLists> createState() => _PersonalJournalListsState();
}

class _PersonalJournalListsState extends State<PersonalJournalLists> {
  DateTime? _selectedDate;

  List _allPersonalJournals = [];
  List _searchResuls = [];

  _getDataFromPersonalJournalDB() async {
    _allPersonalJournals = personalJournalBox.values.toList();
    _searchResuls = _allPersonalJournals;
  }

  _searchJournals(DateTime searchDate) {
    int _searchDay = searchDate.day;
    int _searchMonth = searchDate.month;
    int _searchYear = searchDate.year;
    print('searching block');
    _searchResuls = _allPersonalJournals.where((journal) {
      return journal.day == _searchDay &&
          journal.month == _searchMonth &&
          journal.year == _searchYear;
    }).toList();
  }

  _deleteJournal(index) async {
    setState(() {
      final _give = personalJournalBox.getAt(index);
      final _giver = deletedJournal(_give.content, _give.day, _give.month, _give.year, 'Personal');
      deletedJournalBox.put(DateTime.now().toString(),_giver);
      personalJournalBox.deleteAt(index);
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
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text('Do you want to delete'),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text('NO')),
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                  _deleteJournal(index);
                                }, child: Text('YES'))
                              ],
                            );
                          });
                        },
                        child: JournalListItem(jorns.day, jorns.month,
                            jorns.year, jorns.content, 'Personal', false),
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
