// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';


// class TrainingCalendar extends StatefulWidget{
//   const TrainingCalendar ({super.key});
//   @override
//   State<TrainingCalendar> createState() => _TrainingCalendarState();
// }
// class _TrainingCalendarState extends State<TrainingCalendar>{

//   TrainingCalendar _calendarController = TrainingCalendar();

//   @override
//   void initState() {
//     super.initState();
//     _calendarController = TrainingCalendar();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
       //backgroundColor: Colors.black,
//         title: Text("Calendrier d'entraînement"),
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 20),
//             child: TableCalendar(
//     TrainingCalendar: _calendarController,
//       firstDay: DateTime.now(),
//       lastDay: DateTime.utc(DateTime.now().year + 1),
//       focusedDay: _selectedDay,
//       calendarStyle: CalendarStyle(
//         todayDecoration: BoxDecoration(
//           color: Colors.blue,
//           shape: BoxShape.circle,
//         ),
//         selectedDecoration: BoxDecoration(
//           color: Colors.orange,
//           shape: BoxShape.circle,
//         ),
//         markersMaxCount: 1,
//       ),
//       headerStyle: HeaderStyle(
//         titleTextStyle: TextStyle(fontSize: 20),
//         centerHeaderTitle: true,
//         formatButtonVisible: false,
//       ),
//       onDaySelected: _onDaySelected,
//       availableGestures: AvailableGestures.all,
//       calendarBuilders: CalendarBuilders(
//         selectedBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4.0),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.orange,
//               shape: BoxShape.circle,
//             ),
//             child: Text(
//               date.day.toString(),
//               style: TextStyle(color: Colors.white),
//             ),
//           );
//         },
//         todayBuilder: (context, date, _) {
//           return Container(
//             margin: const EdgeInsets.all(4.0),
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               shape: BoxShape.circle,
//             ),
//             child: Text(
//               date.day.toString(),
//               style: TextStyle(color: Colors.white),
//             ),
//           );
//         },
//       ),
//     ),
