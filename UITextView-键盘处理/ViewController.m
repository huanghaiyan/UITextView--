//
//  ViewController.m
//  UITextView-键盘处理
//
//  Created by 黄海燕 on 15/11/29.
//  Copyright © 2015年 Haiyan Huang. All rights reserved.
//

#import "ViewController.h"
#import "XHMessageTextView.h"
@interface ViewController ()<UITextViewDelegate>
@property (nonatomic,strong) XHMessageTextView *myTextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = button;
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    _myTextView = [[XHMessageTextView alloc]initWithFrame:CGRectMake(0, 64, 320, 200)];
    _myTextView.delegate = self;
    _myTextView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_myTextView];
    
}

#pragma mark - textView代理方法
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (textView == self.myTextView) {
        if (range.location > 0||range.location > 0){
            self.navigationItem.rightBarButtonItem.enabled= YES;

            return YES;
        }else{
            self.navigationItem.rightBarButtonItem.enabled= NO;
            
            return YES;

        }
        
    }
    
    return YES;
}

-(void)rightAction
{
    
    if (_myTextView.text == nil ||_myTextView.text.length == 0) {
        NSLog(@"请先填写简历内容");
    }else{
        NSLog(@"_myTextView.text:%@",_myTextView.text);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
