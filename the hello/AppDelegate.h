//
//  AppDelegate.h
//  the hello
//
//  Created by 臧 传志 on 2018/10/22.
//  Copyright © 2018年 臧 传志. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
    NSString *zselectid;
    NSString *zindex;
}

@property (nonatomic, retain) NSString *zselectid;
@property (nonatomic, retain) NSString *zindex;
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

