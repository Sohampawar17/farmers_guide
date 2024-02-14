// market_price_screen.dart
import 'package:flutter/material.dart';

class MarketPriceScreen extends StatefulWidget {
  @override
  _MarketPriceScreenState createState() => _MarketPriceScreenState();
}

class _MarketPriceScreenState extends State<MarketPriceScreen> {
 // int _currentIndex = 4; // Set the correct index for Market Price in the bottom navigation

  String _selectedState = '';
  String _selectedCrop = '';

  List<String> states = [
    'State 1',
    'State 2',
    'State 3',
    'State 4',
    'State 5',
    'State 6',
    'State 7',
    'State 8',
    'State 9',
    'State 10',
  ];

  List<String> crops = [
    'Crop 1',
    'Crop 2',
    'Crop 3',
    'Crop 4',
    'Crop 5',
    'Crop 6',
    'Crop 7',
    'Crop 8',
    'Crop 9',
    'Crop 10',
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
