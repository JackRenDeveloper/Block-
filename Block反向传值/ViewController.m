//
//  ViewController.m
//  Block反向传值
//
//  Created by JackRen on 16/3/28.
//  Copyright © 2016年 JackRen. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()<secondViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *secTextField;
@property (nonatomic,strong) SecondViewController *secVc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    [secondVc returnText:^(NSString *showText) {
        NSLog(@"---------%@------------",showText);
        self.secTextField.text = showText;
    }];
    self.secVc = secondVc;
    self.secVc.delegate = self;
}


#pragma mark - secondViewControllerDelegate
- (void)setTextfield:(NSString *)text{
    self.textField.text = text;
    NSLog(@"%@",text);
}

- (IBAction)gengxin:(id)sender {
    [self presentViewController:self.secVc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
