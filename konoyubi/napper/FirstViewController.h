//
//  FirstViewController.h
//  napper
//
//  Created by techcamp on 13/09/05.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Finger.h"
#import "AppDelegate.h"

@interface FirstViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    NSArray *LabelData2;
    NSArray *LabelData1;
    NSArray *Label_finger_id;
    NSArray *iconData;
    
    //    NSArray *testLabelData2;
    int list_id;
    
    //指の配列
//    NSArray *fingers;
    
}
@property (weak, nonatomic) IBOutlet UIButton *change_list;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
- (IBAction)tap_change_list:(id)sender;
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *mapbtn;
@property (weak, nonatomic) IBOutlet UIButton *mapBtn;

- (IBAction)nextpage:(id)sender;

@property (nonatomic, strong)AppDelegate *appDelegate;


////ヘッダーの高さを帰るテスト
//@property (nonatomic,strong)UIView *head;

@end
