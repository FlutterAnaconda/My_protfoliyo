// import 'package:flutter/material.dart';
//
// import 'package:fl_chart/fl_chart.dart';
//
//
// class CutomBarChart extends StatefulWidget {
//   const CutomBarChart({super.key});
//
//   // List<Color> get availableColors => const <Color>[
//   //       Colors.purpleAccent,
//   //       Colors.yellow,
//   //       Colors.lightBlue,
//   //       Colors.orange,
//   //       Colors.pink,
//   //       Colors.redAccent,
//   //     ];
//
//   @override
//   State<StatefulWidget> createState() => CutomBarChartState();
// }
//
// class CutomBarChartState extends State<CutomBarChart> {
//
//   final Duration animDuration = const Duration(milliseconds: 250);
//
//   int touchedIndex = -1;
//   bool isPlaying = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//         height: 250,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//
//         ),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: SizedBox(
//             width: 800,
//             child: BarChart(
//               isPlaying ? randomData() : mainBarData(),
//               swapAnimationDuration: animDuration,
//             ),
//           ),
//         ),
//       );
//
//   }
//
//   BarChartGroupData makeGroupData(
//       int x,
//       double y, {
//         bool isTouched = false,
//         int barNum = 1,
//         double width = 18,
//         List<int> showTooltips = const [],
//       }) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           color: barNum == 1
//               ?  const Color(0xff34A853)
//               : barNum == 2
//               ? const Color(0xff34B3F1)
//               : const Color(0xffE3E3E4),
//           toY: isTouched ? y + 1 : y,
//           width: width,
//           borderSide: const BorderSide(width: 0.5, color: Colors.transparent),
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             toY: 18,
//             color: Colors.transparent,
//           ),
//         ),
//       ],
//       showingTooltipIndicators: showTooltips,
//     );
//   }
//
//   List<BarChartGroupData> showingGroups() => List.generate(12, (i) {
//     switch (i) {
//       case 0:
//         return makeGroupData(0, 13, isTouched: i == touchedIndex, barNum: 1);
//       case 1:
//         return makeGroupData(0, 70, isTouched: i == touchedIndex, barNum: 2);
//       case 2:
//         return makeGroupData(0, 40, isTouched: i == touchedIndex, barNum: 3);
//       case 3:
//         return makeGroupData(1, 10, isTouched: i == touchedIndex, barNum: 1);
//       case 4:
//         return makeGroupData(1, 36, isTouched: i == touchedIndex, barNum: 1);
//       case 5:
//         return makeGroupData(1, 17, isTouched: i == touchedIndex, barNum: 2);
//       case 6:
//         return makeGroupData(2, 13.5,
//             isTouched: i == touchedIndex, barNum: 3);
//       case 7:
//         return makeGroupData(2, 0, isTouched: i == touchedIndex, barNum: 1);
//       case 8:
//         return makeGroupData(2, 14.5,
//             isTouched: i == touchedIndex, barNum: 1);
//       case 9:
//         return makeGroupData(3, 13.5,
//             isTouched: i == touchedIndex, barNum: 2);
//       case 10:
//         return makeGroupData(3, 41.5,
//             isTouched: i == touchedIndex, barNum: 3);
//       case 11:
//         return makeGroupData(3, 10, isTouched: i == touchedIndex, barNum: 1);
//       case 12:
//         return makeGroupData(4, 60.5,
//             isTouched: i == touchedIndex, barNum: 1);
//       case 13:
//         return makeGroupData(4, 20.5,
//             isTouched: i == touchedIndex, barNum: 2);
//       case 14:
//         return makeGroupData(4, 14.5,
//             isTouched: i == touchedIndex, barNum: 3);
//
//       default:
//         return throw Error();
//     }
//   });
//
//   BarChartData mainBarData() {
//     return BarChartData(
//
//       barTouchData: BarTouchData(
//
//         touchTooltipData: BarTouchTooltipData(
//           tooltipBgColor: Colors.white,
//           getTooltipItem: (group, groupIndex, rod, rodIndex) {
//             String weekDay;
//             switch (group.x) {
//               case 0:
//                 weekDay = 'Week 1';
//                 break;
//
//
//               case 1:
//                 weekDay = 'Week 2';
//                 break;
//
//
//               case 2:
//                 weekDay = 'Week 3';
//                 break;
//               case 3:
//                 weekDay = 'Week 3';
//                 break;
//
//
//               case 4:
//                 weekDay = 'Week 4';
//                 break;
//
//
//               default:
//                 throw Error();
//             }
//             return BarTooltipItem(
//               '$weekDay\n',
//               const TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//               children: <TextSpan>[
//                 TextSpan(
//                   text: (rod.toY - 1).toString(),
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//         touchCallback: (FlTouchEvent event, barTouchResponse) {
//           setState(() {
//             if (!event.isInterestedForInteractions ||
//                 barTouchResponse == null ||
//                 barTouchResponse.spot == null) {
//               touchedIndex = -1;
//               return;
//             }
//             touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
//           });
//         },
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: getTitles,
//             reservedSize: 30,
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: getLeftTiles,
//             reservedSize: 30,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       barGroups: showingGroups(),
//       gridData: const FlGridData(show: false),
//     );
//   }
//
//   Widget getTitles(double value, TitleMeta meta) {
//     const style = TextStyle(
//       color: Colors.grey,
//       fontWeight: FontWeight.w400,
//       fontSize: 12,
//     );
//     Text text;
//     switch (value.toInt()) {
//       case 1:
//         text = const Text('Week 1', style: style);
//         break;
//       case 5:
//         text = const Text('Week2', style: style);
//         break;
//       case 8:
//         text = const Text('Week 3', style: style);
//         break;
//       case 12:
//         text = const Text('Week 4', style: style);
//         break;
//       default:
//         text = const Text('', style: style);
//         break;
//     }
//     return text;
//     // return SideTitleWidget(
//     //   axisSide: meta.axisSide,
//     //   space: 14,
//     //   child: text,
//     // );
//   }
//
//   Widget getLeftTiles(double value, TitleMeta meta) {
//     const style = TextStyle(
//       color: Colors.grey,
//       fontWeight: FontWeight.w400,
//       fontSize: 12,
//     );
//     Text leftText;
//     switch (value.toInt()) {
//       case 0:
//         leftText = const Text('10%', style: style);
//         break;
//       case 1:
//         leftText = const Text('20%', style: style);
//         break;
//       case 2:
//         leftText = const Text('40%', style: style);
//         break;
//       case 3:
//         leftText = const Text('60%', style: style);
//         break;
//       case 4:
//         leftText = const Text('80%', style: style);
//         break;
//
//       case 6:
//         leftText = const Text('100%', style: style);
//         break;
//
//       default:
//         leftText = const Text('', style: style);
//         break;
//     }
//     return leftText;
//   }
//
//   BarChartData randomData() {
//     return BarChartData(
//       barTouchData: BarTouchData(
//         enabled: false,
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             getTitlesWidget: getTitles,
//             reservedSize: 30,
//           ),
//         ),
//         leftTitles: const AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//         topTitles: const AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//         rightTitles: const AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: false,
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       // barGroups: List.generate(15, (i) {
//       //   return makeGroupData(
//       //     i,
//       //     (i + 1).toDouble(),
//       //     isTouched: i == touchedIndex,
//       //     barNum: (i % 3) + 1,
//       //   );
//       // }),
//       // barGroups: List.generate(7, (i) {
//       //   switch (i) {
//       //     case 0:
//       //       return makeGroupData(
//       //         0,
//       //         Random().nextInt(15).toDouble() + 6,
//       //         //   barColor: widget.availableColors[
//       //         //       Random().nextInt(widget.availableColors.length)],
//       //       );
//       //     case 1:
//       //       return makeGroupData(
//       //         1,
//       //         Random().nextInt(15).toDouble() + 6,
//       //         // barColor: widget.availableColors[
//       //         //     Random().nextInt(widget.availableColors.length)
//       //         //],
//       //       );
//       //     case 2:
//       //       return makeGroupData(
//       //         2,
//       //         Random().nextInt(15).toDouble() + 6,
//       //         // barColor: widget.availableColors[
//       //         //     Random().nextInt(widget.availableColors.length)],
//       //       );
//       //     case 3:
//       //       return makeGroupData(
//       //         3,
//       //         Random().nextInt(15).toDouble() + 6,
//       //         // barColor: widget.availableColors[
//       //         //     Random().nextInt(widget.availableColors.length)],
//       //       );
//       //     case 4:
//       //       return makeGroupData(
//       //         4,
//       //         Random().nextInt(15).toDouble() + 6,
//       //         // barColor: widget.availableColors[
//       //         //     Random().nextInt(widget.availableColors.length)],
//       //       );
//       //     case 5:
//       //       return makeGroupData(
//       //         5,
//       //         Random().nextInt(15).toDouble() + 6,
//       //         // barColor: widget.availableColors[
//       //         //     Random().nextInt(widget.availableColors.length)],
//       //       );
//       //     case 6:
//       //       return makeGroupData(
//       //         6,
//       //         Random().nextInt(15).toDouble() + 6,
//       //         // barColor: widget.availableColors[
//       //         //     Random().nextInt(widget.availableColors.length)],
//       //       );
//       //     default:
//       //       return throw Error();
//       //   }
//       // }),
//       // gridData: FlGridData(show: false),
//     );
//   }
//
// // Future<dynamic> refreshState() async {
// //   setState(() {});
// //   await Future<dynamic>.delayed(
// //     animDuration + const Duration(milliseconds: 50),
// //   );
// //   if (isPlaying) {
// //     await refreshState();
// //   }
// // }
// }
//


///////////6 worked
// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
// import 'package:fl_chart_app/util/extensions/color_extensions.dart';
// import 'dart:math' as math;
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// /////////////////--------------------7 changes worked
// // import 'package:fl_chart/fl_chart.dart';
// // import 'package:flutter/material.dart';
// //
// // class BarChartSample7 extends StatefulWidget {
// //   BarChartSample7({super.key});
// //
// //   final shadowColor = const Color(0xFFCCCCCC);
// //   final dataList = [
// //     const _BarData(AppColors.contentColorYellow, 18, 18),
// //     const _BarData(AppColors.contentColorGreen, 17, 8),
// //     const _BarData(AppColors.contentColorOrange, 10, 15),
// //     const _BarData(AppColors.contentColorPink, 2.5, 5),
// //     const _BarData(AppColors.contentColorBlue, 2, 2.5),
// //     const _BarData(AppColors.contentColorRed, 2, 2),
// //   ];
// //
// //   @override
// //   State<BarChartSample7> createState() => _BarChartSample7State();
// // }
// //
// // class _BarChartSample7State extends State<BarChartSample7> {
// //   BarChartGroupData generateBarGroup(
// //       int x,
// //       Color color,
// //       double value,
// //       double shadowValue,
// //       ) {
// //     return BarChartGroupData(
// //       x: x,
// //       barRods: [
// //         BarChartRodData(
// //           toY: value,
// //           color: color,
// //           width: 6,
// //         ),
// //         BarChartRodData(
// //           toY: shadowValue,
// //           color: widget.shadowColor,
// //           width: 6,
// //         ),
// //       ],
// //       showingTooltipIndicators: touchedGroupIndex == x ? [0] : [],
// //     );
// //   }
// //
// //   int touchedGroupIndex = -1;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(24),
// //       child: AspectRatio(
// //         aspectRatio: 1.4,
// //         child: BarChart(
// //           BarChartData(
// //             alignment: BarChartAlignment.spaceBetween,
// //             borderData: FlBorderData(
// //               show: true,
// //               border: Border.symmetric(
// //                 horizontal: BorderSide(
// //                   color: AppColors.borderColor.withOpacity(0.2),
// //                 ),
// //               ),
// //             ),
// //             titlesData: FlTitlesData(
// //               show: true,
// //               leftTitles: AxisTitles(
// //                 drawBelowEverything: true,
// //                 sideTitles: SideTitles(
// //                   showTitles: true,
// //                   reservedSize: 30,
// //                   getTitlesWidget: (value, meta) {
// //                     return Text(
// //                       value.toInt().toString(),
// //                       textAlign: TextAlign.left,
// //                     );
// //                   },
// //                 ),
// //               ),
// //               bottomTitles: AxisTitles(
// //                 sideTitles: SideTitles(
// //                   showTitles: true,
// //                   reservedSize: 36,
// //                   getTitlesWidget: (value, meta) {
// //                     final index = value.toInt();
// //                     return SideTitleWidget(
// //                       axisSide: meta.axisSide,
// //                       child: _IconWidget(
// //                         color: widget.dataList[index].color,
// //                         isSelected: touchedGroupIndex == index,
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //               rightTitles: const AxisTitles(),
// //               topTitles: const AxisTitles(),
// //             ),
// //             gridData: FlGridData(
// //               show: true,
// //               drawVerticalLine: false,
// //               getDrawingHorizontalLine: (value) => FlLine(
// //                 color: AppColors.borderColor.withOpacity(0.2),
// //                 strokeWidth: 1,
// //               ),
// //             ),
// //             barGroups: widget.dataList.asMap().entries.map((e) {
// //               final index = e.key;
// //               final data = e.value;
// //               return generateBarGroup(
// //                 index,
// //                 data.color,
// //                 data.value,
// //                 data.shadowValue,
// //               );
// //             }).toList(),
// //             maxY: 20,
// //             barTouchData: BarTouchData(
// //               enabled: true,
// //               handleBuiltInTouches: false,
// //               touchTooltipData: BarTouchTooltipData(
// //                 tooltipBgColor: Colors.transparent,
// //                 tooltipMargin: 0,
// //                 getTooltipItem: (
// //                     BarChartGroupData group,
// //                     int groupIndex,
// //                     BarChartRodData rod,
// //                     int rodIndex,
// //                     ) {
// //                   return BarTooltipItem(
// //                     rod.toY.toString(),
// //                     TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                       color: rod.color,
// //                       fontSize: 18,
// //                       shadows: const [
// //                         Shadow(
// //                           color: Colors.black26,
// //                           blurRadius: 12,
// //                         )
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               ),
// //               touchCallback: (event, response) {
// //                 if (event.isInterestedForInteractions &&
// //                     response != null &&
// //                     response.spot != null) {
// //                   setState(() {
// //                     touchedGroupIndex = response.spot!.touchedBarGroupIndex;
// //                   });
// //                 } else {
// //                   setState(() {
// //                     touchedGroupIndex = -1;
// //                   });
// //                 }
// //               },
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class _BarData {
// //   const _BarData(this.color, this.value, this.shadowValue);
// //   final Color color;
// //   final double value;
// //   final double shadowValue;
// // }
// //
// // class _IconWidget extends ImplicitlyAnimatedWidget {
// //   const _IconWidget({
// //     required this.color,
// //     required this.isSelected,
// //   }) : super(duration: const Duration(milliseconds: 300));
// //   final Color color;
// //   final bool isSelected;
// //
// //   @override
// //   ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
// //       _IconWidgetState();
// // }
// //
// // class _IconWidgetState extends AnimatedWidgetBaseState<_IconWidget> {
// //   Tween<double>? _rotationTween;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final rotation = math.pi * 4 * _rotationTween!.evaluate(animation);
// //     final scale = 1 + _rotationTween!.evaluate(animation) * 0.5;
// //     return Transform(
// //       transform: Matrix4.rotationZ(rotation).scaled(scale, scale),
// //       origin: const Offset(14, 14),
// //       child: Icon(
// //         widget.isSelected ? Icons.face_retouching_natural : Icons.face,
// //         color: widget.color,
// //         size: 28,
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void forEachTween(TweenVisitor<dynamic> visitor) {
// //     _rotationTween = visitor(
// //       _rotationTween,
// //       widget.isSelected ? 1.0 : 0.0,
// //           (dynamic value) => Tween<double>(
// //         begin: value as double,
// //         end: widget.isSelected ? 1.0 : 0.0,
// //       ),
// //     ) as Tween<double>?;
// //   }
// // }
//
//
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
//
// class BarChartSample6 extends StatelessWidget {
//   const BarChartSample6({super.key});
//
//   final pilateColor = AppColors.contentColorPurple;
//   final cyclingColor = AppColors.contentColorCyan;
//   final quickWorkoutColor = AppColors.contentColorBlue;
//   final betweenSpace = 0.2;
//
//   BarChartGroupData generateGroupData(
//       int x,
//       double pilates,
//       double quickWorkout,
//       double cycling,
//       ) {
//     return BarChartGroupData(
//       x: x,
//       groupVertically: true,
//       barRods: [
//         BarChartRodData(
//           fromY: 0,
//           toY: pilates,
//           color: pilateColor,
//           width: 5,
//         ),
//         BarChartRodData(
//           fromY: pilates + betweenSpace,
//           toY: pilates + betweenSpace + quickWorkout,
//           color: quickWorkoutColor,
//           width: 5,
//         ),
//         BarChartRodData(
//           fromY: pilates + betweenSpace + quickWorkout + betweenSpace,
//           toY: pilates + betweenSpace + quickWorkout + betweenSpace + cycling,
//           color: cyclingColor,
//           width: 5,
//         ),
//       ],
//     );
//   }
//
//   Widget bottomTitles(double value, TitleMeta meta) {
//     const style = TextStyle(fontSize: 10);
//     String text;
//     switch (value.toInt()) {
//       case 0:
//         text = 'JAN';
//         break;
//       case 1:
//         text = 'FEB';
//         break;
//       case 2:
//         text = 'MAR';
//         break;
//       case 3:
//         text = 'APR';
//         break;
//       case 4:
//         text = 'MAY';
//         break;
//       case 5:
//         text = 'JUN';
//         break;
//       case 6:
//         text = 'JUL';
//         break;
//       case 7:
//         text = 'AUG';
//         break;
//       case 8:
//         text = 'SEP';
//         break;
//       case 9:
//         text = 'OCT';
//         break;
//       case 10:
//         text = 'NOV';
//         break;
//       case 11:
//         text = 'DEC';
//         break;
//       default:
//         text = '';
//     }
//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       child: Text(text, style: style),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Activity',
//             style: TextStyle(
//               color: AppColors.contentColorBlue,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           LegendsListWidget(
//             legends: [
//               Legend('Pilates', pilateColor),
//               Legend('Quick workouts', quickWorkoutColor),
//               Legend('Cycling', cyclingColor),
//             ],
//           ),
//           const SizedBox(height: 14),
//           AspectRatio(
//             aspectRatio: 2,
//             child: BarChart(
//               BarChartData(
//                 alignment: BarChartAlignment.spaceBetween,
//                 titlesData: FlTitlesData(
//                   leftTitles: const AxisTitles(),
//                   rightTitles: const AxisTitles(),
//                   topTitles: const AxisTitles(),
//                   bottomTitles: AxisTitles(
//                     sideTitles: SideTitles(
//                       showTitles: true,
//                       getTitlesWidget: bottomTitles,
//                       reservedSize: 20,
//                     ),
//                   ),
//                 ),
//                 barTouchData: BarTouchData(enabled: false),
//                 borderData: FlBorderData(show: false),
//                 gridData: const FlGridData(show: false),
//                 barGroups: [
//                   generateGroupData(0, 2, 3, 2),
//                   generateGroupData(1, 2, 5, 1.7),
//                   generateGroupData(2, 1.3, 3.1, 2.8),
//                   generateGroupData(3, 3.1, 4, 3.1),
//                   generateGroupData(4, 0.8, 3.3, 3.4),
//                   generateGroupData(5, 2, 5.6, 1.8),
//                   generateGroupData(6, 1.3, 3.2, 2),
//                   generateGroupData(7, 2.3, 3.2, 3),
//                   generateGroupData(8, 2, 4.8, 2.5),
//                   generateGroupData(9, 1.2, 3.2, 2.5),
//                   generateGroupData(10, 1, 4.8, 3),
//                   generateGroupData(11, 2, 4.4, 2.8),
//                 ],
//                 maxY: 11 + (betweenSpace * 3),
//                 extraLinesData: ExtraLinesData(
//                   horizontalLines: [
//                     HorizontalLine(
//                       y: 3.3,
//                       color: pilateColor,
//                       strokeWidth: 1,
//                       dashArray: [20, 4],
//                     ),
//                     HorizontalLine(
//                       y: 8,
//                       color: quickWorkoutColor,
//                       strokeWidth: 1,
//                       dashArray: [20, 4],
//                     ),
//                     HorizontalLine(
//                       y: 11,
//                       color: cyclingColor,
//                       strokeWidth: 1,
//                       dashArray: [20, 4],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





























import 'package:dotcoder1/widgets/text/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';










///full my one


class BarChartSample2 extends StatefulWidget {
  BarChartSample2({super.key});
  final Color leftBarColor = AppColors.contentColorYellow;
  final Color rightBarColor = AppColors.contentColorRed;
  final Color avgColor =
  AppColors.contentColorOrange.avg(AppColors.contentColorRed);
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 18;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 40*10, 70*10, 50*10);
    final barGroup2 = makeGroupData(1, 90*10, 60*10, 40*10);
    final barGroup3 = makeGroupData(2, 50*10, 80*10, 40*10);
    final barGroup4 = makeGroupData(3, 35*10, 60*10, 40*10);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
    ];


    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child:

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text('Activities',style: k14B600style,),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
mainAxisAlignment: MainAxisAlignment.end,
                  children: [


                    Container(
                      height: 7,
                      width: 7,
                      color: const Color(0xff34A853),
                    ),
                    const SizedBox(width: 3,),
                    Text('Active',style: k8Grey400style,),
                    const SizedBox(width: 6,),
                    Container(
                      height: 7,
                      width: 7,
                      color: const Color(0xff34B3F1),
                    ),
                    const SizedBox(width: 3,),
                    Text('Pending',style: k8Grey400style,),
                    const SizedBox(width: 6,),
                    Container(
                      height: 7,
                      width: 7,
                      color: const Color(0xffE3E3E4),
                    ),
                    const SizedBox(width: 3,),
                    Text('delivered',style: k8Grey400style,)
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: BarChart(
                        swapAnimationDuration: const Duration(seconds: 2),
                      swapAnimationCurve: Curves.elasticInOut,
                      BarChartData(

                        gridData:FlGridData(drawVerticalLine: false,drawHorizontalLine: true,horizontalInterval: 2,getDrawingHorizontalLine: (value){
                          return const FlLine( color: Color(0x94d3d3d3),strokeWidth: 0.5);
                        }),



                        maxY: 11,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: const Color(0xff34B3F1),
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              final weekNames = ['Week1', 'Week2', 'Week3', 'Week4'];

                              return BarTooltipItem(
                                '${weekNames[group.x.toInt()]}: ${rod.toY.toInt()*10}%',
                                 const TextStyle(color:Colors.white,fontWeight: FontWeight.w500),
                              );
                            },
                          ),
                          touchCallback: (FlTouchEvent event, response) {
                            setState(() {
                              if (response != null &&
                                  response is! FlLongPressEnd &&
                                  response is! FlPanEndEvent) {
                                touchedGroupIndex =
                                    response.spot!.touchedBarGroupIndex;
                              } else {
                                touchedGroupIndex = -1;
                              }
                            });
                          },
                          // touchCallback: (FlTouchEvent event, response) {
                          //   if (response == null || response.spot == null) {
                          //     setState(() {
                          //       touchedGroupIndex = -1;
                          //       showingBarGroups = List.of(rawBarGroups);
                          //     });
                          //     return;
                          //   }
                          //
                          //   touchedGroupIndex = response.spot!.touchedBarGroupIndex;
                          //
                          //   setState(() {
                          //     if (!event.isInterestedForInteractions) {
                          //       touchedGroupIndex = -1;
                          //       showingBarGroups = List.of(rawBarGroups);
                          //       return;
                          //     }
                          //     showingBarGroups = List.of(rawBarGroups);
                          //     if (touchedGroupIndex != -1) {
                          //       var sum = 0.0;
                          //       for (final rod
                          //       in showingBarGroups[touchedGroupIndex].barRods) {
                          //         sum += rod.toY;
                          //       }
                          //       final avg = sum /
                          //           showingBarGroups[touchedGroupIndex]
                          //               .barRods
                          //               .length;
                          //
                          //       showingBarGroups[touchedGroupIndex] =
                          //           showingBarGroups[touchedGroupIndex].copyWith(
                          //             barRods: showingBarGroups[touchedGroupIndex]
                          //                 .barRods
                          //                 .map((rod) {
                          //               return rod.copyWith(
                          //                   toY: avg, color: widget.avgColor);
                          //             }).toList(),
                          //           );
                          //     }
                          //   });
                          // },
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: bottomTitles,
                              reservedSize: 25,
                            ),
                          ),
                          leftTitles: AxisTitles(

                            drawBelowEverything: false,
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 20,
                              interval: 2,
                              getTitlesWidget: leftTitles,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        barGroups: showingBarGroups,

                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff292D30),
      fontWeight: FontWeight.w400,
      fontSize: 6,
    );

    String text = '';
    if (value == 0) {
      text = '10%';
    } else if (value == 2) {
      text = '20%';
    }
    else if (value == 1) {
      text = '30%';
    }
    else if (value == 4) {
      text = '40%';
    }
    else if (value == 5) {
      text = '50%';
    }else if (value == 6) {
      text = '60%';
    }
    else if (value == 7) {
      text = '70%';
    }else if (value == 8) {
      text = '80%';
    }
    else if (value == 9) {
      text = '90%';
    }else if (value == 10) {
      text = '100%';
    }

    return SideTitleWidget(
      axisSide:meta.axisSide,
      space: 00,

      child: Text(text, style: style),
    );
  }

  final titles = <String>['Week1', 'Week2', 'Week3', 'Week4'];
  Widget bottomTitles(double value, TitleMeta meta) {
    final int index = value.toInt();
    if (index >= 0 && index < titles.length) {
      final Widget text = Text(
        titles[index],
        style: const TextStyle(
          color: Color(0xff292D30),
          fontWeight: FontWeight.w400,
          fontSize: 6,
        ),
      );

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 16, // margin top
        child: text,
      );
    }
    return Container();
  }









  BarChartGroupData makeGroupData(int x, double y1Percent, double y2Percent, double y3Percent) {
    return BarChartGroupData(
      barsSpace: 6,
      x: x,
      barRods: [
        BarChartRodData(
          borderRadius: BorderRadius.circular(6),
          toY: touchedGroupIndex == x ? (y1Percent/100) * 2 : y1Percent / 100.0,
          color: const Color(0xff34A853),
          width: width,
        ),
        BarChartRodData(
          borderRadius: BorderRadius.circular(6),
          toY: touchedGroupIndex == x ? (y2Percent/100 )*2 : y2Percent / 100.0,
          color: const Color(0xff34B3F1),
          width: width,
        ),
        BarChartRodData(
          borderRadius: BorderRadius.circular(6),
          toY: touchedGroupIndex == x  ? y3Percent *2 : y3Percent / 100.0,
          color: const Color(0xffE3E3E4),
          width: width,
        ),
      ],
    );
  }



  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}







extension ColorExtension on Color {
  /// Convert the color to a darken color based on the [percent]
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }

  Color lighten([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = percent / 100;
    return Color.fromARGB(
      alpha,
      (red + ((255 - red) * value)).round(),
      (green + ((255 - green) * value)).round(),
      (blue + ((255 - blue) * value)).round(),
    );
  }

  Color avg(Color other) {
    final red = (this.red + other.red) ~/ 2;
    final green = (this.green + other.green) ~/ 2;
    final blue = (this.blue + other.blue) ~/ 2;
    final alpha = (this.alpha + other.alpha) ~/ 2;
    return Color.fromARGB(alpha, red, green, blue);
  }
}

//
// class LegendWidget extends StatelessWidget {
//   const LegendWidget({
//     super.key,
//     required this.name,
//     required this.color,
//   });
//   final String name;
//   final Color color;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 10,
//           height: 10,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: color,
//           ),
//         ),
//         const SizedBox(width: 6),
//         Text(
//           name,
//           style: const TextStyle(
//             color: Color(0xff757391),
//             fontSize: 12,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class LegendsListWidget extends StatelessWidget {
//   const LegendsListWidget({
//     super.key,
//     required this.legends,
//   });
//   final List<Legend> legends;
//
//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 16,
//       children: legends
//           .map(
//             (e) => LegendWidget(
//           name: e.name,
//           color: e.color,
//         ),
//       )
//           .toList(),
//     );
//   }
// }
//
// class Legend {
//   Legend(this.name, this.color);
//   final String name;
//   final Color color;
// }









class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}