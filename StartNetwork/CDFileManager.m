//
//  CDFileManager.m
//  CDFileManager
//
//  Created by Roman Luxor on 03.02.12.
//  Copyright (c) 2012 Nuclominus. All rights reserved.
//

#import "CDFileManager.h"

@implementation CDFileManager


/// функции создания файлов

// Создание файла в основном катологе
+(void)createFile:(NSString *)fileName

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    NSMutableArray * array = [[NSMutableArray alloc]init];
    [array writeToFile:newPlistFile atomically:YES];
}

// Создание файла в своем каталоге 
+(void)createFile:(NSString *)fileName filePath:(NSString *)path

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString * pathFolder = [NSString stringWithFormat:@"%@/%@/", documentFolder,path];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.plist",path,fileName]];
    
    NSFileManager *defaultManager;
    defaultManager = [NSFileManager defaultManager];
    
    if (![defaultManager fileExistsAtPath:path])
        [defaultManager createDirectoryAtPath:pathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    
    NSMutableArray * array = [[NSMutableArray alloc]init];
    [array writeToFile:newPlistFile atomically:YES];
    
}

// Создание файла с данными в основном каталоге
+(void)createFile:(NSString *)fileName dataToFile:(NSMutableDictionary*)data

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    [data writeToFile:newPlistFile atomically:YES];
    
    
}

// Создание файла с данными в своем каталоге
+(void)createFile:(NSString *)fileName filePath:(NSString *)path dataToFile:(NSMutableDictionary *)data

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString * pathFolder = [NSString stringWithFormat:@"%@/%@/", documentFolder,path];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.plist",path,fileName]];
    
    NSFileManager *defaultManager;
    defaultManager = [NSFileManager defaultManager];
    
    if (![defaultManager fileExistsAtPath:path])
        [defaultManager createDirectoryAtPath:pathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    
    [data writeToFile:newPlistFile atomically:YES];
    
    
}

// Запись в фаил Array
+(BOOL)writeToFile:(NSString *)fileName arrayToFile:(NSArray *)data
{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    NSLog(@"plist save path = %@", newPlistFile);
    [data writeToFile:newPlistFile atomically:YES];
    if (![data writeToFile:newPlistFile atomically:YES]) {
        NSLog(@"Array do not write to plist");
        return NO;
    }
    return YES;
}

// Запись в фаил Dictionary
+(void)writeToFile:(NSString *)fileName dataToFile:(NSMutableDictionary *)data

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    [data writeToFile:newPlistFile atomically:YES]; 
    
    
}

// Запись в фаил по пути
+(void)writeToFile:(NSString *)fileName dataToFile:(NSMutableDictionary *)data filePath:(NSString *)path

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString * pathFolder = [NSString stringWithFormat:@"%@/%@/", documentFolder,path];
    
    NSString *newPlistFile = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.plist",path,fileName]];
    
    NSFileManager *defaultManager;
    defaultManager = [NSFileManager defaultManager];
    
    if (![defaultManager fileExistsAtPath:path])
        [defaultManager createDirectoryAtPath:pathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    
    [data writeToFile:newPlistFile atomically:YES];
}


// Чтение из файла
+(NSMutableDictionary*)readFromFile:(NSString *)fileName

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    NSString *plistPath = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    NSMutableDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    return dict;
}

// Чтение из файла в Array с Document
+(NSArray*)readFromFileToArray:(NSString *)fileName

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    NSString *plistPath = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", fileName]];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:plistPath];
    NSLog(@"array = %@",array);
    return array;
}

// Чтение файла в Dictionary с Document
+(NSMutableDictionary*)readFromResourcePlistToDictionaryFromDocument:(NSString*)namePlist
{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    NSString *plistPath = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", namePlist]];
    
    NSMutableDictionary *array = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    for (NSString *str in array)
        NSLog(@"--%@", str);
    
    return array;
}

// Чтение файла из корневого проекта 
+(NSMutableDictionary*)readFromResourcePlistToDictionary:(NSString*)namePlist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      namePlist ofType:@"plist"];
    NSMutableDictionary *array = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    for (NSString *str in array)
        NSLog(@"--%@", str);
    
    return array;
}


// Чтение файла из корневого проекта 
+(NSMutableArray*)readFromResourcePlist:(NSString*)namePlist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      namePlist ofType:@"plist"];
    NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    return array;
}

// Чтение из файла по пути
+(NSMutableDictionary*)readFromFile:(NSString *)fileName filePath:(NSString *)path

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString * pathFolder = [NSString stringWithFormat:@"%@/%@/", documentFolder,path];
    
    NSString *plistPath = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@.plist",path,fileName]];
    
    NSFileManager *defaultManager;
    defaultManager = [NSFileManager defaultManager];
    
    if (![defaultManager fileExistsAtPath:path])
        [defaultManager createDirectoryAtPath:pathFolder withIntermediateDirectories:YES attributes:nil error:nil];
    
    
    NSMutableDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    return dict;
    
}


// выбор другого пути
+(NSArray*)readPlistInDocumentsFolderToArray:(NSString*)name {
    
    NSArray * array = [[NSArray alloc]init];
    
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    NSString *plistPath = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", name]];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        array = [self readFromFileToArray:name];
    }else{
        array = [self readFromResourcePlist:name];
    }
    
    return array;
}

+(NSMutableDictionary*)readPlistInDocumentsFolderToDictionary:(NSString*)name {
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc]init];
    
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    NSString *plistPath = [documentFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", name]];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        dict = [self readFromFile:name];
    }else{
        dict = [self readFromResourcePlistToDictionary:name];
    }
    
    return dict;
}



// Проверка наличия файлов по пути
+(NSArray*)checkFileFromFile:(NSString *)path

{
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    
    NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString stringWithFormat:@"%@/%@/",documentFolder,path] error:nil];
    
    for (int i = 0; i<[dirContents count ]; i++) {
        NSLog(@"document  = %@",[dirContents objectAtIndex:i]);
    }
    
    return dirContents;
    
}

// Удаление файла из основного каталога
+(void)deleteFile:(NSString *)filePath

{
    
    NSError *error;
    NSArray *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder = [documentPath objectAtIndex:0];
    
    NSString * result = @"";
    result = [result stringByAppendingFormat:[NSString stringWithFormat:@"%@",documentFolder]];
    result = [result stringByAppendingFormat:@"/"];
    result = [result stringByAppendingFormat:[NSString stringWithFormat:@"%@",filePath]];
    if ([[NSFileManager defaultManager] removeItemAtPath:result error:&error] != YES)
        NSLog(@"Unable to delete file: %@", [error localizedDescription]);
    
    
}

@end
