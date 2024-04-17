//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <util_plugin/util_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) util_plugin_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UtilPlugin");
  util_plugin_register_with_registrar(util_plugin_registrar);
}
