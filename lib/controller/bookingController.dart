import 'package:classRanker/links.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class BookingController extends GetxController {}

class BookingControllerImp extends BookingController {
  late int docId;
//store booking details
  Future<dynamic> bookAppointment(
      String date, String day, String time, int docId, String token) async {
    try {
      var response = await Dio().post(Links.book,
          data: {'date': date, 'day': day, 'time': time, 'doctor_id': docId},
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      if (response.statusCode == 200 && response.data != '') {
        return response.statusCode;
      } else {
        return 'Error';
      }
    } catch (error) {
      return error;
    }
  }

  @override
  void onInit() {
    // Receive the arguments using Get.arguments
    final arguments = Get.arguments;
    docId = int.tryParse(arguments["doctor_id"]) ?? 0;

    super.onInit();
  }
}
