import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Pages/EntryviewPage.dart';
import 'package:zenwave/Widgets/Dividers.dart';

class journalListItem extends StatelessWidget {
  // const journalListItem({super.key});

  final String date;
  final String content;
  final String currently;
  final bool enableRestoreButton;

  journalListItem(this.date, this.content,this.currently,this.enableRestoreButton);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return EntryviewPage(content,enableRestoreButton);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: PhysicalModel(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(clipBorderRadious),
          elevation: Elevetion,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(clipBorderRadious),
            child: SizedBox(
              height: 100,
              child: Container(
                width: double.infinity,
                height: 10,
                color: secondaryColor,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currently,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 100, child: Dividers()),
                      Text(date)
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
