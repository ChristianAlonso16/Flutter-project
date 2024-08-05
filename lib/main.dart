import 'package:firstapp/global/data/repository/car_repository.dart';
import 'package:firstapp/global/presentation/screen/get_All_cars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => CarRepository(
            apiUrl: 'https://fohggt0wwd.execute-api.us-east-1.amazonaws.com/Prod/', accessToken: 'eyJraWQiOiI3cFNuZ3RJOXhcL0pCRlJjOWFGV2UwcTc2aFNJU09GWk5GMVg5QXdZVytJcz0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJlNGY4YjQyOC1hMGIxLTcwMjAtMDA0NC05NzEyMmYyM2VkMzMiLCJjb2duaXRvOmdyb3VwcyI6WyJDbGllbnRVc2VyR3JvdXAiXSwiZW1haWxfdmVyaWZpZWQiOnRydWUsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC51cy1lYXN0LTEuYW1hem9uYXdzLmNvbVwvdXMtZWFzdC0xX1pMOGhPNzVjeSIsImNvZ25pdG86dXNlcm5hbWUiOiJlNGY4YjQyOC1hMGIxLTcwMjAtMDA0NC05NzEyMmYyM2VkMzMiLCJvcmlnaW5fanRpIjoiMmM2ZGI0MDQtOTVmMC00OTc4LTg1NWYtMWEwYjYwYzBmM2JlIiwiYXVkIjoiNDI1MHNmaW5nNmYwdjI0czNvbGVsZ3JuZWMiLCJldmVudF9pZCI6IjQzYzQ4ZTU3LTViOWMtNDIyMC04ODljLTEwNGNiZjZkOWU4MiIsInRva2VuX3VzZSI6ImlkIiwiYXV0aF90aW1lIjoxNzIyNDc4Mjg2LCJleHAiOjE3MjI1NjQ2ODYsImlhdCI6MTcyMjQ3ODI4NiwianRpIjoiMWM4ODU5MTQtNjE4NC00ZDkwLTlmYWQtODE2MTQyM2I2NGQ4IiwiZW1haWwiOiIyMDIxM3RuMDc2QHV0ZXouZWR1Lm14In0.D5FH4XR384SfXtzmGquR8NspcSO0we_WVvMXWAHBC1pdERoWB0yRFowUi_1WgmS4aOyWSkP_X-MsZoupSH9gpmaum22EUHedCPAtymvzmBu2KLUvwVicwZ_cO9V5xy7qLJ44DbRtvt8zqzfm-eKvE8lHn_dhnEKFttpPMQDbI_amIsghYc99PvR5X7F_S1jheVlxgr6MTzVA-WGc8jYKliQbV5S2-NTLv0JW7IFY-2p1W_NvY_ejIqdzB2qlQfTP_BclI7P17PcXvYzUgAFYqZTw4Vw73O7ImVQ7DU74ZmV3K0TAZuriWTL0t65q8r23WGuPSTZax-zJRxmANIr0WA', // Reemplaza con tu URL
            //accessToken: 'your-access-token', // Reemplaza con tu token
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CarrListView(), // Cambia esto para mostrar tu vista
      ),
    );
  }
}
