//
//  DTBaseItem.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/26.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTBasicItem.h"

@interface DTBaseItem : DTBasicItem

-(void)addMappingRuleProperty:(NSString *)propertyName pathInJson:(NSString *)path;

-(NSMutableDictionary *)getJsonPathDic;

-(id)loadStorageFromLocal;

@end
