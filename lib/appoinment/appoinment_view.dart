import 'package:doctor_r01/appoinment/appoinment_controller.dart';
import 'package:doctor_r01/appoinment/tabs/appoinmnet_adding_sample_view.dart';
import 'package:doctor_r01/appoinment/tabs/appoinmnet_request_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppoinmentView extends GetView<AppoinmentController> {
  final AppoinmentController appoinmentController =
      Get.put(AppoinmentController());

  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white60,
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              indicatorColor: Color(0xFF832685),
              controller: appoinmentController.tabController,
              tabs: <Tab>[
                Tab(
                  text: 'Appoinmnets'.toUpperCase(),
                ),
                Tab(
                  text: 'Scheduled'.toUpperCase(),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: appoinmentController.tabController,
            children: <Widget>[
              AppoinmentRequestView(),
              AddSamplePaitentAppoinment(),
            ],
          ),
        ),
      ),
    );
  }
}


/*   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('appointments')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                List<Appointment> appointmentList =
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return Appointment(
                    id: document.id,
                    appointmentDate: data['appointmentDate'],
                    phone: data['phone'],
                    sex: data['sex'],
                    age: data['age'],
                    image: data['image'],
                    name: data['name'],
                    problem: data['problem'],
                    time: data['time'],
                    acceptflag: data['acceptflag'],
                    rejectflag: data['rejectflag'],
                  );
                }).toList();
                return ListView.builder(
                  itemCount: appointmentList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(appointmentList[index].name!),
                      subtitle: Text(
                          'Appointment Date: ${appointmentList[index].appointmentDate}'),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        ],
      ),
    );
  } */
