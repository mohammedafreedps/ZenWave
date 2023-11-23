

List searchJournalsByDate(DateTime searchDate, List allJournals) {
  int _searchDay = searchDate.day;
  int _searchMonth = searchDate.month;
  int _searchYear = searchDate.year;

  return allJournals.where((journal) {
    return journal.day == _searchDay &&
        journal.month == _searchMonth &&
        journal.year == _searchYear;
  }).toList();
}
