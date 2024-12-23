import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/weather.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  WeatherWidgetState createState() => WeatherWidgetState();
}

class WeatherWidgetState extends State<WeatherWidget> {
  final TextEditingController _cityController = TextEditingController();
  List<Weather> forecasts = [];
  late WeatherFactory weatherFactory;

  WeatherWidgetState() {
    weatherFactory = WeatherFactory("7cc5f9e3b9c29b6175494c9d2924e6c3", language: Language.FRENCH);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Nom de la ville',
                suffixIcon: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
                  onPressed: () async {
                    final r = await weatherFactory.fiveDayForecastByCityName(_cityController.value.text);
                    setState(() {
                      forecasts = r;
                    });
                  },
                ),
              ),
            ),
          ),
          if (forecasts.isNotEmpty) ...[
            FaIcon(
              _icon(forecasts.first.weatherMain),
              size: 64,
            ),
            Text(
              '${forecasts.first.temperature?.celsius?.toStringAsPrecision(3)}°C',
              style: const TextStyle(fontSize: 72),
            ),
            Text(
              'Vent: ${forecasts.first.windSpeed?.toStringAsPrecision(3)} km/h',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Hum: ${forecasts.first.humidity?.toStringAsPrecision(3)}%',
              style: const TextStyle(fontSize: 24),
            ),
          ],
          if (forecasts.isNotEmpty)
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: forecasts.length,
                itemBuilder: (context, index) {
                  final day = forecasts[index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            day.date
                                .toString()
                                .substring(0, 16),
                          ),
                          const SizedBox(height: 8),
                          FaIcon(
                            _icon(day.weatherMain),
                            size: 32,
                          ),
                          Text('${day.temperature?.celsius?.toStringAsPrecision(3)}°C (ressenti ${day.tempFeelsLike?.celsius?.toStringAsPrecision(3)}°C)'),
                          Text('Vent: ${day.windSpeed?.toStringAsPrecision(3)} km/h'),
                          Text('Hum: ${day.humidity?.toStringAsPrecision(3)}%'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        )
    );
  }

  IconData _icon(String? main) {
    if (main == null) return FontAwesomeIcons.circleQuestion;
    switch (main.toLowerCase()) {
      case 'clear':
        return FontAwesomeIcons.sun;
      case 'clouds':
        return FontAwesomeIcons.cloud;
      case 'rain':
        return FontAwesomeIcons.cloudRain;
      case 'snow':
        return FontAwesomeIcons.snowflake;
      case 'thunderstorm':
        return FontAwesomeIcons.cloudBolt;
      case 'drizzle':
        return FontAwesomeIcons.cloudShowersHeavy;
      case 'mist':
      case 'fog':
        return FontAwesomeIcons.smog;
      default:
        return FontAwesomeIcons.cloud;
    }
  }
}
