// market_price_screen.dart
import 'package:flutter/material.dart';

class MarketPriceScreen extends StatefulWidget {
  @override
  _MarketPriceScreenState createState() => _MarketPriceScreenState();
}

class _MarketPriceScreenState extends State<MarketPriceScreen> {
// Set the correct index for Market Price in the bottom navigation

  String _selectedState = 'Maharastra'; // Set a default state value
  String _selectedCrop = 'Maize'; // Set a default crop value

  List<String> states = [
    'Maharastra',
    'Karnataka',
    'Gujrat',
    'Bihar',
    'Rajsthan',
    'Kerala',
    'Odisa',
    'Punjab',
    'U.P',
    'M.P',
  ];

  List<String> crops = [
    'Maize',
    'Termaric',
    'Wheet',
    'Rice',
    'Sugarcane',
    'Tomato',
    'Potato',
    'Groundnut',
    'Jwari',
    'Moong',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Price'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedState,
              onChanged: (newValue) {
                setState(() {
                  _selectedState = newValue!;
                });
              },
              items: states.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select State',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCrop,
              onChanged: (newValue) {
                setState(() {
                  _selectedCrop = newValue!;
                });
              },
              items: crops.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select Crop',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your search logic here
                print('Selected State: $_selectedState');
                print('Selected Crop: $_selectedCrop');
                // You can implement the search functionality or navigate to another page
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
