import 'package:workmanager/workmanager.dart';
import 'package:zenwave/DB/sharedPreference.dart';

// @pragma('vm:entry-point')
// resetIsRated(){
//   Workmanager().executeTask((taskName, inputData) {
//     saveIsRated(false);
//     return Future.value(true);
//   });
// }
@pragma('vm:entry-point')
void resetIsRated() {
  Workmanager().executeTask((task, inputData) {


    try { //add code execution
    saveIsRated(false);
    } catch(err) {
      // Logger().e(err.toString()); // Logger flutter package, prints error on the debug console
      throw Exception(err);
    }

    return Future.value(true);
  });
}