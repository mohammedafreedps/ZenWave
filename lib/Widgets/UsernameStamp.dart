
import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';
import 'package:zenwave/Widgets/Logo.dart';


class UsernmaeStamp extends StatefulWidget {
  // const UsernmaeStamp({super.key});
  

  String _Title;
  Widget PreferencePage;
  UsernmaeStamp(this._Title,this.PreferencePage);

  @override
  State<UsernmaeStamp> createState() => _UsernmaeStampState();
}

class _UsernmaeStampState extends State<UsernmaeStamp> {


  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
            return widget.PreferencePage;
          }));
        },
        child: PhysicalModel(
          color: secondaryColor,
          elevation: Elevetion,
          borderRadius: BorderRadius.circular(clipBorderRadious),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(clipBorderRadious),
            child: Container(
              width: double.infinity,
              height: 105,
              color: secondaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: LogoImage(80),
                  ),
                  Text(
                    widget._Title,
                    style: TextStyle(fontSize: 20, color: primaryColor),
                  ),
                  SizedBox(
                    width: 100,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
