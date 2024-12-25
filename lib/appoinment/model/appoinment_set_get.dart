// class Appointment {
//   String  Date;
//   String  Phone;
//   String  Sex;
//   int  Age;
//   String  Image;
//   String  Name;
//   String  Problem;
//   String  Time;

//   Appointment({
//     required this. Date,
//     required this. Phone,
//     required this. Sex,
//     required this. Age,
//     required this. Image,
//     required this. Name,
//     required this. Problem,
//     required this. Time,
//   });

//   factory Appointment.fromJson(Map<String, dynamic> json) {
//     return Appointment(
//        Date: json['paitent_date'],
//        Phone: json['paitent_phone'],
//        Sex: json['paitent_sex'],
//        Age: json['age'],
//        Image: json['image'],
//        Name: json['name'],
//        Problem: json['problem'],
//        Time: json['time'],
//     );
//   }

class Appointment {
  String? id;
  String? appointmentDate;
  String? phone;
  String? sex;
  int? age;
  String? image;
  String? name;
  String? problem;
  String? time;
  bool? acceptflag;
  bool? rejectflag;

  Appointment({
    required this.rejectflag,
    required this.acceptflag,
    required this.id,
    required this.appointmentDate,
    required this.phone,
    required this.sex,
    required this.age,
    required this.image,
    required this.name,
    required this.problem,
    required this.time,
  });

  factory Appointment.fromMap(map, id) {
    return Appointment(
      id: id,
      appointmentDate: map['appointmentDate'],
      phone: map['phone'],
      sex: map['sex'],
      age: map['age'],
      image: map['image'],
      name: map['name'],
      problem: map['problem'],
      time: map['time'],
      rejectflag: map['flag'],
      acceptflag: map['flag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': appointmentDate,
      'phone': phone,
      'sex': sex,
      'age': age,
      'image': image,
      'name': name,
      'problem': problem,
      'time': time,
    };
  }
}
