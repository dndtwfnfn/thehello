//
//  ViewController.h
//  the hello
//
//  Created by 臧 传志 on 2018/10/22.
//  Copyright © 2018年 臧 传志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
 
    UILabel *zlabel;
    UILabel *zlabelstyle;
    
    UILabel *labela;
    UILabel *labelb;
    UILabel *labelc;
    UILabel *labeld;
    UILabel *labele;
   UILabel *labelf;
   UILabel *labelok;
       UILabel *labelcount;
}
@property (nonatomic,strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic,strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;

//- (IBAction)zsee:(id)sender;

@end

