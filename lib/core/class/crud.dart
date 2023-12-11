import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:classRanker/core/class/statusRequest.dart';
import 'package:classRanker/core/functions/checkInternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      try {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } catch (e) {
        // Handle specific exceptions or log the error for debugging
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return left(StatusRequest.offlinefailure);
    }
  }
}
