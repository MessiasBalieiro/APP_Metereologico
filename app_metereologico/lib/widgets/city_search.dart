import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';

class CitySearch
    extends StatefulWidget {

  const CitySearch({
    super.key,
  });

  @override
  State<CitySearch>
      createState() =>
          _CitySearchState();
}

class _CitySearchState
    extends State<CitySearch> {

  final controller =
      TextEditingController();

  @override
  Widget build(
      BuildContext context) {

    return Row(

      children: [

        Expanded(

          child: TextField(

            controller:
                controller,

            decoration:
                const InputDecoration(
              labelText:
                  'Cidade',
            ),
          ),
        ),

        const SizedBox(
          width: 10,
        ),

        ElevatedButton(

          onPressed: () {

            context
                .read<
                    WeatherProvider>()
                .searchCity(
                  controller.text,
                );
          },

          child:
              const Text(
            'Buscar',
          ),
        ),
      ],
    );
  }
}