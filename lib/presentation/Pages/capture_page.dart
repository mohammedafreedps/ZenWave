import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zenwave/business/services/hapticfeedback.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/captureMoments/capture_moments.dart';
import 'package:zenwave/data/DBFunction/capture_moments.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Pages/capture_add_page.dart';
import 'package:zenwave/presentation/Pages/capture_edit_page.dart';
import 'package:zenwave/presentation/Pages/capture_view_page.dart';
import 'package:zenwave/presentation/Widgets/capture_card.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({super.key});

  @override
  State<CapturePage> createState() => _CapturePageState();
}

TextEditingController _serchCapture = TextEditingController();
List _searchResuls = [];
DateTime? _selectedDate;
DateTime? _startingDate;
DateTime? _endingDate;

class _CapturePageState extends State<CapturePage> {
  @override
  void didChangeDependencies() {
    screenHeightInitializing(context);
    super.didChangeDependencies();
  }

  _serchByTitle(String searchFor) {
    setState(() {
      _searchResuls = allValueInCaptureMomentsInDB
          .where((capture) =>
              capture.title.toLowerCase().startsWith(searchFor.toLowerCase()))
          .toList();
    });
  }

  _searchByRangeList(DateTime startDate, DateTime endDate) {
    List updatedResults = [];

    for (var i = 0; i < allValueInCaptureMomentsInDB.length; i++) {
      captureMoments entry = captureMomentsBox.getAt(i);
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

  _serchByDateRangeCalender() {
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
                      _searchByRangeList(_startingDate!, _endingDate!);
                    }
                  },
                  child: Text('Search')),
            ],
          );
        });
  }

  _searchByDate(DateTime searchDate) {
    int _searchDay = searchDate.day;
    int _searchMonth = searchDate.month;
    int _searchYear = searchDate.year;
    _searchResuls = allValueInCaptureMomentsInDB.where((capture) {
      return capture.day == _searchDay &&
          capture.month == _searchMonth &&
          capture.year == _searchYear;
    }).toList();
  }

  _serchByDateCalender() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2040))
        .then((value) {
      setState(() {
        _selectedDate = value;
        if (_selectedDate != null) {
          _searchByDate(_selectedDate!);
        }
      });
    });
  }

  _refreshValueList() {
    setState(() {
      _searchResuls = allValueInCaptureMomentsInDB;
    });
  }

  @override
  void initState() {
    allValueInCaptureMomentsInDB = getAllValueFromCaptureMomentsDB();
    _searchResuls = allValueInCaptureMomentsInDB;
    super.initState();
  }

  _deleteLocalPicture(String imagePath, int index) async {
    final File _imageFile = File(imagePath);
    if (_imageFile.existsSync()) {
      await _imageFile.delete();
      setState(() {
        deleValueInCaptureMomentsDB(index);
        allValueInCaptureMomentsInDB = getAllValueFromCaptureMomentsDB();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _refreshValue() {
      setState(() {
        allValueInCaptureMomentsInDB = getAllValueFromCaptureMomentsDB();
        Navigator.pop(context);
        print('refresh called');
      });
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: BASE_COLOR,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: SCREEN_WIDTH,
          height: SCREEN_HEIGHT,
          color: BASE_COLOR,
          child: Padding(
            padding: const EdgeInsets.all(PAGE_PADDING),
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
                          _refreshValueList();
                        },
                        icon: Icon(Icons.refresh))
                  ],
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
                      toPerform: _serchByDateCalender,
                    ),
                    CustomisableButton(
                      120,
                      70,
                      SECONDARY_COLOR,
                      PRIMARY_COLOR,
                      'Range',
                      20,
                      true,
                      toPerform: _serchByDateRangeCalender,
                    ),
                  ],
                ),
                TextFieldBorder(_serchCapture, onchangeof: _serchByTitle),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: SCREEN_HEIGHT - 300,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _searchResuls.length,
                    itemBuilder: (BuildContext context, int index) {
                      final _giver = _searchResuls[index];
                      print('imgpatj' + _giver.imgPath);
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return CaptureViewPage(
                                _giver.imgPath,
                                _giver.title,
                                _giver.content,
                                _giver.day,
                                _giver.month,
                                _giver.year);
                          }));
                        },
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Do you want to'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          final captureJournal =
                                              _searchResuls[index];
                                          int originalIndex =
                                              allValueInCaptureMomentsInDB
                                                  .indexOf(captureJournal);
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          CaptureEditPage(
                                                              originalIndex,
                                                              _refreshValue)));
                                        },
                                        child: Text("Edit")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _deleteLocalPicture(
                                              _giver.imgPath, index);
                                        },
                                        child: Text("Delete")),
                                  ],
                                );
                              });
                        },
                        child: CaptureCard(_giver.imgPath, _giver.title,
                            _giver.day, _giver.month, _giver.year),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: Elevetion,
        backgroundColor: SECONDARY_COLOR,
        onPressed: () {
          hapticFeedback('m');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (BuildContext context) {
              return CaptureAddPage();
            }),
          );
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
