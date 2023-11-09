
import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/DB/Boxes.dart';
import 'package:zenwave/DB/journals/gratitudeJournal.dart';
import 'package:zenwave/DB/journals/personalJournal.dart';
import 'package:zenwave/Widgets/CutomisableButton.dart';

class EntryviewPage extends StatefulWidget {
  // const EntryviewPage({super.key});
  final String _content;
  final bool needRestorButton;
  final int? index;
  final Function? forRefrsh;

  EntryviewPage(this._content, this.needRestorButton,
      {this.index, this.forRefrsh});

  @override
  State<EntryviewPage> createState() => _EntryviewPageState();
}

class _EntryviewPageState extends State<EntryviewPage> {
  @override
  Widget build(BuildContext context) {
    Resoter() {
      if (widget.index != null) {
        final _give = deletedJournalBox.getAt(widget.index!);
        if (_give.fromWhere == 'Personal') {
          final _giver = personalJournal(
              _give.content, _give.day, _give.month, _give.year);
          personalJournalBox.put(DateTime.now().toString(), _giver);
          deletedJournalBox.deleteAt(widget.index!);
          widget.forRefrsh!();
        }
        if (_give.fromWhere == 'Gratitude') {
          final _giver = gratutudeJournal(
              _give.content, _give.day, _give.month, _give.year);
          gratitudeJournalBox.put(DateTime.now().toString(), _giver);
          deletedJournalBox.deleteAt(widget.index!);
          widget.forRefrsh!();
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: baseColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
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
                      widget.needRestorButton
                          ? CustomisableButton(
                              190,
                              50,
                              primaryColor,
                              baseColor,
                              'Restore',
                              25,
                              true,
                              HowToGO: 'pop',
                              toPerform: Resoter,
                            )
                          : Text('')
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
