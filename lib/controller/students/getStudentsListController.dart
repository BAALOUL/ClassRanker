import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/data/remote/students/getStudentsListData.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../core/functions/handingDataController.dart';
import '../../data/model/newModel.dart';

abstract class GetStudentsListController extends GetxController {
  initData();
  getData(String page);
}

class GetStudentsListControllerImp extends GetStudentsListController {
  GetStudentsListData getStudentsListData = GetStudentsListData(Get.find());

  late StatusRequest statusRequest;
  List<UserData> usersList = [];
  late String page;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    page = "2";
    getData(page);
  }

  @override
  getData(String page) async {
    statusRequest = StatusRequest.loading;
    // Clear the previous data
    usersList.clear();
    update();

    final url = Uri.parse('https://reqres.in/api/users?page=$page');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        final data = json.decode(response.body);

        if (data['data'] != null) {
          statusRequest = StatusRequest.success;

          final List<dynamic> userList = data['data'];
          usersList =
              userList.map((userData) => UserData.fromJson(userData)).toList();
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        // If the server did not return a 200 OK response, set failure status
        statusRequest = StatusRequest.failure;
      }
    } catch (error) {
      // Handle any exceptions
      print("Error: $error");
      statusRequest = StatusRequest.failure;
    }

    update();
  }
}
