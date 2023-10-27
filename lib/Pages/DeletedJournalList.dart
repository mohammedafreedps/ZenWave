import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Model/Models.dart';
import 'package:zenwave/Widgets/JournalListItem.dart';

class DeletedJournalList extends StatefulWidget {
  const DeletedJournalList({super.key});

  @override
  State<DeletedJournalList> createState() => _DeletedJournalListState();
}

class _DeletedJournalListState extends State<DeletedJournalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: baseColor, iconTheme: IconThemeData(color: Colors.black), elevation: 0,),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: baseColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: PagePadding),
          child: ListView.builder(
            itemCount: JournalEntry.length,
            itemBuilder: (BuildContext context, int index){
              final jorns = JournalEntry[index];
            return journalListItem(jorns.date,jorns.content,'Gratitude',true);
          }),
        )
      ),
      
    );
  }
}