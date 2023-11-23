
import 'package:flutter/material.dart';
import 'package:zenwave/business/services/hapticfeedback.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Consts/values.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DB/journals/gratitudeJournal.dart';
import 'package:zenwave/data/DB/journals/personalJournal.dart';
import 'package:zenwave/presentation/Widgets/customisable_button.dart';

class EntryviewPage extends StatefulWidget {
  // const EntryviewPage({super.key});
  final String _content;
  final String title;
  final bool needRestorButton;
  final bool isEdited;
  final int? index;
  final Function? forRefrsh;

  EntryviewPage(this._content,this.title, this.needRestorButton,this.isEdited,
      {this.index, this.forRefrsh});

  @override
  State<EntryviewPage> createState() => _EntryviewPageState();
}

class _EntryviewPageState extends State<EntryviewPage> {
  @override
  Widget build(BuildContext context) {
    Resoter() {
      hapticFeedback('s');
      if (widget.index != null) {
        final _give = deletedJournalBox.getAt(widget.index!);
        if (_give.fromWhere == 'Personal') {
          final _giver = personalJournal(
              _give.title,_give.content, _give.day, _give.month, _give.year,_give.edited);
          personalJournalBox.put(DateTime.now().toString(), _giver);
          deletedJournalBox.deleteAt(widget.index!);
          widget.forRefrsh!();
        }
        if (_give.fromWhere == 'Gratitude') {
          final _giver = gratutudeJournal(
              _give.title,_give.content, _give.day, _give.month, _give.year,_give.edited);
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
        width: SCREEN_WIDTH,
        height: SCREEN_HEIGHT,
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
                    children: [
                      Row(
                        children: [
                          widget.isEdited == true ? Text('Edited',style: TextStyle(color: Colors.red),) : Text('')
                        ],
                      ),
                      SizedBox(height: 40,),
                      Text(widget.title),
                      SizedBox(height: 70,),
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
