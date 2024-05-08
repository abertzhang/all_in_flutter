import 'package:flutter/material.dart';

import 'view/calendar_list.dart';

/// create by tjie
/// 日期选择范围控件
class CalendarManager {
  // 底部弹窗日历
  static Future<List<DateTime>?> showBottomCalendarList(
    BuildContext context, {
    required DateTime firstDate,
    required DateTime lastDate,
    DateTime? selectedStartDate,
    DateTime? selectedEndDate,
  }) async {
    List<DateTime>? result = <DateTime>[];

    result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 600.0,
          child: CalendarList(
            firstDate: firstDate,
            lastDate: lastDate,
            selectedStartDate: selectedStartDate,
            selectedEndDate: selectedEndDate,
            onSelectFinish: (selectStartTime, selectEndTime) {
              List<DateTime> result = <DateTime>[];
              result.add(selectStartTime);
              if (selectEndTime != null) {
                result.add(selectEndTime);
              }
              Navigator.pop(context, result);
            },
          ),
        );
      },
    );

    return result;
  }
}
