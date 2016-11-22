//
//  DataBase.m
//  AddressContact
//
//  Created by mac on 16/11/22.
//  Copyright (c) 2016年 mac. All rights reserved.
//

#import "DataBase.h"
#import "FMDatabase.h"
#import "People.h"
#import "FMResultSet.h"
@implementation DataBase


+ (BOOL)openDataBase
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"myDataBase.sqlite"];
    if (!_DB)
    {
        _DB = [[FMDatabase alloc]initWithPath:path];
        
    }
    if ([_DB open]==NO) {
        NSLog(@"数据库打开失败");
    }
    [_DB shouldCacheStatements];
    return [_DB open];
}

+ (void)createPeopleDataBase
{
    if ([self openDataBase]) {
        NSString *sql = @"create table if not exists People(id integer primary key autoincrement not null unique ,name text)";
        [_DB executeUpdate:sql];
        if ([_DB executeUpdate:sql]==NO) {
            NSLog(@"People表创建失败");
        }
        [_DB close];
        
    }
}

+ (void)createTelDataBase
{
    if ([self openDataBase]) {
        NSString *sql = @"create table if not exists Tel(peopleID integer , num integer)";
        [_DB executeUpdate:sql];
        if ([_DB executeUpdate:sql]==NO) {
            NSLog(@"Tel表创建失败");
        }
        [_DB close];
        
    }
}
@end
