//
//  SecondViewController.m
//  Block反向传值
//
//  Created by JackRen on 16/3/28.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic,weak) UITextField *textField;
@property (nonatomic,weak) UIButton *saveButton;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UITextField *textField =[[UITextField alloc] init];
    [self.view addSubview:textField];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField = textField;
    self.textField.frame = CGRectMake(100, 100, 100, 100);
    UIButton *save = [[UIButton alloc] init];
    [self.view addSubview:save];
    self.saveButton = save;
    self.saveButton.frame = CGRectMake(200, 200, 100, 70);
    [self.saveButton setTitle:@"确定" forState:UIControlStateNormal];
    self.saveButton.titleLabel.textColor = [UIColor blackColor];
    [self.saveButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) buttonClick:(id)sender{
    if ([self.delegate respondsToSelector:@selector(setTextField:)]) {
        NSString *text =self.textField.text;
        [self.delegate setTextfield:text];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) returnText:(returnBlock)block
{
    self.returnTextBlock = block;
}

- (void)viewDidDisappear:(BOOL)animated
{
    //即将消失的时候
    if (self.returnTextBlock !=nil) {
        self.returnTextBlock(self.textField.text);
    }
    NSLog(@"======%@=======",self.returnTextBlock);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
