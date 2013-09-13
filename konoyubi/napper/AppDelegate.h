//
//  AppDelegate.h
//  napper
//
//  Created by techcamp on 13/09/05.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Account.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
 
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSArray *fingers;
@property (strong, nonatomic) Account *myAccount;
@property (strong, nonatomic) NSArray *myfriend;
@property (strong, nonatomic) NSArray *allAccount;



//タッチしたスタンプの座標を記録
@property (nonatomic) CGPoint myPoint;

//苦肉の策
@property (nonatomic, assign) int f;
@property (nonatomic, assign)Account *acc;

@end
