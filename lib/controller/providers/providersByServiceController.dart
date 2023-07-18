import 'package:ecommerce_store/core/class/statusRequest.dart';
import 'package:ecommerce_store/core/functions/handingDataController.dart';
import 'package:ecommerce_store/data/remote/providers/providersByServiceViewData.dart';
import 'package:get/get.dart';

import '../../core/constant/consRoutes.dart';
import '../../core/services/services.dart';
import '../../data/model/providerModel.dart';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

abstract class ProviderByServiceController extends GetxController {
  void initData();
  void getData(String serid);
  void goToProviderDetails(
      ProviderModel providerModel, String serviceName, String serviceNameAr);
  changeSortingCriteria(SortingCriteria criteria);
}

enum SortingCriteria {
  distanceOnly,
  ratingOnly,
  distanceThenRating,
  ratingThenDistance,
}

class ProviderByServiceControllerImp extends ProviderByServiceController {
  ProvidersByServiceViewData providersByServiceViewData =
      ProvidersByServiceViewData(Get.find());
  MyServices myServices = Get.find();
  late String mode;

  late StatusRequest statusRequest = StatusRequest.loading;
  List<ProviderModel> providersList = [];
  late String serid;
  late String serviceName;
  late String serviceNameAr;
  late ProviderModel providerModel;
  double customerLatitude = 0.0;
  double customerLongitude = 0.0;

  SortingCriteria sortingCriteria = SortingCriteria.ratingOnly;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void initData() async {
    mode = myServices.sharedPreferences.get('mode').toString();
    if (mode != "" || mode != "guestMode") {
      serid = Get.arguments['serviceID'];
      serviceName = Get.arguments['serviceName'];
      serviceNameAr = Get.arguments['serviceNameAr'];

      await getCurrentLocation();
      getData(serid);
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      customerLatitude = position.latitude;
      customerLongitude = position.longitude;
    } catch (e) {
      // Handle error in retrieving location
    }
  }

  @override
  void getData(serid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await providersByServiceViewData.getProvidersByServiceListData(serid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        final List<dynamic> data = response['data'];

        providersList = data
            .map((providerData) => ProviderModel.fromJson(providerData))
            .toList();

        providersList.forEach((provider) {
          double distance = calculateDistance(
            customerLatitude,
            customerLongitude,
            double.parse(provider.providerlatitude ?? '0.0'),
            double.parse(provider.providerlongitude ?? '0.0'),
          );
          provider.distance = distance.toStringAsFixed(2);
          print(
              "the provider name : ${provider.providername} \n the distance : ${provider.distance} \n the rating : ${provider.providerrating} \n the bio : ${provider.providerbio}");
        });

        switch (sortingCriteria) {
          case SortingCriteria.distanceOnly:
            /*providersList.removeWhere(
                (provider) => double.parse(provider.distance!) <= 0);*/ // remove those who have distance 0
            providersList.sort((a, b) =>
                double.parse(a.distance!).compareTo(double.parse(b.distance!)));
            break;
          case SortingCriteria.ratingOnly:
            /*providersList.removeWhere(
                (provider) => double.parse(provider.providerrating!) < 3.5);*/ // remove those who have rate < 3.5
            providersList.sort((a, b) => double.parse(b.providerrating!)
                .compareTo(double.parse(a.providerrating!)));
            break;

          case SortingCriteria.distanceThenRating:
            providersList.removeWhere(
                (provider) => double.parse(provider.distance!) <= 0);
            providersList.sort((a, b) {
              if (double.parse(a.distance!) != double.parse(b.distance!)) {
                return double.parse(a.distance!)
                    .compareTo(double.parse(b.distance!));
              } else {
                return double.parse(a.providerrating!)
                    .compareTo(double.parse(b.providerrating!));
              }
            });
            break;
          case SortingCriteria.ratingThenDistance:
            providersList.sort((a, b) {
              if (double.parse(a.providerrating!) !=
                  double.parse(b.providerrating!)) {
                return double.parse(a.providerrating!)
                    .compareTo(double.parse(b.providerrating!));
              } else {
                return double.parse(a.distance!)
                    .compareTo(double.parse(b.distance!));
              }
            });
            break;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  double calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    final Distance distance = Distance();
    final LatLng startLatLng = LatLng(startLatitude, startLongitude);
    final LatLng endLatLng = LatLng(endLatitude, endLongitude);
    return distance.as(LengthUnit.Kilometer, startLatLng, endLatLng);
  }

  @override
  void goToProviderDetails(providerModel, serviceName, serviceNameAr) {
    Get.toNamed(ConsRoutes.providerDetailView, arguments: {
      "provider_model": providerModel,
      "serviceName": serviceName,
      "serviceNameAr": serviceNameAr,
      "serviceId": serid
    });
  }

  @override
  void changeSortingCriteria(SortingCriteria criteria) {
    sortingCriteria = criteria;
    getData(serid);
  }
}






/*
remove provider with distance null

 providersList.removeWhere((provider) =>
            provider.distance == null); // Remove providers with distance null

        providersList.sort((a, b) {
          // Sort providers by distance
          return double.parse(a.distance!).compareTo(double.parse(b.distance!));
        });
*/



/* 
after calculating the distance for each provider, we check if the provider's rating meets 
the desired criteria (4 or above in this example). If the rating is satisfactory,
 we keep the distance value; otherwise, we set it to null to exclude the provider from sorting based on distance.

The providersList is then sorted first by distance (if available) and, 
in case of a tie or if the distance is not available, by provider name.





  @override
  void getData(serid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await providersByServiceViewData.getProvidersByServiceListData(serid);
    statusRequest = handingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        final List<dynamic> data = response['data'];

        providersList = data
            .map((providerData) => ProviderModel.fromJson(providerData))
            .toList();

        providersList.forEach((provider) {
          double distance = calculateDistance(
            customerLatitude,
            customerLongitude,
            double.parse(provider.providerlatitude ?? '0.0'),
            double.parse(provider.providerlongitude ?? '0.0'),
          );
          provider.distance = distance.toStringAsFixed(2);

          // Apply rating criteria (example: 4 or above)
          if (provider.providerrating != null &&
              double.parse(provider.providerrating!) >= 3.5) {
            provider.distance = distance.toStringAsFixed(2);
          } else {
            provider.distance = null; // Exclude providers with lower ratings
          }

          print(
              "the provider name : ${provider.providername} \n the distance : ${provider.distance} \n the rating : ${provider.providerrating}");
        });

        providersList.sort((a, b) {
          // Sort providers by distance if available, else fallback to name comparison
          if (a.distance != null && b.distance != null) {
            return double.parse(a.distance!)
                .compareTo(double.parse(b.distance!));
          } else {
            return a.providername!.compareTo(b.providername!);
          }
        });

        print("final list : $providersList");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }*/