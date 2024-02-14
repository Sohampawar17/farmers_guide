import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'crop_model.dart';

class CropInfoScreen extends StatefulWidget {
  const CropInfoScreen({super.key});

  @override
  _CropInfoScreenState createState() => _CropInfoScreenState();
}

class _CropInfoScreenState extends State<CropInfoScreen> {
final auth =FirebaseAuth.instance;
final ref= FirebaseDatabase.instance.ref("crops");

TextEditingController _searchController = TextEditingController();
String _searchQuery = '';



  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Information'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchQuery = value.toLowerCase();
              });
            },
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: ' search by crop name or growing period',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                String cropName = snapshot.child("crop_name").value.toString().toLowerCase();
                String growingPeriod = snapshot.child('growing_period').value.toString().toLowerCase();

                // Filter based on the search query
                if (_searchQuery.isNotEmpty &&
                    !cropName.contains(_searchQuery) &&
                    !growingPeriod.contains(_searchQuery)) {
                  return SizedBox(); // Return an empty SizedBox if the item doesn't match the search query
                }

                return Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(snapshot.child("crop_name").value.toString()),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Varieties: ${snapshot.child("varieties").value}'),
                                Text('Weather Required: ${snapshot.child("weather_required").value.toString()}'),
                                Text('Growing Period: ${snapshot.child("growing_period").value.toString()}'),
                                Text('Suitable Soil: ${snapshot.child("suitable_soil").value.toString()}'),
                                Text('Major Producers: ${snapshot.child("major_producers").value}'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    leading: Text((index + 1).toString()),
                    title: Text(snapshot.child("crop_name").value.toString()),
                    subtitle: Text(snapshot.child('growing_period').value.toString()),
                    trailing: Icon(Icons.arrow_circle_right_outlined),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


class CropInfoDialog extends StatelessWidget {
  final Map<String, dynamic> cropInfo;

  const CropInfoDialog({Key? key, required this.cropInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(cropInfo['crop_name']),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Varieties: ${cropInfo['varieties'].join(', ')}'),
          Text('Weather Required: ${cropInfo['weather_required']}'),
          Text('Growing Period: ${cropInfo['growing_period']}'),
          Text('Suitable Soil: ${cropInfo['suitable_soil']}'),
          Text('Major Producers: ${cropInfo['major_producers'].join(', ')}'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}

