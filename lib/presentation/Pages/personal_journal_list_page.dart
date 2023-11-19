import 'package:flutter/material.dart';
import 'package:zenwave/data/DB/journals/personalJournal.dart';
import 'package:zenwave/data/DBFunction/personal_journal.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/values.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/journals/deletedJournal.dart';
import 'package:zenwave/presentation/Pages/journal_add_page.dart';
import 'package:zenwave/presentation/Pages/journal_edit_page.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/journal_list.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

class PersonalJournalLists extends StatefulWidget {
  const PersonalJournalLists({super.key});

  @override
  State<PersonalJournalLists> createState() => _PersonalJournalListsState();
}

class _PersonalJournalListsState extends State<PersonalJournalLists> {
  DateTime? _selectedDate;
  DateTime? _startingDate;
  DateTime? _endingDate;

  List _searchResuls = [];

  TextEditingController _searchTitleController = TextEditingController(); 

  _setValueFromDB(){
    setState(() {
      _searchResuls = getAllValueFromPersonalJournal();
    });
  }


  _searchJournals(DateTime searchDate) {
    int _searchDay = searchDate.day;
    int _searchMonth = searchDate.month;
    int _searchYear = searchDate.year;
    print('searching block');
    _searchResuls = allValueInPersonalJournalsDB.where((journal) {
      return journal.day == _searchDay &&
          journal.month == _searchMonth &&
          journal.year == _searchYear;
    }).toList();
  }

  _deleteJournal(index) async {
    setState(() {
      final _give = personalJournalBox.getAt(index);
      final _giver = deletedJournal(
          _give.title,_give.content, _give.day, _give.month, _give.year,_give.edited, 'Personal');
      deletedJournalBox.put(DateTime.now().toString(), _giver);
      deleteValueInPersonalJournal(index);
      _setValueFromDB();
    });
  }

  _editJounal(index) {
    final personalJournal = _searchResuls[index];
    final originalIndex = allValueInPersonalJournalsDB.indexOf(personalJournal);
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return JournalEditPage(
        'Personal',
        'Save',
        originalIndex,
        toperform: _setValueFromDB,
      );
    }));
  }

  _serchByDate() {
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
                  child: Text('Search')),
            ],
          );
        });
  }

  _searchByRange(DateTime startDate, DateTime endDate) {
    List updatedResults = [];

    for (var i = 0; i < personalJournalBox.length; i++) {
      personalJournal entry = personalJournalBox.getAt(i);
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
      _searchResuls = allValueInPersonalJournalsDB
          .where((journal) =>
              journal.title.toLowerCase().startsWith(searchFor.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    _searchResuls  =  getAllValueFromPersonalJournal();
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
                            _setValueFromDB();
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
                                      title: Text('Do you want to'),
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
                                'Personal',
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
            return JournalAddPage('Personal', 'SAVE');
          }));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: PRIMARY_COLOR,
        ),
      ),
    );
  }
}
