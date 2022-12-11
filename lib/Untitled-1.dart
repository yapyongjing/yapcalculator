// child: Ink(
//           width: size,
//           height: size,
//           decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.grey, offset: Offset(1, 1), blurRadius: 2),
//               ],
//               borderRadius: BorderRadius.all(Radius.circular(size / 2)),
//               color: backgroundColor),
//           child: InkWell(
//             customBorder: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(size / 2)),
//             ),
//             onTap: onTap,
//             child: Center(
//                 child: Text(
//               label,
//               style: TextStyle(fontSize: 24, color: labelColor),
//             )),
//           ),
//         )

//         return GestureDetector(
//       onTap:onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(0.2),
//         child: ClipRRect(
//           // borderRadius: BorderRadius.circular(25),
//           child: Container(
//             color: backgroundColor,
//             child: Center(
//               child: Text(
//                 label,
//               style: TextStyle(fontSize: 25, color: labelColor),
//               ),
//             ),
//           ),
//         ),
//       ),
//       );

//         child: ClipRRect(
//           // borderRadius: BorderRadius.circular(25),
//           child: Container(
//             color: color,
//             child: Center(
//               child: Text(
//                 buttonText,
//                 style: TextStyle(
//                   color: textColor,
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ),