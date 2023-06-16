import 'package:ecommerce_store/data/model/propertiesModels.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class PropertiesDetailsController extends GetxController {
  getData();
  getPosition();
  getLocation();
  getInfos();
  mapAffiche(double lati, double longi);
}

class PropertiesDetailsControllerImp extends PropertiesDetailsController {
  late PropertiesModel propertiesModel;
  String? localizationState;
  bool services = false;
  late LocationPermission per;
  Position? cl;
  double? lat, long;

  CameraPosition? kGooglePlex;

  @override
  getData() {
    propertiesModel = Get.arguments['propertiesmodel'];
  }

  @override
  void onInit() {
    getData();
    getPosition();

    //getLocation();
    super.onInit();
  }

  @override
  Future getPosition() async {
    services = await Geolocator.isLocationServiceEnabled();
    per = await Geolocator.checkPermission();

    if (per == LocationPermission.denied) {
      Geolocator.requestPermission();
    }

    if (per == LocationPermission.whileInUse) {
      cl = await getLocation();
      lat = cl!.latitude;
      long = cl!.longitude;
    }
    update();
    mapAffiche(lat!, long!);
  }

  @override
  Future<Position> getLocation() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  @override
  getInfos() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(cl!.latitude, cl!.longitude);
    //////print("object");
    ////print(placemarks[0]);
  }

  @override
  mapAffiche(lati, longi) {
    ////print("latitude :  ${lati}");

    kGooglePlex = CameraPosition(
      target: LatLng(lati, longi),
      zoom: 14.4746,
    );
    update();
  }
}



// AIzaSyCe-zy0HT4K658nOUPcFf6Vy7tSrMB5ODQ