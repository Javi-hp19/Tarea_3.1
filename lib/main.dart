import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temperature = 25.0;
  String description = "Soleado";
  String city = "La Ceiba";
  IconData weatherIcon = Icons.wb_sunny;

  void refreshWeather() {
    // Lista de descripciones y sus íconos correspondientes
    List<Map<String, dynamic>> weatherOptions = [
      {"description": "Soleado", "icon": Icons.wb_sunny, "temperature": 30.0},
      {"description": "Nublado", "icon": Icons.cloud, "temperature": 22.0},
      {"description": "Lluvia", "icon": Icons.grain, "temperature": 20.0},
      {"description": "Tormenta", "icon": Icons.flash_on, "temperature": 18.0},
    ];

    // Seleccionar una opción aleatoria
    final random = Random();
    final randomWeather = weatherOptions[random.nextInt(weatherOptions.length)];

    setState(() {
      description = randomWeather["description"];
      weatherIcon = randomWeather["icon"];
      temperature = randomWeather["temperature"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('El Clima'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ciudad: $city',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Temperatura: ${temperature.toStringAsFixed(1)}°C',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Descripción: $description',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Icon(
              weatherIcon,
              size: 100,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: refreshWeather,
              child: const Text('Refrescar'),
            ),
          ],
        ),
      ),
    );
  }
}
