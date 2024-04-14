#ifndef FLUTTER_PLUGIN_DEMO_PLUGIN_H_
#define FLUTTER_PLUGIN_DEMO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace demo_plugin {

class DemoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DemoPlugin();

  virtual ~DemoPlugin();

  // Disallow copy and assign.
  DemoPlugin(const DemoPlugin&) = delete;
  DemoPlugin& operator=(const DemoPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace demo_plugin

#endif  // FLUTTER_PLUGIN_DEMO_PLUGIN_H_
