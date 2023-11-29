import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zenwave/business/services/hapticfeedback.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DBFunction/capture_moments.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/values.dart';
import 'package:zenwave/presentation/Consts/get_path.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';
import 'dart:io';

class CaptureEditPage extends StatefulWidget {
  final int index;
  final Function toPerform;
  CaptureEditPage(this.index, this.toPerform);

  @override
  State<CaptureEditPage> createState() => _CaptureEditPageState();
}

class _CaptureEditPageState extends State<CaptureEditPage> {
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  DateTime? _selectedDate;
  String? _imgPath;
  String? _oldImagePath;
  XFile? _pickedFile;
  @override
  void initState() {
    final _giver = allValueInCaptureMomentsInDB[widget.index];
    _title.text = _giver.title;
    _description.text = _giver.content;
    _imgPath = _giver.imgPath;
    _oldImagePath = _giver.imgPath;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _showDatePicker() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2040))
          .then((value) {
        _selectedDate = value;
      });
    }

    Future<void> _pickImage(ImageSource source) async {
      final ImagePicker picker = ImagePicker();
      _pickedFile = await picker.pickImage(source: source);

      if (_pickedFile != null) {
        setState(() {
          _imgPath = _pickedFile!.path;
        });
      }
    }

    Future<bool> _deleteLocalPicture(String imagePath) async {
      bool flag = false;
      final File _imageFile = File(imagePath);
      if (_imageFile.existsSync()) {
        await _imageFile.delete();
        if (!_imageFile.existsSync()) {
          flag = true;
        }
        allValueInCaptureMomentsInDB = getAllValueFromCaptureMomentsDB();
      } else {
      }
      return flag;
    }

    Future<bool> _editImageLocally() async {
      bool flag = false;
      if (_pickedFile != null) {
        final _giver = captureMomentsBox.getAt(widget.index);

        if (_giver != null) {
          if (await _deleteLocalPicture(_oldImagePath!)) {
            final imageDirectoryPath = await getAppImageDirectoryPath();
            final File imageFile = File(_pickedFile!.path);
            final String newImagePath =
                '$imageDirectoryPath/${DateTime.now().millisecondsSinceEpoch}.jpg';
            await imageFile.copy(newImagePath);

            editValuesInCaptureMomentsDB(
                widget.index,
                _title.text,
                _description.text,
                _selectedDate!.day,
                _selectedDate!.month,
                _selectedDate!.year,
                true,
                newImagePath);

            flag = true;
          } else {
            flag = false;
          }
        } else {
        }
      }
      return flag;
    }

    _editWithoutImage() async {
      final _giver = await captureMomentsBox.getAt(widget.index);
      editValuesInCaptureMomentsDB(
          widget.index,
          _title.text,
          _description.text,
          _selectedDate!.day,
          _selectedDate!.month,
          _selectedDate!.year,
          true,
          _giver.imgPath);
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: BASE_COLOR,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: SCREEN_WIDTH,
          height: SCREEN_HEIGHT,
          color: BASE_COLOR,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                _imgPath != null && File(_imgPath!).existsSync()
                    ? SizedBox(width: 230, child: Image.file(File(_imgPath!)))
                    : Text('Selected Image'),
                Padding(
                  padding: const EdgeInsets.all(PAGE_PADDING),
                  child: Center(
                    child: PhysicalModel(
                      color: Colors.grey,
                      elevation: Elevetion,
                      borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(CLIP_BORDER_RADIOUS),
                        child: Container(
                          width: SCREEN_WIDTH,
                          padding: EdgeInsets.all(PAGE_PADDING),
                          height: SCREEN_HEIGHT - 500,
                          color: SECONDARY_COLOR,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomisableButton(
                                160,
                                60,
                                BASE_COLOR,
                                PRIMARY_COLOR,
                                'Select Date',
                                20,
                                true,
                                toPerform: _showDatePicker,
                              ),
                              CustomisableButton(
                                160,
                                60,
                                BASE_COLOR,
                                PRIMARY_COLOR,
                                'Select Picture',
                                20,
                                true,
                                toPerform: () {
                                  _pickImage(ImageSource.gallery);
                                },
                              ),
                              Text('Title'),
                              TextFieldBorder(_title),
                              Text('Description'),
                              TextFieldBorder(_description),
                              CustomisableButton(
                                  160,
                                  60,
                                  BASE_COLOR,
                                  PRIMARY_COLOR,
                                  'Save',
                                  20,
                                  true, toPerform: () async {
                                if (_selectedDate == null) {
                                  _selectedDate = DateTime.now();
                                }
                                if (_description.text.isNotEmpty &&
                                    _title.text.isNotEmpty) {
                                  if (_pickedFile == null) {
                                    if (_selectedDate != null) {
                                      _editWithoutImage();
                                      Navigator.pop(context);
                                    }
                                  }
                                  if (_pickedFile != null) {
                                    if (await _editImageLocally()) {
                                      hapticFeedback('s');
                                      widget.toPerform();
                                      Navigator.pop(context);
                                    }
                                  }
                                }
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
