// import 'package:flutter/material.dart';
// import 'package:flutter_picker/Picker.dart';
//
// const double kPickerHeight = 216.0;
// const double kItemHeight = 40.0;
// const Color kBtnColor = Color(0xFF323232); //50
// const Color kTitleColor = Color(0xFF787878); //120
// const double kTextFontSize = 15.0;
//
// typedef StringClickCallback = void Function(int selectIndex, Object? selectStr);
// typedef ArrayClickCallback = void Function(List<int> selecteds, List<dynamic> strData);
// typedef DateClickCallback = void Function(dynamic selectDateStr, dynamic selectDate);
//
// enum DateType {
//   YMD, // y, m, d
//   YM, // y ,m
//   YMD_HM, // y, m, d, hh, mm
//   YMD_AP_HM, // y, m, d, ap, hh, mm
// }
//
// class PickerUtil {
//   // 单列
//   static void showStringPicker<T>(
//     BuildContext context, {
//     required List<T> data,
//     String? title,
//     int? normalIndex,
//     PickerDataAdapter? adapter,
//     required StringClickCallback clickCallBack,
//   }) {
//     openModalPicker(context, adapter: adapter ?? PickerDataAdapter(pickerdata: data, isArray: false), clickCallBack: (
//       Picker picker,
//       List<int> selectedList,
//     ) {
//       clickCallBack(selectedList[0], data[selectedList[0]]);
//     }, selectedList: [normalIndex ?? 0], title: title);
//   }
//
//   // 多列
//   static void showArrayPicker<T>(
//     BuildContext context, {
//     required List<T> data,
//     String? title,
//     List<int>? normalIndex,
//     PickerDataAdapter? adapter,
//     required ArrayClickCallback clickCallBack,
//   }) {
//     openModalPicker(context, adapter: adapter ?? PickerDataAdapter(pickerdata: data, isArray: true), clickCallBack: (
//       Picker picker,
//       List<int> selectedList,
//     ) {
//       clickCallBack(selectedList, picker.getSelectedValues());
//     }, selectedList: normalIndex, title: title);
//   }
//
//   static void openModalPicker(
//     BuildContext context, {
//     required PickerAdapter adapter,
//     String? title,
//     List<int>? selectedList,
//     required PickerConfirmCallback clickCallBack,
//   }) {
//     Picker(
//             adapter: adapter,
//             title: Text(title ?? "请选择", style: const TextStyle(color: kTitleColor, fontSize: kTextFontSize)),
//             selecteds: selectedList,
//             cancelText: '取消',
//             confirmText: '确定',
//             cancelTextStyle: const TextStyle(color: kBtnColor, fontSize: kTextFontSize),
//             confirmTextStyle: const TextStyle(color: Color(0xFF499BF8), fontSize: kTextFontSize),
//             textAlign: TextAlign.right,
//             itemExtent: kItemHeight,
//             height: kPickerHeight,
//             selectedTextStyle: const TextStyle(color: Colors.black),
//             onConfirm: clickCallBack)
//         .showModal(context);
//   }
//
//   // 日期选择器
//   static void showDatePicker(
//     BuildContext context, {
//     DateType? dateType,
//     String? title,
//     DateTime? maxValue,
//     DateTime? minValue,
//     DateTime? value,
//     DateTimePickerAdapter? adapter,
//     required DateClickCallback clickCallback,
//   }) {
//     int timeType;
//     if (dateType == DateType.YM) {
//       timeType = PickerDateTimeType.kYM;
//     } else if (dateType == DateType.YMD_HM) {
//       timeType = PickerDateTimeType.kYMDHM;
//     } else if (dateType == DateType.YMD_AP_HM) {
//       timeType = PickerDateTimeType.kYMD_AP_HM;
//     } else {
//       timeType = PickerDateTimeType.kYMD;
//     }
//
//     openModalPicker(context,
//         adapter: adapter ??
//             DateTimePickerAdapter(
//               type: timeType,
//               isNumberMonth: true,
//               yearSuffix: "年",
//               monthSuffix: "月",
//               daySuffix: "日",
//               strAMPM: const ["上午", "下午"],
//               maxValue: maxValue,
//               minValue: minValue,
//               value: value ?? DateTime.now(),
//             ),
//         title: title, clickCallBack: (Picker picker, List<int> selecteds) {
//       var time = (picker.adapter as DateTimePickerAdapter).value;
//       String timeStr;
//       if (dateType == DateType.YM) {
//         timeStr = "${time!.year}年${time.month}月";
//       } else if (dateType == DateType.YMD_HM) {
//         timeStr = "${time!.year}年${time.month}月${time.day}日${time.hour}时${time.minute}分";
//       } else if (dateType == DateType.YMD_AP_HM) {
//         timeStr = "${time!.year}年${time.month}月${time.day}日${time.hour}时${time.minute}分";
//       } else {
//         timeStr = "${time!.year}年${time.month}月${time.day}日";
//       }
//       clickCallback(timeStr, picker.adapter.text);
//     });
//   }
// }
