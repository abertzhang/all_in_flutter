#include "include/demo_plugin/demo_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "demo_plugin.h"

void DemoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  demo_plugin::DemoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
