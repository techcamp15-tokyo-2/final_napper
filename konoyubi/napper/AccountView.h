//
//  AccountView.h
//  napper
//
//  Created by techcamp on 13/09/12.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Account.h"

@interface AccountView : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    NSArray *LabelFriendData;
    NSArray *FriendIcon;
}


@property(strong, nonatomic)AppDelegate *appDelegate;

@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (strong, nonatomic) IBOutlet UITableView *FriendTable;
@property (strong, nonatomic) IBOutlet UIButton *fbtn;
- (IBAction)pushFbtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *tbtn;
@property (strong, nonatomic) IBOutlet UIButton *pushTbtn;
@property (strong, nonatomic) IBOutlet UILabel *twitter_ID;
@property (weak, nonatomic) IBOutlet UIButton *reload;
- (IBAction)reloadBtn:(id)sender;


//苦肉の策
@property (strong, nonatomic) Account *tw;



@end
