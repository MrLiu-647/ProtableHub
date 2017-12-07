//
//  PHPageModel.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/12/7.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTBaseModel.h"
#import "PHPageItem.h"

typedef void(^ResponseBlock)(void);

@interface PHPageModel : DTBaseModel

@property (nonatomic,strong) NSMutableArray *repoInfo;
@property (nonatomic,strong) NSMutableArray *followerInfo;
@property (nonatomic,strong) NSMutableArray *followingInfo;

@property (nonatomic,copy) ResponseBlock phBlock;

+(PHPageModel *)sharedInstance;

-(void)getDataWithApi:(NSString *)api dataClass:(Class)className handler:(ResponseBlock)responseBlock;

@end
