//
//  CDFileManager.h
//  CDFileManager
//
//  Created by Roman Luxor on 03.02.12.
//  Copyright (c) 2012 Nuclominus. All rights reserved.
//

//  Класс по работе с (.\plist) 

#import <Foundation/Foundation.h>

@interface CDFileManager : NSObject

{
    
}

// создание файлов 
+(void)createFile:(NSString *)fileName;
+(void)createFile:(NSString *)fileName filePath:(NSString*)path;
+(void)createFile:(NSString *)fileName dataToFile:(NSMutableDictionary*)data;
+(void)createFile:(NSString *)fileName filePath:(NSString*)path dataToFile:(NSMutableDictionary *)data;

// запись в фаил Array
+(BOOL)writeToFile:(NSString *)fileName arrayToFile:(NSArray *)data;
// запись в фаил Dictionary
+(void)writeToFile:(NSString*)fileName dataToFile:(NSMutableDictionary*)data;
+(void)writeToFile:(NSString*)fileName dataToFile:(NSMutableDictionary*)data filePath:(NSString*)path;

//чтение из фавйла в Array
+(NSArray*)readFromFileToArray:(NSString *)fileName;
+(NSMutableDictionary*)readFromResourcePlistToDictionaryFromDocument:(NSString*)namePlist;
// чтение из файла
+(NSMutableDictionary*)readFromFile:(NSString*)fileName;
+(NSMutableDictionary*)readFromFile:(NSString*)fileName filePath:(NSString*)path;
+(NSMutableArray*)readFromResourcePlist:(NSString*)namePlist;
+(NSMutableDictionary*)readFromResourcePlistToDictionary:(NSString*)namePlist;
+(NSArray*)readPlistInDocumentsFolderToArray:(NSString*)name;
+(NSMutableDictionary*)readPlistInDocumentsFolderToDictionary:(NSString*)name;
// проверка наличия файлов
+(NSArray*)checkFileFromFile:(NSString*)path;

// удаление файла
+(void)deleteFile:(NSString*)filePath;

@end
