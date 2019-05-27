//
//  ViewController4.m
//  the hello
//
//  Created by 臧 传志 on 2019/5/27.
//  Copyright © 2019年 臧 传志. All rights reserved.
//

#import "ViewController4.h"
#import "AppDelegate.h"
@interface ViewController4 ()

@end

@implementation ViewController4


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.backBarButtonItem.title=@"返回";
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

- (IBAction)btn1click:(id)sender {
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.zindex=@"1";
    
    
}

- (IBAction)btn2click:(id)sender {
    
    AppDelegate *myDelegate = [[UIApplication sharedApplication] delegate];
    myDelegate.zindex=@"2";
}
@end
