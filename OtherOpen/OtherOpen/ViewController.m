//
//  ViewController.m
//  OtherOpen
//
//  Created by CSX on 2017/4/21.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIWebView *web;
    UIImageView * imageView;
}

@end

@implementation ViewController

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller
{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
    return self.fileURL;
}

- (CGRect)previewController:(QLPreviewController *)controller frameForPreviewItem:(id<QLPreviewItem>)item inSourceView:(UIView *__autoreleasing  _Nullable *)view
{
    return self.view.bounds;
}

- (void)previewControllerWillDismiss:(QLPreviewController *)controller
{
    [self.label setText:[self.fileURL lastPathComponent]];
}

- (void)setDa:(NSData *)da{
    if (_da!= da) {
        _da = da;
    }
    imageView.image = [UIImage imageWithData:da];
    
//    [web loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: [[NSBundle mainBundle] pathForResource:@"iphone4" ofType:@"pdf"]]]];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(100, 100, 100, 100);
    
    [self.view addSubview:imageView];
    
    
//    web = [[UIWebView alloc]init];
//    web.frame = self.view.frame;
//    [self.view addSubview:web];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
