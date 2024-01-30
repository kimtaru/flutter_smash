import 'package:get/state_manager.dart';

class SampleController extends GetxController {
  RxString dateStr = "전체 날짜".obs;

  void setDateStr(newStr) {
    dateStr.value = newStr;
  }
}
