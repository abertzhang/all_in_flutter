class AppConfig {
  ///存储Key
  static const keyUser = 'userInfo';
  static const keyPhone = 'phone';
  static const keyUserId = 'userId';
  static const keyProvince = 'province';
  static const keyRoles = 'userRole';
  static const keyTokenExpireOut = 'token_OutTime';
  //收款核销搜索值,以数组方式
  static const keyPaymentSearch = 'keyPaymentSearch';

  ///阿里云存储各项服务的获取文件夹的入参值
  //验机
  static const serviceCheckDevice = 'hmy-assets';
  static const businessExitCheckDevice = 'exit-device-check'; //退场
  static const businessEnterCheckDevice = 'enter-device-check'; //进场

  //新增客户
  static const serviceCustom = 'hmy-crm';
  static const businessCustomCard = 'customer-id-card'; //个人身份证
  static const businessCustomCredential = 'customer-credential'; //企业营业执照

  //收款核销
  static const servicePayment = 'hmy-finance';
  static const businessEvidence = 'upload-receipt-offset'; //凭据

  //索赔
  static const serviceClaimant = 'hmy-fulfillment';
  static const businessClaimant = 'claim-picture'; //凭据

  //合同
  static const serviceContract = 'hmy-contract';
  static const businessAuthModify = 'authorizer-modify'; //授权人变更
  static const businessPaperContract = 'paper-contract'; //纸质合同
  static const businessSupplyContract = 'supply-contract'; //纸质合同

  ///高德
  // static const AMapApiKey amapApiKeys = AMapApiKey(
  //   androidKey: '5b7835172f79f4c39315d095b917596a',
  //   iosKey: '91d0099a2085f0df00af09466fd009c3',
  // );
  // static const AMapPrivacyStatement amapPrivacyStatement = AMapPrivacyStatement(
  //   hasContains: true,
  //   hasShow: true,
  //   hasAgree: true,
  // );
  static const defaultLat = 32.07677; //默认纬度--天马路8号
  static const defaultLng = 118.900442; //默认经度--天马路8号

  //微信分享
  static const wechatAppId = 'wx89b3a4e56215850f';
  static const wechatAppSecret = '239d2d773bc67eed02074d8048417e1b';
  static const universalLink = 'https://api-prd.hmyzl.cn/app/';
}
/*
- service-name: hmy-assets
        business-dirs:
          - business-key: batch-import-device
            store-dir: /assets/newMachineCheck/deviceFile
          - business-key: add-device
            store-dir: /assets/newMachineCheck/file
          - business-key: exit-device-check
            store-dir: /assets/deviceCheck/image
*/
