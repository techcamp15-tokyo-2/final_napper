//
//  SecondViewController.h
//  napper
//
//  Created by techcamp on 13/09/05.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SecondViewController : UIViewController{
 //   AppDelegate *appdelegate;
    UIPickerView *picker;
    
    NSInteger list_id;
}
@property (strong, nonatomic) IBOutlet UITextField *textTitle;
- (IBAction)inputTitle:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *textStart;
- (IBAction)inputStart:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *textFinish;
- (IBAction)inputFinish:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *textPlace;
- (IBAction)inputPlace:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *textFriend;
- (IBAction)inputFriend:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *textDetail;
- (IBAction)inputDetail:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *listName;

@property (strong, nonatomic) IBOutlet UIButton *registerBtn;
- (IBAction)pushRegister:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;
- (IBAction)pushbtn:(id)sender;


@property (nonatomic, strong)AppDelegate *appDelegate;






@end
