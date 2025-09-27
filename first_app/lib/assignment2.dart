import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AirQualityPage extends StatefulWidget {
  const AirQualityPage({super.key});

  @override
  State<AirQualityPage> createState() => _AirQualityPageState();
}

class _AirQualityPageState extends State<AirQualityPage> {
  Map<String, dynamic>? airData;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() => loading = true);

    const token = "YOUR_API_TOKEN"; //
    final url = Uri.parse(
      "https://api.waqi.info/feed/here/?token=088e0533ecc0d410c5720ae1a844cc6d21bcdb3e",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        airData = {
          "aqi": data["data"]["aqi"],
          "temp": data["data"]["iaqi"]["t"]["v"],
          "city": data["data"]["city"]["name"],
        };
        loading = false;
      });
    } else {
      setState(() => loading = false);
    }
  }

  String getAirQualityLabel(int aqi) {
    if (aqi <= 50) return "Good 😊";
    if (aqi <= 100) return "Moderate 😐";
    if (aqi <= 150) return "Unhealthy for Sensitive Groups 😷";
    if (aqi <= 200) return "Unhealthy 🤒";
    if (aqi <= 300) return "Very Unhealthy 😨";
    return "Hazardous ☠️";
  }

  Color getAirQualityColor(int aqi) {
    if (aqi <= 50) return Colors.green;
    if (aqi <= 100) return Colors.yellow.shade700;
    if (aqi <= 150) return Colors.orange;
    if (aqi <= 200) return Colors.red;
    if (aqi <= 300) return Colors.purple;
    return Colors.brown;
  }

  @override
  Widget build(BuildContext context) {
    final aqi = airData?["aqi"] ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(" Air Quality "),
        centerTitle: true,
        backgroundColor: getAirQualityColor(aqi),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [getAirQualityColor(aqi).withOpacity(0.7), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.black),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // City + Location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.black54,
                        size: 30,
                      ),
                      Text(
                        airData?["city"] ?? "",
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Card กลาง
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "$aqi",
                            style: TextStyle(
                              fontSize: 90,
                              fontWeight: FontWeight.bold,
                              color: getAirQualityColor(aqi),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            getAirQualityLabel(aqi),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: getAirQualityColor(aqi),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "🌡 Temperature : ${airData?["temp"] ?? "--"} °C",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ปุ่ม Refresh
                  ElevatedButton.icon(
                    onPressed: fetchData,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Refresh"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getAirQualityColor(aqi),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
