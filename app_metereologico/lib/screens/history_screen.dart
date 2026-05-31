import 'package:flutter/material.dart';

import '../services/history_service.dart';

class HistoryScreen
    extends StatelessWidget {

  const HistoryScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
            const Text(
          'Histórico',
        ),
      ),

      body: FutureBuilder(

        future:
            HistoryService()
                .getHistory(),

        builder:
            (context, snapshot) {

          if (!snapshot.hasData) {

            return const Center(
              child:
                  CircularProgressIndicator(),
            );
          }

          final history =
              snapshot.data!;

          return ListView.builder(

            itemCount:
                history.length,

            itemBuilder:
                (context, index) {

              final item =
                  history[index];

              return ListTile(

                leading:
                    const Icon(
                  Icons.cloud,
                ),

                title:
                    Text(
                  item['city'],
                ),

                subtitle:
                    Text(
                  item[
                      'weather_condition'],
                ),
              );
            },
          );
        },
      ),
    );
  }
}