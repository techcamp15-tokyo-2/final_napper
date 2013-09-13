//
//  RegistTwitter.h
//  napper
//
//  Created by techcamp on 13/09/12.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface RegistTwitter : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *textID;
- (IBAction)inputID:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *TextPass;
- (IBAction)inputPass:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *rBtn;
- (IBAction)pushRBtn:(id)sender;

@property (strong ,nonatomic) AppDelegate *appDelegate;




@end
