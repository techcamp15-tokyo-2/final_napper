//
//  SecondViewController.m
//  napper
//
//  Created by techcamp on 13/09/05.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
#import "Finger.h"
#import "MessageBoard.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    list_id=0;
    
    
    //ピッカーの設定
    picker = [[UIPickerView alloc] init];
    picker.frame = CGRectMake(0, 420, 320, 216);
    picker.showsSelectionIndicator = YES;
    picker.delegate = self;
    picker.dataSource = self;
//    [self.view addSubview:picker];
    
    _textFriend.delegate = self;
    [self showList];
}

-(void)showList{
    switch (list_id) {
        case 0:
            _listName.text = @"全員";
            break;
        case 1:
            _listName.text = @"サークル";
            break;
        case 2:
            _listName.text= @"学科の友達";
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)inputTitle:(id)sender {
}
- (IBAction)inputStart:(id)sender {
}
- (IBAction)inputFinish:(id)sender {
    
}

- (IBAction)inputPlace:(id)sender {
}
- (IBAction)inputFriend:(id)sender {
    
}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    //テキストフィールドの編集を始めるときに、ピッカーを呼び出す。
//    [self.view addSubview:picker];    
//    //キーボードは表示させない
//    return NO;
//}


- (IBAction)inputDetail:(id)sender {
}
- (IBAction)pushRegister:(id)sender {
//    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    Finger *tempfinger=[Finger alloc];
    tempfinger=[tempfinger initFinger:@"青木耀平" finger_title:_textTitle.text finger_startdate:_textStart.text finger_finishdate:_textFinish.text finger_place:_textPlace.text finger_detail:_textDetail.text gps_latitude:0 gps_longitude:0 list_id:list_id icon:[UIImage imageNamed:@"ameboy.png"] parsonN:0];
    _appDelegate.fingers = [_appDelegate.fingers arrayByAddingObject:tempfinger];
    
    //ここはテストだから後で消して
//    self.view.backgroundColor=[UIColor orangeColor];
//    NSLog(@"%@",tempfinger.finger_title);
//    for (Finger *f in _appDelegate.fingers) {
//               NSLog(@"%@", f.finger_title);
//    }
//    
//    [MessageBoard showMessageBoard:self.view message:@"登録しました"];
    
    

    
}
- (IBAction)pushbtn:(id)sender {
    list_id = ++list_id %3;
    [self showList];
}
@end
