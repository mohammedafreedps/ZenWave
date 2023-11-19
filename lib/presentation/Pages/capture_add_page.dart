import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zenwave/data/DBFunction/capture_moments.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/values.dart';
import 'package:zenwave/presentation/Consts/get_path.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';
import 'package:zenwave/presentation/Widgets/textfield_border.dart';
import 'dart:io';

class CaptureAddPage extends StatefulWidget {
  const CaptureAddPage({super.key});

  @override
  State<CaptureAddPage> createState() => _CaptureAddPageState();
}

class _CaptureAddPageState extends State<CaptureAddPage> {
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  DateTime? _selectedDate;
  String? _imgPath;
  XFile? _pickedFile;

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

    Future<bool> _saveImageLocally() async {
      if (_pickedFile != null) {
        final imageDirectoryPath = await getAppImageDirectoryPath();
        final File imageFile = File(_pickedFile!.path);

        // Save the picked image to the "images" directory
        final String newImagePath =
            '$imageDirectoryPath/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await imageFile.copy(newImagePath);

        addValueToCaptureMomentsDB(
            _title.text,
            _description.text,
            _selectedDate!.day,
            _selectedDate!.month,
            _selectedDate!.year,
            false,
            newImagePath);
        return true;
      } else {
        return false;
      }
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
                _imgPath != null
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
                                    _title.text.isNotEmpty &&
                                    _selectedDate != null &&
                                    _imgPath != null) {
                                  if (await _saveImageLocally()) {
                                    Navigator.pop(context);
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
