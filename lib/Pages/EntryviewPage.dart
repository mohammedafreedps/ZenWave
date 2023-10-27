import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';


class EntryviewPage extends StatefulWidget {
  // const EntryviewPage({super.key});
  String _content;
  bool needRestorButton;

  EntryviewPage(this._content,this.needRestorButton);

  @override
  State<EntryviewPage> createState() => _EntryviewPageState();
}

class _EntryviewPageState extends State<EntryviewPage> {
  @override
  Widget build(BuildContext context) {
    Resoter(){
      print('Deleted Retored');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: baseColor,
          child: Padding(
            padding: EdgeInsets.all(PagePadding),
            child: PhysicalModel(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(clipBorderRadious),
              elevation: Elevetion,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(clipBorderRadious),
                child: Container(
                  color: secondaryColor,
                  width: double.infinity,
                  height: double.infinity,
                  child: Container(
                    padding: EdgeInsets.all(PagePadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget._content),
                        widget.needRestorButton  ? CustomisableButton(190, 50, primaryColor, baseColor, 'Restore', 25, true,HowToGO: 'pop',toPerform: Resoter,): Text('')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}