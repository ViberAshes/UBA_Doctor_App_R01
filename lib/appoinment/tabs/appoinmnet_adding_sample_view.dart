import 'package:doctor_r01/appoinment/model/appoinment_set_get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddSamplePaitentAppoinment extends StatefulWidget {
  @override
  _AddSamplePaitentAppoinmentState createState() =>
      _AddSamplePaitentAppoinmentState();
}

class _AddSamplePaitentAppoinmentState
    extends State<AddSamplePaitentAppoinment> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _sexController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _problemController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  void addAppointment(Appointment appointment) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('appointments').add(appointment.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Appointment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: _sexController,
                decoration: InputDecoration(labelText: 'Sex'),
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextField(
                controller: _imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _problemController,
                decoration: InputDecoration(labelText: 'Problem'),
              ),
              TextField(
                controller: _timeController,
                decoration: InputDecoration(labelText: 'Time'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Here you can send the data to the server
                  // For example:
                  Appointment appointment = Appointment(
                    appointmentDate: _dateController.text,
                    phone: _phoneController.text,
                    sex: _sexController.text,
                    age: int.tryParse(_ageController.text) ?? 0,
                    image: _imageController.text,
                    name: _nameController.text,
                    problem: _problemController.text,
                    time: _timeController.text,
                    id: '',
                    acceptflag: false,
                    rejectflag: false,
                  );
                  addAppointment(appointment);

                  _dateController.clear;
                  _phoneController.clear;
                  _sexController.clear;
                  _ageController.clear;
                  _imageController.clear;
                  _nameController.clear;
                  _problemController.clear;
                  _timeController.clear;
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
