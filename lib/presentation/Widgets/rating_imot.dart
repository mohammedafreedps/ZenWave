import 'package:flutter/material.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';

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
                color: PRIMARY_COLOR,
                elevation: Elevetion,
                borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
                  child: Container(
                    color: PRIMARY_COLOR,
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
