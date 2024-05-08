import 'package:amap_flutter_base/amap_flutter_base.dart';

/// 定位结果 model
class Location {
  String? callbackTime; //返回时间
  String? locationTime; //定位时间
  String? locationType; //定位类型
  double? latitude; //纬度
  double? longitude; //经度
  double? accuracy; //精度
  double? altitude; //海拔
  double? bearing; //设备朝向/移动方向
  double? speed; //速度
  String? country; //国家
  String? province; //省
  String? city; //市
  String? district; //区
  String? street; //街道
  String? streetNumber; //路牌号
  String? cityCode; //城市编码
  String? adCode; //邮编
  String? address; //地址全称
  String? description; //地址描述
  String? errorCode; //错误码
  String? errorInfo; //错误信息

  LatLng get latLng => LatLng(latitude ?? 31.990481, longitude ?? 118.738142);

  Location({
    this.callbackTime,
    this.locationTime,
    this.address,
    this.altitude,
    this.bearing,
    this.country,
    this.province,
    this.city,
    this.cityCode,
    this.adCode,
    this.district,
    this.street,
    this.streetNumber,
    this.accuracy,
    this.speed,
    this.description,
    this.latitude,
    this.longitude,
    this.locationType,
    this.errorCode,
    this.errorInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'callbackTime': callbackTime,
      'locationTime': locationTime,
      'locationType': locationType,
      'latitude': latitude,
      'longitude': longitude,
      'accuracy': accuracy,
      'altitude': altitude,
      'bearing': bearing,
      'speed': speed,
      'country': country,
      'province': province,
      'city': city,
      'district': district,
      'street': street,
      'streetNumber': streetNumber,
      'cityCode': cityCode,
      'adCode': adCode,
      'address': address,
      'description': description,
      'errorCode': errorCode,
      'errorInfo': errorInfo,
    };
  }

  factory Location.fromMap(dynamic map) {
    if (null == map) return Location();
    var temp;
    return Location(
      callbackTime: map['callbackTime']?.toString(),
      locationTime: map['locationTime']?.toString(),
      locationType: map['locationType']?.toString(),
      latitude: null == (temp = map['latitude']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      longitude: null == (temp = map['longitude']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      accuracy: null == (temp = map['accuracy']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      altitude: null == (temp = map['altitude']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      bearing: null == (temp = map['bearing']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      speed: null == (temp = map['speed']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      country: map['country']?.toString(),
      province: map['province']?.toString(),
      city: map['city']?.toString(),
      district: map['district']?.toString(),
      street: map['street']?.toString(),
      streetNumber: map['streetNumber']?.toString(),
      cityCode: map['cityCode']?.toString(),
      adCode: map['adCode']?.toString(),
      address: map['address']?.toString(),
      description: map['description']?.toString(),
      errorCode: map['errorCode']?.toString(),
      errorInfo: map['errorInfo']?.toString(),
    );
  }
  @override
  String toString() {
    return 'Location{\naddress: $address,  \naltitude: $altitude, \nbearing: $bearing, \ncountry: $country, \nprovince: $province, \ncity: $city, \ncityCode: $cityCode, \nadCode: $adCode, \ndistrict: $district, \nstreet: $street, \nstreetNumber: $streetNumber, \naccuracy: $accuracy\n}';
  }
}
