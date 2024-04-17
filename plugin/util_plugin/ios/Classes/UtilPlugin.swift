import Flutter
import UIKit

public class UtilPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "util_plugin", binaryMessenger: registrar.messenger())
    let instance = UtilPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getProxyInfo":
          result(getProxyInfo())
    default:
      result(FlutterMethodNotImplemented)
    }
  }
    ///获取代理信息
      private func getProxyInfo()->String?{
          guard let settings = CFNetworkCopySystemProxySettings()?.takeUnretainedValue(),
                let url = URL(string: "https://www.ping.com/")else{
              return nil
          }
          let proxys = CFNetworkCopyProxiesForURL((url as CFURL), settings).takeUnretainedValue() as NSArray
          guard let setting = proxys.firstObject as? NSDictionary,
                let _ = setting.object(forKey: (kCFProxyTypeKey as String)) as? String else{
              return nil
          }
          if let hostNam = setting.object(forKey: (kCFProxyTypeKey as String)),let port = setting.object(forKey: (kCFProxyPortNumberKey as String)){
              return "\(hostNam):\(port)"
          }
          return nil
      }
}
