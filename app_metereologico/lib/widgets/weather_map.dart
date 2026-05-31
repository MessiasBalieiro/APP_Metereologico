import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class WeatherMap extends StatelessWidget {

  final double latitude;

  final double longitude;

  const WeatherMap({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(

      height: 350,

      child: FlutterMap(

        options: MapOptions(

          initialCenter: LatLng(
            latitude,
            longitude,
          ),

          initialZoom: 10,
        ),

        children: [

          TileLayer(

            urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',

            userAgentPackageName:
                'com.climabrasil.app',
          ),

          MarkerLayer(

            markers: [

              Marker(

                point: LatLng(
                  latitude,
                  longitude,
                ),

                width: 50,

                height: 50,

                child: const Icon(
                  Icons.location_on,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}