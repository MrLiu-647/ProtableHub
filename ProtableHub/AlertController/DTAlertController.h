//
//  DTAlertController.h
//  DailyTopic
//
//  Created by 俞清源 on 2017/10/31.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Callback)(id);

@interface DTAlertController:UIAlertController <UITextFieldDelegate> {
    UIProgressView *progressExtent;
    __block UIAlertController *alertController;
}

+(DTAlertController *)sharedInstance;

/**
 根据输入的样式和参数来定制UIAlertController(不带UITextField),默认会有取消选项

 @param viewController 调用UIAlertController的ViewController对象
 @param title 标题
 @param message 信息
 @param alertStyle 警告栏样式
 @param handlers 需要添加的Action,以字典形式传入,key为Action名,value为一个block代表action所执行的事件
 */
-(void)showAlertWithController:(UIViewController *)viewController
                         title:(NSString *)title
                       message:(NSString *)message
                         style:(UIAlertControllerStyle)alertStyle
                    management:(NSDictionary *)handlers;
/**
 根据输入的样式和参数来定制UIAlertController和UITextField,默认会有取消选项

 @param viewController 调用UIAlertController的ViewController对象
 @param title 标题
 @param message 信息
 @param alertStyle 警告栏样式
 @param handlers 需要添加的Action,以字典形式传入,key为Action名,value为一个block代表action所执行的事件
 @param titles textfield,仅在UIAlertControllerStyleActionSheet下使用,以数组传入textfield的placeholder即可,具有textfield,需要在Action的闭包中提供response参数,用来接收textfield的内容
 @param textfieldCustom 用户可通过待UITextField参数的闭包对UITextField进行定制,默认已经设置好UITextField的delegate和placeholder
 */
-(void)showAlertWithController:(UIViewController *)viewController
                         title:(NSString *)title
                       message:(NSString *)message
                         style:(UIAlertControllerStyle)alertStyle
                    management:(NSDictionary *)handlers
               textfieldTitles:(NSArray *)titles
             textfieldHandlers:(NSArray *)textfieldCustom;
/**
 上传图片等需要等待的任务时的警告框

 @param viewcontroller 调用UIAlertController的ViewController对象
 @param title 标题
 @param message 信息
 */
-(void)showProgressAlertWithController:(UIViewController *)viewcontroller
                         title:(NSString *)title
                       message:(NSString *)message;
/**
 更新进度条,与showProgress方法同步使用

 @param extent 进度条百分比
 */
-(void)updateProgress:(Float64)extent;

@end
