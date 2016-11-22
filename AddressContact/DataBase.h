//
//  DataBase.h
//  AddressContact
//
//  Created by mac on 16/11/22.
//  Copyright (c) 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
static FMDatabase *_DB;
@interface DataBase : NSObject

+ (void)createPeopleDataBase;
+ (void)createTelDataBase;

+ (NSMutableArray *)selectPeopleBase;
+ (NSMutableArray *)selectTelBaseWithPeopleID:(NSInteger)peopleID;

+ (void)deletePeopleDataBaseWithPeopleID:(NSInteger)peopleID;
+ (void)deleteTelDataBaseWithNum:(NSInteger)num;
@end
