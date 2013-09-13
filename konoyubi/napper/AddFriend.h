//
//  AddFriend.h
//  napper
//
//  Created by techcamp on 13/09/12.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface AddFriend : UIViewController {
    NSDictionary *status;
    NSDictionary *statuses;
    NSDictionary *new_statuses;
    NSArray *keys;
    
    
}
@property (weak, nonatomic) IBOutlet UIButton *addFriend;
- (IBAction)pushAddFriend:(id)sender;
@property (nonatomic, strong)AppDelegate *appDelegate;

@property (strong, nonatomic) IBOutlet UITextField *textMail;
- (IBAction)inputMail:(id)sender;



@end
