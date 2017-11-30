//
//  PHWebViewController.h
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/28.
//  Copyright © 2017年 俞清源. All rights reserved.
//  https://github.com/login/oauth/authorize?client_id=17bac256e23969714fa5

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface PHWebViewController : UINavigationController<WKUIDelegate,WKNavigationDelegate>

-(void)loadWithRequestUrl:(nonnull NSString *)url;
-(void)loadWithRequestUrl:(nonnull NSString *)url params:(nullable NSDictionary *)params;

@end
