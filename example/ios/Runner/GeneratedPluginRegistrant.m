//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_zip_archive/FlutterZipArchivePlugin.h>)
#import <flutter_zip_archive/FlutterZipArchivePlugin.h>
#else
@import flutter_zip_archive;
#endif

#if __has_include(<path_provider/PathProviderPlugin.h>)
#import <path_provider/PathProviderPlugin.h>
#else
@import path_provider;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterZipArchivePlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterZipArchivePlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
}

@end
