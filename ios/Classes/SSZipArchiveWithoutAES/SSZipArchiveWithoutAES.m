//
//  SSZipArchiveWithoutAES.m
//  Runner
//
//  Created by Rostyk Stakhiv on 15.05.2021.
//

#import "SSZipArchiveWithoutAES.h"
#include <zlib.h>

@implementation SSZipArchiveWithoutAES

+ (BOOL)createZipFileAtPath:(NSString *)path withFilesAtPaths:(NSArray<NSString *> *)paths withPassword:(NSString *)password
{
    SSZipArchive *zipArchive = [[SSZipArchiveWithoutAES alloc] initWithPath:path];
    BOOL success = [zipArchive open];
    if (success) {
        for (NSString *filePath in paths) {
            success &= [zipArchive writeFile:filePath withPassword:password];
        }
        success &= [zipArchive close];
    }
    return success;
}

- (BOOL)writeFileAtPath:(NSString *)path withFileName:(nullable NSString *)fileName withPassword:(nullable NSString *)password
{
    return [self writeFileAtPath:path withFileName:fileName compressionLevel:Z_DEFAULT_COMPRESSION password:password AES:NO];
}

@end
