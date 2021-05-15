//
//  SSZipArchiveWithoutAES.m
//  Runner
//
//  Created by Rostyk Stakhiv on 15.05.2021.
//

#import "SSZipArchiveWithoutAES.h"
#include <zlib.h>

@implementation SSZipArchiveWithoutAES

- (BOOL)writeFileAtPath:(NSString *)path withFileName:(nullable NSString *)fileName withPassword:(nullable NSString *)password
{
    return [self writeFileAtPath:path withFileName:fileName compressionLevel:Z_DEFAULT_COMPRESSION password:password AES:NO];
}

@end
