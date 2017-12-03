//
//  DTAlertController.m
//  DailyTopic
//
//  Created by 俞清源 on 2017/10/31.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "DTAlertController.h"

@implementation DTAlertController

+(DTAlertController *)sharedInstance {
    static DTAlertController *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(instance == nil) {
            instance = [[DTAlertController alloc] init];
        }
    });
    return instance;
}

-(void)showAlertWithController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)alertStyle management:(NSDictionary *)handlers {
    alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];
    
    //默认会有一个取消选项
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:defaultAction];

    for (NSString *key in handlers) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:key style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            ((Callback)handlers[key])(nil);
        }];
        [alertController addAction:action];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewController presentViewController:alertController animated:true completion:^{
            alertController = nil;
        }];
    });
}

-(void)showAlertWithController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)alertStyle management:(NSDictionary *)handlers textfieldTitles:(NSArray *)titles textfieldHandlers:(NSArray *)textfieldCustom {
    alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];
    
    //默认会有一个取消选项
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:defaultAction];
    
    __block NSInteger flag = 0;
    
    //添加textfield
    if(titles.count != 0 && alertStyle != UIAlertControllerStyleActionSheet) {
        for (NSString *key in titles) {
            __weak typeof(alertController) weakAlert = alertController;
            [weakAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder = key;
                textField.delegate = self;
                if(flag<=titles.count && flag<=textfieldCustom.count && textfieldCustom[flag] != NSNull.null) {
                    ((Callback)textfieldCustom[flag])(textField);
                }
                else {
                    NSLog(@"未给UITextField定制");
                }
                flag++;
            }];
        }
    }
    
    NSArray *textFields = alertController.textFields;
    
    for (NSString *key in handlers) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:key style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if(textFields.count != 0) {
                NSMutableArray *result = [[NSMutableArray alloc] init];
                for (UITextField *handler in textFields) {
                    [result addObject:handler.text];
                }
                ((Callback)handlers[key])(result);
            }
            else {
                ((Callback)handlers[key])(nil);
            }
        }];
        [alertController addAction:action];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewController presentViewController:alertController animated:true completion:^{
            alertController = nil;
        }];
    });
}

-(void)showProgressAlertWithController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message {
    if(title.length == 0 || title == nil) {
        title = @"上传中";
    }
    if(message.length == 0 || message == nil) {
        message = @"请稍等";
    }
    alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    progressExtent = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressExtent.center = CGPointMake(135,70);
    [alertController.view addSubview:progressExtent];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [viewController presentViewController:alertController animated:false completion:nil];
    });
}

///给与进度条百分比数值,如果extent传入为负数,则说明任务失败
-(void)updateProgress:(Float64)extent {
    dispatch_async(dispatch_get_main_queue(), ^{
        progressExtent.progress = extent;
        if(progressExtent.progress == 1.0) {
            [alertController setTitle:@"任务完成"];
            [alertController setMessage:@"完成"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alertController dismissViewControllerAnimated:true completion:nil];
            });
        }
        if(extent < 0) {
            [alertController setTitle:@"任务失败"];
            [alertController setMessage:@"失败"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alertController dismissViewControllerAnimated:true completion:nil];
            });
        }
    });
}

///限制输入字数
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if([string isEqualToString:@" "]){
        return false;
    }
    if(textField.text.length > 20){
        textField.text = [textField.text substringToIndex:20];
    }
    return true;
}

@end
