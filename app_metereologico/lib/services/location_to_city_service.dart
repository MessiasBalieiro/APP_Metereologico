import 'package:geocoding/geocoding.dart';

class LocationToCityService {

  Future<String>
      getCityName(
          double lat,
          double lon) async {

    final places =
        await placemarkFromCoordinates(
      lat,
      lon,
    );

    if (places.isEmpty) {
      return '';
    }

    return places.first.locality ??
        '';
  }
}