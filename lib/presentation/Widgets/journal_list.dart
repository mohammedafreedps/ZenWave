import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/values.dart';
import 'package:zenwave/presentation/Pages/entry_view_page.dart';
import 'package:zenwave/presentation/Widgets/divider.dart';

class JournalListItem extends StatelessWidget {
  // const JournalListItem ({super.key});

  final int day;
  final int month;
  final int year;
  final String content;
  final String title;
  final String currently;
  final bool enableRestoreButton;
  final bool isEdited;
  final int? index;
  final Function? passingForRefresh;

  JournalListItem (this.day,this.month,this.year, this.content,this.title,this.currently,this.enableRestoreButton,this.isEdited,{this.index,this.passingForRefresh});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return EntryviewPage(content,title,enableRestoreButton,isEdited,index: index,forRefrsh: passingForRefresh,);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: PhysicalModel(
          color: SECONDARY_COLOR,
          borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
          elevation: Elevetion,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
            child: SizedBox(
              height: 100,
              child: Container(
                width: double.infinity,
                height: 10,
                color: SECONDARY_COLOR,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currently,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 100, child: Dividers()),
                      Text(day.toString()+'-'+month.toString()+'-'+year.toString())
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
