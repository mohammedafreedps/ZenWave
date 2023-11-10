
import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/Color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/data/DB/Boxes.dart';
import 'package:zenwave/data/DB/journals/gratitudeJournal.dart';
import 'package:zenwave/data/DB/journals/personalJournal.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';

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
        backgroundColor: BASE_COLOR,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: BASE_COLOR,
        child: Padding(
          padding: EdgeInsets.all(PAGE_PADDING),
          child: PhysicalModel(
            color: SECONDARY_COLOR,
            borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
            elevation: Elevetion,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
              child: Container(
                color: SECONDARY_COLOR,
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  padding: EdgeInsets.all(PAGE_PADDING),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget._content),
                      widget.needRestorButton
                          ? CustomisableButton(
                              190,
                              50,
                              PRIMARY_COLOR,
                              BASE_COLOR,
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
