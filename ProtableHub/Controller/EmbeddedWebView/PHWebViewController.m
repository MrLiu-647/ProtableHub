//
//  PHWebViewController.m
//  ProtableHub
//
//  Created by 俞清源 on 2017/11/28.
//  Copyright © 2017年 俞清源. All rights reserved.
//

#import "PHWebViewController.h"

@interface PHWebViewController ()

@property (nonatomic,strong) WKWebView *phWebView;
@property (nonatomic,strong) UIProgressView *progress;
@property (nonatomic,strong) UIBarButtonItem *cancelBtn;
@property (nonatomic,strong) UIBarButtonItem *refreshBtn;

@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *codeString;    //向Github服务器请求得到的Code,需要这个Code来得到Token

@property (nonatomic,strong) UIViewController *rootVC;

@end

@implementation PHWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = @[self.rootVC];
}

-(void)loadWithRequestUrl:(NSString *)url {
    self.url = url;
    [self.phWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    self.rootVC.view = self.phWebView;
}

-(void)loadWithRequestUrl:(NSString *)url params:(NSDictionary *)params {
    NSString *completeUrl = [self handleRequestParams:params withUrl:url];
    [self loadWithRequestUrl:completeUrl];
}

-(NSString *)handleRequestParams:(NSDictionary *)params withUrl:(NSString *)url {
    NSMutableString *combineString = [[NSMutableString alloc] init];
    NSMutableString *combineUrl = [NSMutableString stringWithString:url];
    for (NSString *key in params) {
        [combineString appendFormat:@"%@=%@&",key,params[key]];
    }
    if(combineString.length != 0) {
        NSString *requestUrl = [[NSString alloc] initWithFormat:@"%@?%@",combineUrl,[combineString substringToIndex:combineString.length - 1]];
        return requestUrl;
    }
    else {
        return combineUrl;
    }
}

-(WKWebView *)phWebView {
    if(!_phWebView) {
        _phWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 44+UIApplication.sharedApplication.statusBarFrame.size.height, self.view.frame.size.width, self.view.frame.size.height - 44)];
        _phWebView.navigationDelegate = self;
        _phWebView.UIDelegate = self;
        [_phWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _phWebView;
}

-(UIViewController *)rootVC {
    if(!_rootVC) {
        _rootVC = [[UIViewController alloc] init];
        _rootVC.title = @"Login";
        _rootVC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cancel"] landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
        _rootVC.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh"] landscapeImagePhone:nil style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    }
    return _rootVC;
}

-(void)cancel {
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void)refresh {
    [self loadWithRequestUrl:self.url];
}

-(UIProgressView *)progress {
    if(!_progress) {
        _progress = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 42, self.view.bounds.size.width, 2)];
        [self.navigationBar addSubview:_progress];
    }
    return _progress;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.progress.progress = [change[@"new"] floatValue];
    if(self.progress.progress == 1.00) {
        self.progress.hidden = true;
    }
}

-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    if([webView.URL.query containsString:@"code"]) {
        self.codeString = [webView.URL.query substringFromIndex:5]; //截取code
        [NSNotificationCenter.defaultCenter postNotificationName:@"code" object:nil userInfo:@{@"code":self.codeString}];   //通知Controller
    }
    self.progress.hidden = false;
}

-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"%@开始加载内容",webView);
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    if(self.codeString.length != 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:true completion:nil];
        });
    }
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败%@",error);
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败%@",error);
    [self dismissViewControllerAnimated:true completion:nil];
}

//清除缓存
-(void)dealloc {
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        NSLog(@"清除缓存");
    }];
}

@end
