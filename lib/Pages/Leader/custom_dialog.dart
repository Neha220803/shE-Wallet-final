// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:sample/Utils/constants.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  CustomDialogState createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog> {
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
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Create Community',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: primaryColor, // Set the border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2.5, // Set the border thickness
                        color: primaryColor, // Set the border color
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
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
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: primaryColor, // Set the border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 2.5, // Set the border thickness
                        color: primaryColor, // Set the border color
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
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
                const SizedBox(height: 10),
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
                  child: const Text('Choose Date'),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    backgroundColor: primaryColor,
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
                  child: const Text('CREATE'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  placesAutoCompleteTextField() {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: controller,
      googleAPIKey: "AIzaSyB_9c8KMY5jjb7SpDI_ESAuJzr_uKQIxIM",
      inputDecoration: const InputDecoration(
        hintText: "Search your location",
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      debounceTime: 400,
      countries: const ["in", "fr"],
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
      seperatedBuilder: const Divider(),
      containerHorizontalPadding: 10,
      itemBuilder: (context, index, Prediction prediction) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 7),
              // ignore: unnecessary_string_interpolations
              Expanded(child: Text("${prediction.description ?? ""}"))
            ],
          ),
        );
      },
      isCrossBtnShown: true,
    );
  }
}
