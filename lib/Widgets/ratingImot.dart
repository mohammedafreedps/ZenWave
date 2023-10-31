import 'package:flutter/material.dart';
import 'package:zenwave/Consts/Color.dart';
import 'package:zenwave/Consts/Values.dart';

class RatingImot extends StatelessWidget {
  // const RatingImot({super.key});

  final String imgPath;
  final Function SaveMood;
  RatingImot(this.imgPath,this.SaveMood);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('save mood inside arrie');
        SaveMood();
      },
      child: Container(
          width: 70,
          child:Column(
            children: [
              PhysicalModel(
                color: primaryColor,
                elevation: Elevetion,
                borderRadius: BorderRadius.circular(clipBorderRadious),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(clipBorderRadious),
                  child: Container(
                    color: primaryColor,
                    child: Image.asset(imgPath)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 1,
                height: 160,
                color: Colors.grey,
              ),
            ],
          )
           ),
    );
  }
}
