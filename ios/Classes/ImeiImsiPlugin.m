#import "ImeiImsiPlugin.h"
#if __has_include(<imei_imsi_plugin/imei_imsi_plugin-Swift.h>)
#import <imei_imsi_plugin/imei_imsi_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "imei_imsi_plugin-Swift.h"
#endif

@implementation ImeiImsiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImeiImsiPlugin registerWithRegistrar:registrar];
}
@end
