
import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/business/services/hapticfeedback.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Widgets/logo.dart';


class UsernmaeStamp extends StatefulWidget {
  // const UsernmaeStamp({super.key});
  

  final String _Title;
  final Widget PreferencePage;
  UsernmaeStamp(this._Title,this.PreferencePage);

  @override
  State<UsernmaeStamp> createState() => _UsernmaeStampState();
}

class _UsernmaeStampState extends State<UsernmaeStamp> {


  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: () {
          hapticFeedback('m');
          navigateTo(context: context, goLike: 'push', goPage: widget.PreferencePage);
        },
        child: PhysicalModel(
          color: SECONDARY_COLOR,
          elevation: Elevetion,
          borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(CLIP_BORDER_RADIOUS),
            child: Container(
              width: double.infinity,
              height: 105,
              color: SECONDARY_COLOR,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: LogoImage(80),
                  ),
                  Text(
                    widget._Title,
                    style: TextStyle(fontSize: 20, color: PRIMARY_COLOR),
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
