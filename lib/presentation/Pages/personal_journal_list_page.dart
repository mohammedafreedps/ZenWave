import 'package:flutter/material.dart';
import 'package:zenwave/data/DB/journals/personalJournal.dart';
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
  DateTime? _startingDate;
  DateTime? _endingDate;

  List _allPersonalJournals = [];
  List _searchResuls = [];

  _getDataFromPersonalJournalDB() async {
    _allPersonalJournals = personalJournalBox.values.toList();
    setState(() {
      _searchResuls = _allPersonalJournals;
    });
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
      final _giver = deletedJournal(
          _give.content, _give.day, _give.month, _give.year, 'Personal');
      deletedJournalBox.put(DateTime.now().toString(), _giver);
      personalJournalBox.deleteAt(index);
      _getDataFromPersonalJournalDB();
    });
  }

  void _serchByDate() {
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

  _dateRange() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Set Range'),
            actions: [
              TextButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now())
                        .then((value) {
                      _startingDate = value;
                    });
                  },
                  child: Text('Starting')),
              TextButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime.now())
                        .then((value) {
                      _endingDate = value;
                    });
                  },
                  child: Text('Ending')),
              TextButton(
                  onPressed: () {
                    if (_startingDate != null && _endingDate != null) {
                      Navigator.pop(context);
                      _searchByRange(_startingDate!, _endingDate!);
                    }
                  },
                  child: Text('Search')),
            ],
          );
        });
  }

  _searchByRange(DateTime startDate, DateTime endDate) {
    _searchResuls.clear();
    for (var i = 0; i < personalJournalBox.length; i++) {
      personalJournal entry = personalJournalBox.getAt(i);
      DateTime entryDate = DateTime(entry.year, entry.month, entry.day);

      if (entryDate.isAfter(startDate.subtract(Duration(days: 1))) &&
          entryDate.isBefore(endDate.add(Duration(days: 1)))) {
        setState(() {
          print('adding entry');
          _searchResuls.add(entry);
        });
      }
    }
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Search by',
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {
                          _getDataFromPersonalJournalDB();
                        },
                        icon: Icon(Icons.refresh))
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomisableButton(
                      120,
                      70,
                      SECONDARY_COLOR,
                      PRIMARY_COLOR,
                      'Date',
                      20,
                      true,
                      toPerform: _serchByDate,
                    ),
                    CustomisableButton(
                      120,
                      70,
                      SECONDARY_COLOR,
                      PRIMARY_COLOR,
                      'Title',
                      20,
                      true,
                    ),
                    CustomisableButton(
                      120,
                      70,
                      SECONDARY_COLOR,
                      PRIMARY_COLOR,
                      'Range',
                      20,
                      true,
                      toPerform: _dateRange,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 750,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
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
                                          child: Text('Edit')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            _deleteJournal(index);
                                          },
                                          child: Text('Delete'))
                                    ],
                                  );
                                });
                          },
                          child: JournalListItem(jorns.day, jorns.month,
                              jorns.year, jorns.content, 'Personal', false),
                        );
                      }),
                ),
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
