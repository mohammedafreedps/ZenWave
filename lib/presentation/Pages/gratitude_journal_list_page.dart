import 'package:flutter/material.dart';
import 'package:zenwave/data/DB/journals/gratitudeJournal.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/data/DB/journals/deletedJournal.dart';
import 'package:zenwave/presentation/Pages/journal_add_page.dart';
import 'package:zenwave/presentation/Pages/journal_edit_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/journal_list.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

class GratitudejournalList extends StatefulWidget {
  const GratitudejournalList({super.key});

  @override
  State<GratitudejournalList> createState() => _GratitudejournalListState();
}

class _GratitudejournalListState extends State<GratitudejournalList> {
  DateTime? _selectedDate;
  DateTime? _startingDate;
  DateTime? _endingDate;

  List _allGratitudeJournal = [];
  List _searchResuls = [];

  TextEditingController _searchTitleController = TextEditingController();

  _getDataFromGratitudeJournalDB() async {
    _allGratitudeJournal = gratitudeJournalBox.values.toList();
    setState(() {
      _searchResuls = _allGratitudeJournal;
    });
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
      final _giver = deletedJournal(
          _give.title,_give.content, _give.day, _give.month, _give.year,_give.edited, 'Gratitude');
      deletedJournalBox.put(DateTime.now().toString(), _giver);
      gratitudeJournalBox.deleteAt(index);
      _getDataFromGratitudeJournalDB();
    });
  }

  _editJounal(index) {
    final gratitudeJournal = _searchResuls[index];
    final originalIndex = _allGratitudeJournal.indexOf(gratitudeJournal);
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return JournalEditPage(
        'Gratitude',
        'Save',
        originalIndex,
        toperform: _getDataFromGratitudeJournalDB,
      );
    }));
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

  _serchByDateRange() {
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
                  child: Text('Search'))
            ],
          );
        });
  }

  _searchByRange(DateTime startDate, DateTime endDate) {
    List updatedResults = [];

    for (var i = 0; i < gratitudeJournalBox.length; i++) {
      gratutudeJournal entry = gratitudeJournalBox.getAt(i);
      DateTime entryDate = DateTime(entry.year, entry.month, entry.day);

      if (entryDate.isAfter(startDate.subtract(Duration(days: 1))) &&
          entryDate.isBefore(endDate.add(Duration(days: 1)))) {
        updatedResults.add(entry);
      }
    }

    setState(() {
      _searchResuls = List.from(updatedResults);
    });
  }

  _serchByTitle(String searchFor) {
    setState(() {
      _searchResuls = _allGratitudeJournal
          .where((journal) =>
              journal.title.toLowerCase().startsWith(searchFor.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    _getDataFromGratitudeJournalDB();
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
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast),
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
                            _getDataFromGratitudeJournalDB();
                          },
                          icon: Icon(Icons.refresh))
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
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
                            'Range',
                            20,
                            true,
                            toPerform: _serchByDateRange,
                          ),
                        ],
                      ),
                      TextFieldBorder(_searchTitleController ,onchangeof: _serchByTitle,)
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 700,
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
                                              _editJounal(index);
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
                            child: JournalListItem(
                                jorns.day,
                                jorns.month,
                                jorns.year,
                                jorns.content,
                                jorns.title,
                                'Gratitude',
                                false,
                                jorns.edited),
                          );
                        }),
                  ),
                ],
              ),
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
