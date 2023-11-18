import 'dart:io';
import 'package:flutter/material.dart';
import 'package:zenwave/data/DBFunction/captureMoments.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Pages/capture_add_page.dart';
import 'package:zenwave/presentation/Pages/capture_edit_page.dart';
import 'package:zenwave/presentation/Pages/capture_view_page.dart';
import 'package:zenwave/presentation/Widgets/capture_card.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({super.key});

  @override
  State<CapturePage> createState() => _CapturePageState();
}

TextEditingController _serchCapture = TextEditingController();

class _CapturePageState extends State<CapturePage> {
  @override
  void didChangeDependencies() {
    screenHeightInitializing(context);
    super.didChangeDependencies();
  }


  @override
  void initState() {
    allValueInCaptureMomentsInDB = getAllValueFromCaptureMomentsDB();
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
    _refreshValue(){
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
                TextFieldBorder(_serchCapture),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: SCREEN_HEIGHT - 200,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: allValueInCaptureMomentsInDB.length,
                    itemBuilder: (BuildContext context, int index) {
                      final _giver = allValueInCaptureMomentsInDB[index];
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
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      CaptureEditPage(index,_refreshValue)));
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
        ),
      ),
    );
  }
}
