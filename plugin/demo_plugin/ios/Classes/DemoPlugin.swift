import Flutter
import UIKit

public class DemoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "demo_plugin", binaryMessenger: registrar.messenger())
    let instance = DemoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "addInt":
        var a:Int=10
        var b:Int=200
//        var a:Int = call?.arguments["a"]??0
//        var b:Int = call?.arguments["b"]??0
        result (a+b)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
