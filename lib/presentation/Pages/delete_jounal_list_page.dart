
import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/presentation/Widgets/journal_list.dart';

class DeletedJournalList extends StatefulWidget {
  const DeletedJournalList({super.key});

  @override
  State<DeletedJournalList> createState() => _DeletedJournalListState();
}

class _DeletedJournalListState extends State<DeletedJournalList> {
  DateTime? _selectedDate;

  List _allDeletedJournals = [];
  List _searchResuls = [];

  _getDataFromDeleteJournalDB() async {
    setState(() {
      _allDeletedJournals = deletedJournalBox.values.toList();
      _searchResuls = _allDeletedJournals;
    });
  }

  _searchJournals(DateTime searchDate) {
    int _searchDay = searchDate.day;
    int _searchMonth = searchDate.month;
    int _searchYear = searchDate.year;
    print('searching block');
    _searchResuls = _allDeletedJournals.where((journal) {
      return journal.day == _searchDay &&
          journal.month == _searchMonth &&
          journal.year == _searchYear;
    }).toList();
  }

  _deleteJournal(index) async {
    setState(() {
      deletedJournalBox.deleteAt(index);
      _getDataFromDeleteJournalDB();
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
    _getDataFromDeleteJournalDB();
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
            child: ListView.builder(
                itemCount: _searchResuls.length,
                itemBuilder: (BuildContext context, int index) {
                  final jorns = _searchResuls[index];
                  return JournalListItem(
                    jorns.day,
                    jorns.month,
                    jorns.year,
                    jorns.content,
                    jorns.title,
                    jorns.fromWhere,
                    true,
                    jorns.edited,
                    index: index,
                    passingForRefresh: _getDataFromDeleteJournalDB,
                  );
                }),
          )),
    );
  }
}
