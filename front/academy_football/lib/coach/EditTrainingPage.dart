// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import 'PlanificationEntrainements.dart';

// class EditTrainingPage extends StatefulWidget {
//   final Training training;

//   EditTrainingPage({required this.training});

//   @override
//   _EditTrainingPageState createState() => _EditTrainingPageState();
// }

// class _EditTrainingPageState extends State<EditTrainingPage> {
//   final _formKey = GlobalKey<FormState>();
//   late String _selectedTeam;
//   late String _selectedPlace;
//   late String _selectedType;
//   late DateTime _selectedDate;
//   late TimeOfDay _selectedTime;

//   @override
//   void initState() {
//     super.initState();
//     _selectedTeam = widget.training.team;
//     _selectedPlace = widget.training.place;
//     _selectedType = widget.training.type;
//     _selectedDate = widget.training.day;
//     _selectedTime = widget.training.time;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text('Edit Training'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text('Team'),
//               DropdownButtonFormField<String>(
//                 value: _selectedTeam,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedTeam = newValue!;
//                   });
//                 },
//                 items: <String>[
//                   'Barcelona',
//                   'Real Madrid',
//                   'Atletico Madrid',
//                   'Valencia'
//                 ].toSet().toList().map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 16.0),
//               Text('Place'),
//               DropdownButtonFormField<String>(
//                 value: _selectedPlace,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedPlace = newValue!;
//                   });
//                 },
//                 items: <String>[
//                   'Camp Nou',
//                   'Santiago Bernabeu',
//                   'Wanda Metropolitano',
//                   'Mestalla'
//                 ].toSet().toList().map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 16.0),
//               Text('Type'),
//               DropdownButtonFormField<String>(
//                 value: _selectedType,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedType = newValue!;
//                   });
//                 },
//                 items: <String>[
//                   'Conditioning',
//                   'Tactics',
//                   'Physical Training',
//                   'Technical Skills'
//                 ].toSet().toList().map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 16.0),
//               Text('Date'),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Text(DateFormat.yMMMMd().format(_selectedDate)),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.calendar_today),
//                     onPressed: () async {
//                       final DateTime? pickedDate = await showDatePicker(
//                           context: context,
//                           initialDate: _selectedDate,
//                           firstDate: DateTime.now(),
//                           lastDate: DateTime(2100));
//                       if (pickedDate != null && pickedDate != _selectedDate) {
//                         setState(() {
//                           _selectedDate = pickedDate;
//                         });
//                         showTimePicker(
//                           context: context,
//                           initialTime: _selectedTime,
//                         ).then((pickedTime) {
//                           if (pickedTime != null &&
//                               pickedTime != _selectedTime) {
//                             setState(() {
//                               _selectedTime = pickedTime;
//                             });
//                           }
//                         });
//                       }
//                       ;
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
