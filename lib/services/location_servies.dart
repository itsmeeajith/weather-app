import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServies {
  Future<Placemark?> geoLocationName(Position? position) async {
    if (position != null) {
      try {
        final placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        if (placemarks.isNotEmpty) {
          return placemarks[0];
        }
      } catch (e) {
        print('Error fetching Location name');
      }
      return null;
    }
  }
}
