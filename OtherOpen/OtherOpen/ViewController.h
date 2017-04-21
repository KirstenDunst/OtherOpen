//
//  ViewController.h
//  OtherOpen
//
//  Created by CSX on 2017/4/21.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuickLook/QuickLook.h>

@interface ViewController : UIViewController <QLPreviewControllerDataSource, QLPreviewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (copy, nonatomic) NSURL *fileURL;
@property (weak, nonatomic) NSData *da;

@end

