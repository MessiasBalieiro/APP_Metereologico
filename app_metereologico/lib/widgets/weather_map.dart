import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class WeatherMap
    extends StatelessWidget {

  final String city;

  const WeatherMap({
    super.key,
    required this.city,
  });

  @override
  Widget build(
      BuildContext context) {

    return SizedBox(

      height: 350,

      child: FlutterMap(

        options: MapOptions(

          initialCenter:
              const LatLng(
            -23.5505,
            -46.6333,
          ),

          initialZoom: 8,
        ),

        children: [

          TileLayer(

            urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),

          MarkerLayer(

            markers: [

              Marker(

                point:
                    const LatLng(
                  -23.5505,
                  -46.6333,
                ),

                child:
                    const Icon(
                  Icons.location_pin,
                  size: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}