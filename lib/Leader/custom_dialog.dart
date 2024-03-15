// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _description = '';
  int _numberOfMembers = 1;
  int _monthlyContribution = 50;
  DateTime _startDate = DateTime.now();
  int _maxLoanAmount = 250; // Initial value for Max Loan Amount
  int _maxNumberOfLoans = 5; // Initial value for Max Number of Loans
  int _communityDuration = 3; // Initial value for Community Duration
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _selectedPlace;
  double? _selectedLat;
  double? _selectedLng;

  final TextEditingController _nameController = TextEditingController();
  TextEditingController controller = TextEditingController();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('community_location');

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Text(
                    'Create Community',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF002D56),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF002D56), // Set the border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2.5, // Set the border thickness
                        color: Color(0xFF002D56), // Set the border color
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: "Enter Community Name",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Color(0xFF002D56), // Set the border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 2.5, // Set the border thickness
                        color: Color(0xFF002D56), // Set the border color
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    hintText: "Description",
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                SizedBox(height: 10),
                placesAutoCompleteTextField(),
                Text('No. of Members: $_numberOfMembers'),
                Slider(
                  value: _numberOfMembers.toDouble(),
                  min: 1,
                  max: 10,
                  onChanged: (value) {
                    setState(() {
                      _numberOfMembers = value.round();
                    });
                  },
                ),
                Text('Monthly Contribution: \Rs.$_monthlyContribution'),
                Slider(
                  value: _monthlyContribution.toDouble(),
                  min: 50,
                  max: 500,
                  onChanged: (value) {
                    setState(() {
                      _monthlyContribution = value.round();
                    });
                  },
                ),
                Text('Max Loan Amount: \Rs.$_maxLoanAmount'),
                Slider(
                  value: _maxLoanAmount.toDouble(),
                  min: 100,
                  max: 1000,
                  onChanged: (value) {
                    setState(() {
                      _maxLoanAmount = value.round();
                    });
                  },
                ),
                Text('Max Number of Loans: $_maxNumberOfLoans'),
                Slider(
                  value: _maxNumberOfLoans.toDouble(),
                  min: 1,
                  max: 10,
                  onChanged: (value) {
                    setState(() {
                      _maxNumberOfLoans = value.round();
                    });
                  },
                ),
                Text('Duration of the Community: $_communityDuration Years'),
                Slider(
                  value: _communityDuration.toDouble(),
                  min: 2,
                  max: 6,
                  onChanged: (value) {
                    setState(() {
                      _communityDuration = value.round();
                    });
                  },
                ),
                Text(
                    'Start Date: ${DateFormat('dd-MM-yyyy').format(_startDate)}'),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _startDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null && pickedDate != _startDate) {
                      setState(() {
                        _startDate = pickedDate;
                      });
                    }
                  },
                  child: Text('Choose Date'),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    backgroundColor: Color(0xFF002D56),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(350, 50),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await _firestore.collection('community_details').add({
                        'name': _name,
                        'description': _description,
                        'members_count': _numberOfMembers,
                        'monthly_contribution': _monthlyContribution,
                        'max_loan_amount': _maxLoanAmount,
                        'max_number_of_loans': _maxNumberOfLoans,
                        'community_duration': _communityDuration,
                        'start_date': _startDate,
                        "location": _selectedPlace,
                        "lat": _selectedLat,
                        "lng": _selectedLng,
                        "full": 0,
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text('CREATE'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  placesAutoCompleteTextField() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 20),
      child: GooglePlaceAutoCompleteTextField(
        textEditingController: controller,
        googleAPIKey: "AIzaSyB_9c8KMY5jjb7SpDI_ESAuJzr_uKQIxIM",
        inputDecoration: InputDecoration(
          hintText: "Search your location",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
        debounceTime: 400,
        countries: ["in", "fr"],
        isLatLngRequired: true, // Set to true to get latitude and longitude
        getPlaceDetailWithLatLng: (Prediction prediction) {
          print("Place Details - Name: ${prediction.description}");
          print("Latitude: ${prediction.lat}");
          print("Longitude: ${prediction.lng}");
          _selectedLat = double.tryParse(prediction.lat ?? "");
          _selectedLng = double.tryParse(prediction.lng ?? "");
        },
        itemClick: (Prediction prediction) {
          _selectedPlace = prediction.description;
          print("Latitude: ${prediction.lat}");
          print("Longitude: ${prediction.lng}");

          print(_selectedLat);
          controller.text = prediction.description ?? "";
          controller.selection = TextSelection.fromPosition(
              TextPosition(offset: prediction.description?.length ?? 0));
        },
        seperatedBuilder: Divider(),
        containerHorizontalPadding: 10,
        itemBuilder: (context, index, Prediction prediction) {
          return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 7),
                Expanded(child: Text("${prediction.description ?? ""}"))
              ],
            ),
          );
        },
        isCrossBtnShown: true,
      ),
    );
  }
}
