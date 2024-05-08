/*
 * create by zhangchunhua
 */

/*
{
 "gatherTime" : "01:52",
 "pointValue" : "-32.44",
 "pointType" : "水平位移",
 "pointCode" : "400000000144",
 "analysisValue" : "0.8",
 "earlyValue" : "0.5"
}
 */
class MoldDataDetailBean {
  double? analysisValue; //报警阀值
  double? earlyValue; //预警阀值
  String? gatherTime;
  String? pointCode;
  String? pointType;
  double? pointValue;

  MoldDataDetailBean({
    this.analysisValue,
    this.earlyValue,
    this.gatherTime,
    this.pointCode,
    this.pointType,
    this.pointValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'analysisValue': analysisValue,
      'earlyValue': earlyValue,
      'gatherTime': gatherTime,
      'pointCode': pointCode,
      'pointType': pointType,
      'pointValue': pointValue,
    };
  }

  factory MoldDataDetailBean.fromMap(dynamic map) {
    if (null == map) return MoldDataDetailBean();
    var temp;
    return MoldDataDetailBean(
      analysisValue: null == (temp = map['analysisValue']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      earlyValue: null == (temp = map['earlyValue']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      gatherTime: map['gatherTime']?.toString(),
      pointCode: map['pointCode']?.toString(),
      pointType: map['pointType']?.toString(),
      pointValue: null == (temp = map['pointValue']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
    );
  }
}

class MoldDataBean {
  List<MoldDataDetailBean>? heightModelOne;
  List<MoldDataDetailBean>? heightModelTwo;
  List<MoldDataDetailBean>? heightModelThree;
  List<MoldDataDetailBean>? heightModelFour;

  MoldDataBean({
    this.heightModelOne,
    this.heightModelTwo,
    this.heightModelThree,
    this.heightModelFour,
  });

  Map<String, dynamic> toMap() {
    return {
      'heightModelOne': heightModelOne?.map((map) => map.toMap()).toList() ?? [],
      'heightModelTwo': heightModelTwo?.map((map) => map.toMap()).toList() ?? [],
      'heightModelThree': heightModelThree?.map((map) => map.toMap()).toList() ?? [],
      'heightModelFour': heightModelFour?.map((map) => map.toMap()).toList() ?? [],
    };
  }

  factory MoldDataBean.fromMap(dynamic map) {
    if (null == map) return MoldDataBean();
    var temp;
    return MoldDataBean(
      heightModelOne: null == (temp = map['heightModelOne']) ? [] : (temp is List ? temp.map((map) => MoldDataDetailBean.fromMap(map)).toList() : []),
      heightModelTwo: null == (temp = map['heightModelTwo']) ? [] : (temp is List ? temp.map((map) => MoldDataDetailBean.fromMap(map)).toList() : []),
      heightModelThree: null == (temp = map['heightModelThree']) ? [] : (temp is List ? temp.map((map) => MoldDataDetailBean.fromMap(map)).toList() : []),
      heightModelFour: null == (temp = map['heightModelFour']) ? [] : (temp is List ? temp.map((map) => MoldDataDetailBean.fromMap(map)).toList() : []),
    );
  }
}
