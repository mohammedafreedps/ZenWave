import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/data/DBFunction/deleted_journals.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Widgets/journal_list.dart';

class DeletedJournalList extends StatefulWidget {
  const DeletedJournalList({super.key});

  @override
  State<DeletedJournalList> createState() => _DeletedJournalListState();
}

class _DeletedJournalListState extends State<DeletedJournalList> {
  List _searchResuls = [];

  _getDataFromDeleteJournalDB() async {
    setState(() {
      _searchResuls = getallValueFromDeletedJournal();
    });
  }

  _deletePermenently(int index) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete'),
        content: Text('It will delete permenently'),
        actions: [TextButton(onPressed: (){
          deleteValueInDeletedJournal(index);
          navigateTo(context: context, goLike: 'pop');
          setState(() {
            _getDataFromDeleteJournalDB();
          });
        }, child: Text('Delete'))],
      );
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
          width: SCREEN_WIDTH,
          height: SCREEN_HEIGHT,
          color: BASE_COLOR,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: PAGE_PADDING),
            child: ListView.builder(
                itemCount: _searchResuls.length,
                itemBuilder: (BuildContext context, int index) {
                  final jorns = _searchResuls[index];
                  return InkWell(
                    onLongPress: () {
                      _deletePermenently(index);
                    },
                    child: JournalListItem(
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
                    ),
                  );
                }),
          )),
    );
  }
}
