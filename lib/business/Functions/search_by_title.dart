List searchByTitle(List allJournals, String text){
  return allJournals.where((element){
    return element.title.toLowerCase().startsWith(text.toLowerCase());
  }).toList();
}