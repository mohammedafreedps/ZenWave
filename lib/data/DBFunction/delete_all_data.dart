
import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/delete_all_journals.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/business/services/hapticfeedback.dart';
import 'package:zenwave/data/DB/boxes.dart';
import 'package:zenwave/data/DBFunction/capture_moments.dart';
import 'package:zenwave/data/DBFunction/deleted_journals.dart';
import 'package:zenwave/data/DBFunction/future_Tasks.dart';
import 'package:zenwave/data/DBFunction/gratitude_journal.dart';
import 'package:zenwave/data/DBFunction/personal_journal.dart';

clearAllDataFromDB(BuildContext context) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to delete all Data'),
          content: Text('It will delete all datas in PersonalJournal,Gratitude Journal,Capture,Grpah and Deleted Jouranl'),
          actions: [
            TextButton(
                onPressed: () async {
                  navigateTo(context: context, goLike: 'pop');
                  deleteAllValueInJournalEtherate(allValueInPersonalJournalsDB, personalJournalBox);
                  deleteAllValueInJournalEtherate(allValueInGratitudeJournalsDB, gratitudeJournalBox);
                  deleteAllValueInJournalEtherate(allValueInDeletedJournalDB, deletedJournalBox);
                  deleteAllValueInJournalEtherate(allValueInCaptureMomentsInDB, captureMomentsBox);
                  deleteAllValueInJournalEtherate(allValueInFutureTaskDB, futureTaskBox);
                  hapticFeedback('s');
                },
                child: Text('Yes')),
            TextButton(onPressed: (){
              hapticFeedback('m');
              navigateTo(context: context, goLike: 'pop');
            }, child: Text('No'))
          ],
        );
      });
}
