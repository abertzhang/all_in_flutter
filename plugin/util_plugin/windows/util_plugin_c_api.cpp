#include "include/util_plugin/util_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "util_plugin.h"

void UtilPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  util_plugin::UtilPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
