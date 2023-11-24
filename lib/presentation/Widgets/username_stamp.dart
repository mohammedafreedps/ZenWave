
import 'package:flutter/material.dart';
import 'package:zenwave/business/Functions/navigate_page.dart';
import 'package:zenwave/business/Functions/screen_media_query.dart';
import 'package:zenwave/business/services/hapticfeedback.dart';
import 'package:zenwave/presentation/Consts/color.dart';
import 'package:zenwave/presentation/Consts/Values.dart';
import 'package:zenwave/presentation/Consts/screen_size.dart';
import 'package:zenwave/presentation/Widgets/logo.dart';


class UsernmaeStamp extends StatefulWidget {
  // const UsernmaeStamp({super.key});
  

  final String _Title;
  final Widget PreferencePage;
  final double height;
  final double width;
  UsernmaeStamp(this._Title,this.PreferencePage,this.height,this.width);

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
              width: widget.width,
              height: widget.height,
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
                    style: TextStyle(fontSize: HOME_BUTTONS_FONTSIZE!, color: PRIMARY_COLOR,overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    width: SCREEN_WIDTH * 0.09,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
