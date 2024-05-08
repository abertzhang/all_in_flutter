import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import 'month_view.dart';
import 'weekday_row.dart';

// 区间 日期选择器
class CalendarList extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? selectedStartDate;
  final DateTime? selectedEndDate;
  final Function? onSelectFinish;

  CalendarList({
    super.key,
    required this.firstDate,
    required this.lastDate,
    this.onSelectFinish,
    this.selectedStartDate,
    this.selectedEndDate,
  }) : assert(!firstDate.isAfter(lastDate), 'lastDate must be on or after firstDate');

  @override
  _CalendarListState createState() => _CalendarListState();
}

class _CalendarListState extends State<CalendarList> {
  final double HORIZONTAL_PADDING = 25.0;
  ScrollController? _scrollController;
  DateTime? selectStartTime;
  DateTime? selectEndTime;
  late int yearStart;
  late int monthStart;
  late int yearEnd;
  late int monthEnd;
  int? count;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(initialScrollOffset: 0.0);

    // 传入的开始日期
    selectStartTime = widget.selectedStartDate;
    // 传入的结束日期
    selectEndTime = widget.selectedEndDate;
    yearStart = widget.firstDate.year;
    monthStart = widget.firstDate.month;
    yearEnd = widget.lastDate.year;
    monthEnd = widget.lastDate.month;
    count = monthEnd - monthStart + (yearEnd - yearStart) * 12 + 1;
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController!.dispose();
  }

  // 选项处理回调
  void onSelectDayChanged(dateTime) {
    if (selectStartTime == null && selectEndTime == null) {
      selectStartTime = dateTime;
    } else if (selectStartTime != null && selectEndTime == null) {
      selectEndTime = dateTime;
      // 如果选择的开始日期和结束日期相等，则清除选项
      if (selectStartTime == selectEndTime) {
        setState(() {
          selectStartTime = null;
          selectEndTime = null;
        });
        return;
      }
      // 如果用户反选，则交换开始和结束日期
      if (selectStartTime?.isAfter(selectEndTime!) ?? false) {
        DateTime? temp = selectStartTime;
        selectStartTime = selectEndTime;
        selectEndTime = temp;
      }
    } else if (selectStartTime != null && selectEndTime != null) {
      selectStartTime = null;
      selectEndTime = null;
      selectStartTime = dateTime;
    }
    setState(() {
      selectStartTime;
      selectEndTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 55.0,
              child: Container(
                padding: EdgeInsets.only(left: HORIZONTAL_PADDING, right: HORIZONTAL_PADDING),
                decoration: const BoxDecoration(
                  // border: Border.all(width: 3, color: Color(0xffaaaaaa)),
                  // 实现阴影效果
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 2.0), blurRadius: 1.0)],
                ),
                child: WeekdayRow(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 55.0, bottom: 100.0),
              child: CustomScrollView(
                reverse: true,
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        // int month = index + monthStart;
                        // DateTime calendarDateTime = DateTime(yearStart, month);
                        int month = monthEnd - index;
                        DateTime calendarDateTime = DateTime(yearEnd, month);
                        return _getMonthView(calendarDateTime);
                      },
                      childCount: count,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              height: 100.0,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 15.0, top: 15.0, bottom: 32.0, right: 15.0),
                decoration: const BoxDecoration(
                  // border: Border.all(width: 3, color: Color(0xffaaaaaa)),
                  // 实现阴影效果
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, -4.0), blurRadius: 4.0)],
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(const EdgeInsets.only(top: 15.0, bottom: 15.0)),
                          backgroundColor: MaterialStateProperty.resolveWith((states) {
                            if (ObjectUtil.isNotEmpty(selectStartTime) && ObjectUtil.isNotEmpty(selectStartTime)) {
                              return Theme.of(context).primaryColor;
                            }
                            return Colors.grey;
                          }),
                        ),
                        // color: selectStartTime != null && selectEndTime != null ? Theme.of(context).primaryColor : Colors.grey,
                        // padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        // textColor: Colors.white,
                        onPressed: _finishSelect,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          child: Text(
                            selectStartTime != null && selectEndTime == null ? "请选择结束时间" : '确  定',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _finishSelect() {
    if (selectStartTime != null) {
      widget.onSelectFinish!(selectStartTime, selectEndTime);
    }
  }

  Widget _getMonthView(DateTime dateTime) {
    int year = dateTime.year;
    int month = dateTime.month;
    return MonthView(
      context: context,
      year: year,
      month: month,
      padding: HORIZONTAL_PADDING,
      dateTimeStart: selectStartTime,
      dateTimeEnd: selectEndTime,
      todayColor: Colors.deepOrange,
      onSelectDayRang: (dateTime) => onSelectDayChanged(dateTime),
    );
  }
}
