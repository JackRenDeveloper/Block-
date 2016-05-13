//
//  SecondViewController.h
//  Block反向传值
//
//  Created by JackRen on 16/3/28.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol secondViewControllerDelegate
@optional - (void)setTextfield:(NSString *)text;
@end

typedef void(^returnBlock)(NSString *showText);

@interface SecondViewController : UIViewController

@property (nonatomic,strong) id delegate;
//声明block 属性
@property (nonatomic,strong) returnBlock returnTextBlock;
//声明 调用方法
- (void) returnText: (returnBlock)block;

@end
