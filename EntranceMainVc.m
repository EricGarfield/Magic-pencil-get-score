//
//  MainVc.m
//  CityToCity
//
//  Created by Fsy on 2018/9/17.
//  Copyright © 2018年 Fsy. All rights reserved.
//

#import "EntranceMainVc.h"
#import "SVProgressHUD.h"
//#import "SVProgressHUD.h"
#import "Masonry.h"
#import "MBProgressHUD.h"
#import "GNetworking.h"

#define DAUL @"http://h5.yx8.cn/game/mofaqianbi/"

@interface EntranceMainVc () <UIWebViewDelegate>
@property (nonatomic, strong) UIImageView *backImv;
@property (nonatomic, strong) UIWebView *wbV;
@end

@implementation EntranceMainVc

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI {
    
    MBProgressHUD *mb = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    mb.mode = MBProgressHUDModeAnnularDeterminate;
    mb.label.text = @"Loading";
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.wbV];
    [self.wbV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:DAUL]]];
    
    self.backImv = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.backImv];
    [self.backImv setImage:[UIImage imageNamed:@"640-1136"]];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.backImv removeFromSuperview];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    [SVProgressHUD showErrorWithStatus:@"Network not connected"];
}


- (UIWebView *)wbV {
    
    if (_wbV == nil) {
        _wbV = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        
        _wbV.delegate = self;
        _wbV.scrollView.scrollEnabled = NO;
        _wbV.backgroundColor = [UIColor blackColor];
    }
    
    return _wbV;
}

@end
