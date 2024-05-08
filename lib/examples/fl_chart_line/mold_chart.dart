/*
 * create by zhangchunhua
 * fl_chart最新版本0.55.2
 * 本页使用fl_chart版本0.46.0
 */
import 'dart:math';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import 'mold_data_bean.dart';

// export 'src/r_padding.dart';
// export 'src/r_sizedbox.dart';
// export 'src/screen_util.dart';
// export 'src/screenutil_init.dart';
// export 'src/size_extension.dart';

// export 'package:flutter_screenutil/src/r_padding.dart';
// export 'package:flutter_screenutil/src/r_sizedbox.dart';
// export 'package:flutter_screenutil/src/screen_util.dart';
// export 'package:flutter_screenutil/src/screenutil_init.dart';
// export 'package:flutter_screenutil/src/size_extension.dart';

class MoldChart extends StatefulWidget {
  const MoldChart({Key? key, required this.source, required this.unit}) : super(key: key);
  final List<MoldDataDetailBean> source;
  final String unit;

  @override
  State<MoldChart> createState() => _MoldChartState();
}

class _MoldChartState extends State<MoldChart> {
  //图表数据
  List<FlSpot> spots = [];
  //预警值--黄线
  List<double> warningList = [];
  //告警值--红线
  List<double> alertList = [];
  //Y轴--最小值
  double minY = 0;
  //Y轴--最大值
  double maxY = 0;
  //Y轴--数字间隔
  double intervalY = 0;
  //Y轴是否有负数
  bool isNegativeY = false;
  //
  double cutOffY = 0;
  //是否要显示预警标题
  bool needWarningTitle = false;
  bool needAlertTitle = false;

  final List<Color> colors = [const Color(0xff1E88FF), const Color(0xFFFF8B52)];
  final List<Color> alertColors = [const Color(0xffffb820), Colors.red];

  void initData() {
    warningList.clear();
    alertList.clear();
    needWarningTitle = false;
    needAlertTitle = false;
    spots = List.generate(
      widget.source.length,
      (idx) => FlSpot(idx.toDouble(), widget.source[idx].pointValue ?? 0),
    );
    //原始数据--最大值
    double maxSource = spots.sorted((a, b) => a.y.compareTo(b.y)).last.y;
    //原始数据--最小值
    double minSource = spots.sorted((a, b) => a.y.compareTo(b.y)).first.y;
    isNegativeY = minSource < 0;
    intervalY = getInterval(max(maxSource.abs(), minSource.abs()));
    //计算y轴最大值--maxY
    if (maxSource > 0) {
      double tmp = maxSource / intervalY;
      maxY = tmp.ceil() * intervalY;
    } else {
      double tmp = maxSource / intervalY;
      maxY = tmp.ceil() * intervalY;
    }
    //计算y轴最小值--minY
    if (minSource > 0) {
      double tmp = minSource / intervalY;
      minY = tmp.floor() * intervalY;
    } else {
      double tmp = minSource / intervalY;
      minY = tmp.floor() * intervalY;
    }

    //如果有预警值或报警值,最小值和最大值比较
    //添加告警值,如果有正负值,告警值也有正负值
    if (ObjectUtil.isNotEmpty(widget.source.first.earlyValue)) {
      warningList.add(widget.source.first.earlyValue ?? 0);
      // if (isNegativeY && (widget.source.first.earlyValue ?? 0) > 0) warningList.add(-(widget.source.first.earlyValue ?? 0).abs());
      // if (!isNegativeY && (widget.source.first.earlyValue ?? 0) < 0) warningList.add((widget.source.first.earlyValue ?? 0).abs());
    }
    if (ObjectUtil.isNotEmpty(widget.source.first.analysisValue)) {
      alertList.add(widget.source.first.analysisValue ?? 0);
      // if (isNegativeY && (widget.source.first.analysisValue ?? 0) > 0) alertList.add(-(widget.source.first.analysisValue ?? 0).abs());
      // if (!isNegativeY && (widget.source.first.analysisValue ?? 0) < 0) alertList.add((widget.source.first.analysisValue ?? 0).abs());
    }

    //cutOffY
    if (minY < 0 && maxY >= 0) cutOffY = 0;
    if (minY < 0 && maxY < 0) cutOffY = maxY;
    if (minY >= 0) cutOffY = minY;
    //是否显示预警值和报警值
    if (ObjectUtil.isNotEmpty(warningList)) {
      for (var element in warningList) {
        if (element > maxY) needWarningTitle = true;
        if (element < minY) needWarningTitle = true;
        if (maxY / element.abs() > 5) needWarningTitle = true;
      }
    }
    if (ObjectUtil.isNotEmpty(alertList)) {
      for (var element in alertList) {
        if (element > maxY) needAlertTitle = true;
        if (element < minY) needAlertTitle = true;
        if (maxY / element.abs() > 5) needAlertTitle = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ObjectUtil.isEmpty(widget.source)) return const Text('暂无数据');
    initData();
    LogUtil.v(needWarningTitle);
    LogUtil.v(needAlertTitle);
    return Stack(
      children: [
        Positioned(
          right: 5,
          top: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (ObjectUtil.isNotEmpty(warningList) && needWarningTitle)
                ...List.generate(
                  warningList.length,
                  (index) => RichText(
                    text: TextSpan(
                      text: '预警值：',
                      style: const TextStyle(fontSize: 38, color: Color(0xff666666)),
                      children: [
                        TextSpan(text: warningList[index].toString(), style: TextStyle(fontSize: 38, color: alertColors.first)),
                        TextSpan(text: '${widget.unit}     ', style: TextStyle(fontSize: 38, color: alertColors.first)),
                      ],
                    ),
                  ),
                ),
              if (ObjectUtil.isNotEmpty(alertList) && needAlertTitle)
                ...List.generate(
                  alertList.length,
                  (index) => RichText(
                    text: TextSpan(
                      text: '报警值：',
                      style: const TextStyle(fontSize: 38, color: Color(0xff666666)),
                      children: [
                        TextSpan(text: alertList[index].toString(), style: TextStyle(fontSize: 38, color: alertColors.last)),
                        TextSpan(text: '${widget.unit}     ', style: TextStyle(fontSize: 38, color: alertColors.last)),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
        Container(
          width: MediaQueryData.fromWindow(window).size.width,
          height: 600,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
          child: LineChart(
            LineChartData(
              minY: minY,
              maxY: maxY,
              //点击显示
              lineTouchData: _buildLineTouchData(),
              //图表--数据
              lineBarsData: _buildLineBarsData(),
              //图表--边框
              borderData: _buildFlBorderData(),
              //图表--坐标
              titlesData: _buildFlTitlesData(),
              //图表--背景网格
              gridData: _buildFlGridData(),
              //图表--辅助线--水平或垂直
              extraLinesData: _buildExtraLinesData(),
            ),
          ),
        ),
      ],
    );
  }

  //图表--数据
  List<LineChartBarData> _buildLineBarsData() => [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          colors: [Get.theme.primaryColor],
          //折线以上渐变
          aboveBarData: BarAreaData(
            show: true,
            colors: [colors.first.withOpacity(0.1), Colors.white],
            cutOffY: cutOffY,
            applyCutOffY: true, //cutOffY以上不显示
            gradientFrom: const Offset(0, 1),
            //向下渐变,默认Offset(1,0)为向右渐变
            gradientTo: const Offset(0, -1),
            //图表--数据--折线以下渐变--垂直x轴的线
            spotsLine: BarAreaSpotsLine(show: false),
          ),
          //折线以下渐变
          belowBarData: BarAreaData(
            show: true,
            colors: [colors.first.withOpacity(0.1), Colors.white],
            cutOffY: cutOffY,
            applyCutOffY: true,
            gradientFrom: const Offset(0, -1),
            //向下渐变,默认Offset(1,0)为向右渐变
            gradientTo: const Offset(0, 1),
            //图表--数据--折线以下渐变--垂直x轴的线
            spotsLine: BarAreaSpotsLine(show: false),
          ),
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(radius: 2, color: colors[1], strokeWidth: 2, strokeColor: Colors.white);
            },
          ),
        )
      ];

  //四周边框
  FlBorderData _buildFlBorderData() => FlBorderData(
        show: true,
        border: const Border(left: BorderSide(width: 0.5, color: Color(0xff666666))),
      );

  //四周坐标
  FlTitlesData _buildFlTitlesData() => FlTitlesData(
        show: true,
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
        leftTitles: SideTitles(
          showTitles: true,
          margin: 5,
          reservedSize: 30,
          interval: intervalY,
          getTextStyles: (context, value) => const TextStyle(color: Color(0xFF666666), fontSize: 30),
          getTitles: (value) {
            if (value == 0) return value.toStringAsFixed(0);
            if (intervalY > 1) {
              return '${value.toInt()}';
            } else if (intervalY > 0.1) {
              return value.toStringAsFixed(1);
            } else if (intervalY > 0.01) {
              return value.toStringAsFixed(2);
            } else {
              return value.toStringAsFixed(3);
            }
          },
        ),
        bottomTitles: SideTitles(showTitles: false),
      );

  //图表--背景网格
  FlGridData _buildFlGridData() => FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        horizontalInterval: intervalY,
        checkToShowHorizontalLine: (valY) => valY != 0,
        getDrawingHorizontalLine: (val) {
          return FlLine(color: const Color(0xff999999), strokeWidth: 0.5, dashArray: [3, 6]);
        },
      );

  //图表--辅助线--水平
  ExtraLinesData _buildExtraLinesData() => ExtraLinesData(
        horizontalLines: [
          //底部的横线,minY大于0或maxY<0,否则画y=0的x轴
          if (minY >= 0 || maxY < 0) HorizontalLine(y: minY, color: const Color(0xFF999999), strokeWidth: 0.5) else HorizontalLine(y: 0, color: const Color(0xFF999999), strokeWidth: 0.5),
          ..._buildWarningLine(),
          ..._buildAlertLine(),
        ],
      );
  //图表--辅助线--水平--预警黄线
  List<HorizontalLine> _buildWarningLine() {
    return List.generate(
      warningList.length,
      (index) {
        //预警线超出最大值或最小值范围就显示预警线
        if (warningList[index] > maxY) return HorizontalLine(y: 0, color: Colors.transparent);
        if (warningList[index] < minY) return HorizontalLine(y: 0, color: Colors.transparent);
        //预警值与最大值相差太大不显示,如预警值0.8,最大值为40,相差50倍,与间隔值30相差30多倍
        if (maxY / warningList[index].abs() > 5) return HorizontalLine(y: 0, color: Colors.transparent);
        return HorizontalLine(
          y: warningList[index],
          strokeWidth: 1,
          dashArray: [3, 6, 6],
          color: alertColors.first,
          label: HorizontalLineLabel(
            show: true,
            alignment: Alignment.bottomRight,
            labelResolver: (horizontal) => '预警值:${horizontal.y.toStringAsFixed(1)}',
          ),
        );
      },
    );
  }

  //图表--辅助线--水平--报警红线
  List<HorizontalLine> _buildAlertLine() {
    return List.generate(
      alertList.length,
      (index) {
        //预警线超出最大值或最小值范围就显示预警线
        if (alertList[index] > maxY) return HorizontalLine(y: 0, color: Colors.transparent);
        if (alertList[index] < minY) return HorizontalLine(y: 0, color: Colors.transparent);
        if (maxY / alertList[index].abs() > 5) return HorizontalLine(y: 0, color: Colors.transparent);
        return HorizontalLine(
          y: alertList[index],
          strokeWidth: 1,
          dashArray: [3, 6, 6],
          color: alertColors.last,
          label: HorizontalLineLabel(
            show: true,
            alignment: Alignment.topLeft,
            labelResolver: (horizontal) => '报警值:${horizontal.y.toStringAsFixed(1)}',
          ),
        );
      },
    );
  }

  //点击显示内容
  LineTouchData _buildLineTouchData() => LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          maxContentWidth: 100,
          tooltipBgColor: Get.theme.primaryColor.withOpacity(0.6),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              const textStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30);
              int idx = touchedSpot.x.toInt();
              return LineTooltipItem('时间:${widget.source[idx].gatherTime}\n 值:${touchedSpot.y.toStringAsFixed(2)}', textStyle);
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
        getTouchLineStart: (data, index) => 0,
      );

  //计算 间隔值
  double getInterval(double maxAbs) {
    double tmpInterval;
    if (maxAbs <= 0.1) {
      tmpInterval = 0.02;
    } else if (maxAbs <= 1) {
      tmpInterval = 0.2;
    } else if (maxAbs <= 5) {
      tmpInterval = 1;
    } else if (maxAbs <= 10) {
      tmpInterval = 2;
    } else if (maxAbs < 20) {
      tmpInterval = 4;
    } else if (maxAbs < 50) {
      tmpInterval = 10;
    } else if (maxAbs < 100) {
      tmpInterval = 20;
    } else if (maxAbs < 150) {
      tmpInterval = 30;
    } else if (maxAbs < 200) {
      tmpInterval = 40;
    } else if (maxAbs < 300) {
      tmpInterval = 60;
    } else if (maxAbs < 400) {
      tmpInterval = 80;
    } else {
      tmpInterval = 100;
    }
    return tmpInterval;
  }
}
