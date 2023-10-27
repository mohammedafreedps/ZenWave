import 'package:flutter/material.dart';

GOto(context,Widget go){
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
    return go;
  }));
}