class AliBucketBean {
  String? securityToken;
  String? accessKeySecret;
  String? accessKeyId;
  String? expiration;
  String? bucketName;
  String? endpoint;
  //
  String? host;
  String? policy;
  String? accessId;
  String? signature;
  String? expire;
  String? dir;

  AliBucketBean({
    this.securityToken,
    this.accessKeySecret,
    this.accessKeyId,
    this.expiration,
    this.bucketName,
    this.endpoint,
    this.host,
    this.policy,
    this.accessId,
    this.signature,
    this.expire,
    this.dir,
  });

  factory AliBucketBean.fromMap(dynamic map) {
    if (null == map) return AliBucketBean();
    var temp;
    return AliBucketBean(
      securityToken: map['securityToken']?.toString(),
      accessKeySecret: map['accessKeySecret']?.toString(),
      accessKeyId: map['accessKeyId']?.toString(),
      expiration: map['expiration']?.toString(),
      bucketName: map['bucketName']?.toString(),
      endpoint: map['endpoint']?.toString(),
      host: map['host']?.toString(),
      policy: map['policy']?.toString(),
      accessId: map['accessId']?.toString(),
      signature: map['signature']?.toString(),
      expire: map['expire']?.toString(),
      dir: map['dir']?.toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'securityToken': securityToken,
      'accessKeySecret': accessKeySecret,
      'accessKeyId': accessKeyId,
      'expiration': expiration,
      'bucketName': bucketName,
      'endpoint': endpoint,
      'host': host,
      'policy': policy,
      'accessId': accessId,
      'signature': signature,
      'expire': expire,
      'dir': dir,
    };
  }
}
