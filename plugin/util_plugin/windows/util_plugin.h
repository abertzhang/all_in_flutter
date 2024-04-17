#ifndef FLUTTER_PLUGIN_UTIL_PLUGIN_H_
#define FLUTTER_PLUGIN_UTIL_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace util_plugin {

class UtilPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  UtilPlugin();

  virtual ~UtilPlugin();

  // Disallow copy and assign.
  UtilPlugin(const UtilPlugin&) = delete;
  UtilPlugin& operator=(const UtilPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace util_plugin

#endif  // FLUTTER_PLUGIN_UTIL_PLUGIN_H_
