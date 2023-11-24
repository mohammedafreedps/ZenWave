import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
import 'package:zenwave/business/Functions/search_by_date.dart';
import 'package:zenwave/business/Functions/search_by_date_range.dart';
import 'package:zenwave/business/Functions/search_by_title.dart';
import 'package:zenwave/business/Functions/show_picker_date.dart';
import 'package:zenwave/business/services/hapticfeedback.dart';
import 'package:zenwave/data/DBFunction/gratitude_journal.dart';
import 'package:zenwave/data/DBFunction/personal_journal.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Consts/values.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/journals/deletedJournal.dart';
import 'package:zenwave/presentation/Pages/journal_add_page.dart';
import 'package:zenwave/presentation/Pages/journal_edit_page.dart';
import 'package:zenwave/presentation/Widgets/cusText.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/journal_list.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

class JournalListPage extends StatefulWidget {
  final String pageToList;
  const JournalListPage(this.pageToList);

  @override
  State<JournalListPage> createState() => _JournalListPageState();
}

class _JournalListPageState extends State<JournalListPage> {
  DateTime? _selectedDate;
  DateTime? _startingDate;
  DateTime? _endingDate;

  List _searchResuls = [];

  TextEditingController _searchTitleController = TextEditingController();

  _setValueFromDB() {
    setState(() {
      if (widget.pageToList == 'Personal') {
        _searchResuls = getAllValueFromPersonalJournal();
      }
      if (widget.pageToList == 'Gratitude') {
        _searchResuls = getAllValueFromGratutudeJournal();
      }
    });
  }

  _deleteJournal(index) async {
    if (widget.pageToList == 'Personal') {
      setState(() {
        final _give = personalJournalBox.getAt(index);
        final _giver = deletedJournal(_give.title, _give.content, _give.day,
            _give.month, _give.year, _give.edited, 'Personal');
        deletedJournalBox.put(DateTime.now().toString(), _giver);
        deleteValueInPersonalJournal(index);
        _setValueFromDB();
      });
    }
    if (widget.pageToList == 'Gratitude') {
      setState(() {
        final _give = gratitudeJournalBox.getAt(index);
        final _giver = deletedJournal(_give.title, _give.content, _give.day,
            _give.month, _give.year, _give.edited, 'Gratitude');
        deletedJournalBox.put(DateTime.now().toString(), _giver);
        deleteValueInGratutudeJournal(index);
        _setValueFromDB();
      });
    }
  }

  _editJounal(index) {
    if (widget.pageToList == 'Personal') {
      final personalJournal = _searchResuls[index];
      final originalIndex =
          allValueInPersonalJournalsDB.indexOf(personalJournal);
      navigateTo(
          context: context,
          goLike: 'push',
          goPage: JournalEditPage(
            'Personal',
            'Save',
            originalIndex,
            toperform: _setValueFromDB(),
          ));
    }
    if (widget.pageToList == 'Gratitude') {
      final gratitudeJournal = _searchResuls[index];
      final originalIndex =
          allValueInGratitudeJournalsDB.indexOf(gratitudeJournal);
      navigateTo(
          context: context,
          goLike: 'push',
          goPage: JournalEditPage(
            'Gratitude',
            'Save',
            originalIndex,
            toperform: _setValueFromDB(),
          ));
    }
  }

  _searchByDate() async {
    if (widget.pageToList == 'Personal') {
      _selectedDate = await showPickerDate(context);
      if (_selectedDate != null) {
        setState(() {
          _searchResuls = searchJournalsByDate(
              _selectedDate!, allValueInPersonalJournalsDB);
        });
      }
    }
    if (widget.pageToList == 'Gratitude') {
      _selectedDate = await showPickerDate(context);
      if (_selectedDate != null) {
        setState(() {
          _searchResuls = searchJournalsByDate(
              _selectedDate!, allValueInGratitudeJournalsDB);
        });
      }
    }
  }

  _serchByDateRange() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: cusText(
              content: 'Set Range',
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    _startingDate = await showPickerDate(context);
                  },
                  child: Text('Starting')),
              TextButton(
                  onPressed: () async {
                    _endingDate = await showPickerDate(context);
                  },
                  child: Text('Ending')),
              TextButton(
                  onPressed: () {
                    if (_startingDate != null && _endingDate != null) {
                      navigateTo(context: context, goLike: 'pop');
                      _searchByRange(_startingDate!, _endingDate!);
                    }
                  },
                  child: Text('Search')),
            ],
          );
        });
  }

  _searchByRange(DateTime startDate, DateTime endDate) {
    if (widget.pageToList == 'Personal') {
      setState(() {
        _searchResuls =
            searchBydateRange(personalJournalBox, _startingDate!, _endingDate!);
      });
    }
    if (widget.pageToList == 'Gratitude') {
      setState(() {
        _searchResuls = searchBydateRange(
            gratitudeJournalBox, _startingDate!, _endingDate!);
      });
    }
  }

  _serchByTitle(String searchFor) {
    if (widget.pageToList == 'Personal') {
      setState(() {
        _searchResuls = searchByTitle(allValueInPersonalJournalsDB, searchFor);
      });
    }
    if (widget.pageToList == 'Gratitude') {
      setState(() {
        _searchResuls = searchByTitle(allValueInGratitudeJournalsDB, searchFor);
      });
    }
  }

  @override
  void initState() {
    if (widget.pageToList == 'Personal') {
      _searchResuls = getAllValueFromPersonalJournal();
    }
    if (widget.pageToList == 'Gratitude') {
      _searchResuls = getAllValueFromGratutudeJournal();
    }
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
                            hapticFeedback('s');
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
                            PLANWORK_BUTTON_WIDTH!,
                            PLANWORK_BUTTON_HEIGHT!,
                            SECONDARY_COLOR,
                            PRIMARY_COLOR,
                            'Date',
                            SETDAY_BUTTON_FONTSIZE!,
                            true,
                            toPerform: () {
                              _searchByDate();
                            },
                          ),
                          CustomisableButton(
                            PLANWORK_BUTTON_WIDTH!,
                            PLANWORK_BUTTON_HEIGHT!,
                            SECONDARY_COLOR,
                            PRIMARY_COLOR,
                            'Range',
                            SETDAY_BUTTON_FONTSIZE!,
                            true,
                            toPerform: _serchByDateRange,
                          ),
                        ],
                      ),
                      TextFieldBorder(
                        _searchTitleController,
                        onchangeof: _serchByTitle,
                      )
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
                                              hapticFeedback('l');
                                              Navigator.pop(context);
                                              _editJounal(index);
                                            },
                                            child: Text('Edit')),
                                        TextButton(
                                            onPressed: () {
                                              hapticFeedback('s');
                                              Navigator.pop(context);
                                              _deleteJournal(index);
                                            },
                                            child: Text('Delete'))
                                      ],
                                    );
                                  });
                            },
                            child: widget.pageToList == 'Personal'
                                ? JournalListItem(
                                    jorns.day,
                                    jorns.month,
                                    jorns.year,
                                    jorns.content,
                                    jorns.title,
                                    'Personal',
                                    false,
                                    jorns.edited)
                                : JournalListItem(
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
          hapticFeedback('s');
          navigateTo(
              context: context,
              goLike: 'pushReplacement',
              goPage: widget.pageToList == 'Personal'? JournalAddPage('Personal', 'SAVE'):JournalAddPage('Gratitude', 'SAVE')); 
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
