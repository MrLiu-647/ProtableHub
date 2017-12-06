//
//  DTBaseItem.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/26.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBaseItem.h"

@interface DTBaseItem()

@property (nonatomic,strong) NSMutableDictionary *jsonDataMap;

@end

@implementation DTBaseItem

-(NSMutableDictionary *)jsonDataMap {
    if(!_jsonDataMap) {
        _jsonDataMap = [[NSMutableDictionary alloc] init];
    }
    return _jsonDataMap;
}

-(void)addMappingRuleProperty:(NSString *)propertyName pathInJson:(NSString *)path {
    [self.jsonDataMap setObject:path forKey:propertyName];
}

-(NSMutableDictionary *)getJsonPathDic {
    return self.jsonDataMap;
}

-(id)loadStorageFromLocal {
    NSDictionary *pathDic = [self getJsonPathDic];
    for (NSString *key in pathDic) {
        if([[NSUserDefaults standardUserDefaults] valueForKey:key]) {
            [self setValue:[[NSString alloc] initWithFormat:@"%@",[NSUserDefaults.standardUserDefaults valueForKey:key]] forKey:key];
        }
    }
    return self;
}

@end
