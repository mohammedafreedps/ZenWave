import 'package:flutter/material.dart';

navigateTo({required BuildContext context, required String goLike, Widget? goPage}) {
  switch (goLike) {
    case 'push':
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return goPage!;
      }));
      break;
    case 'pushReplacement':
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
      return goPage!;
     }));
     break;
     case 'pop':
     Navigator.pop(context);
     break;
    default:
  }
}
