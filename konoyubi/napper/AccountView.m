////
//  AccountView.m
//  napper
//
//  Created by techcamp on 13/09/12.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "AccountView.h"
#import "AppDelegate.h"
#import "Account.h"

@implementation AccountView

@synthesize tw;
@synthesize twitter_ID;

int c=0;

- (void)viewDidLoad
{
     _appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    tw = _appDelegate.acc;
    
    NSLog(@"name=%@",_appDelegate.myAccount.name);
    _Name.text=_appDelegate.myAccount.name;
    _icon.image = _appDelegate.myAccount.icon;
    if (_appDelegate.myAccount.twitter_name !=nil)
    twitter_ID.text = [NSString stringWithString:_appDelegate.myAccount.twitter_name];
    
    NSLog(@"delegateします");
    _FriendTable.delegate = self;
    NSLog(@"delegate完了");
    
    _FriendTable.dataSource = self;
    NSLog(@"detaSource完了");
    
    //myAccountから友達の名前とiconを取得する
    LabelFriendData=[[NSArray alloc] initWithObjects:nil];
    NSLog(@"ココは？");
    FriendIcon=[[NSArray alloc] initWithObjects:nil];
//    LabelFriendData = [NSMutableArray array];
//    FriendIcon = [NSMutableArray array];
    NSLog(@"ココは？2");
   // NSLog(@"%d",[_appDelegate.myAccount.friends count]);
//    NSLog(@"%@",_appDelegate.myAccount.friends);
    
    
    
    for(Account *f in _appDelegate.myfriend){
        NSLog(@"フレンドをdataに登録");
        LabelFriendData = [LabelFriendData arrayByAddingObject:f.name];
        FriendIcon = [FriendIcon arrayByAddingObject:f.icon];
    }
    NSLog(@"ココは？3");
    
    
    
    
    //[self.FriendTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [LabelFriendData count];
    NSLog(@"テーブルの行を返します");
    //return 5;
}

-(UIView *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (0) {
        case 0: return @"友人一覧";
            break;
        case 1: return @"サークル";
            break;
        case 2: return @"学科の友達";
            
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    for(Account *f in _appDelegate.myfriend){
//        NSLog(@"フレンドをdataに登録");
//        LabelFriendData = [LabelFriendData arrayByAddingObject:f.name];
//        FriendIcon = [FriendIcon arrayByAddingObject:f.icon];
//    }
    NSLog(@"%d",_appDelegate.f);
    NSLog(@"%@",_appDelegate.acc);
    
    
    NSLog(@"ココすらきてないの？");
    
    static NSString *CellIdentifier = @"myCell2";
    
    NSLog(@"セルの設定に張りました");
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UILabel *label1 = (UILabel*)[cell viewWithTag:1];
   // label1.text=@"saaaaaa";
    label1.text = [LabelFriendData objectAtIndex:indexPath.row];
    NSLog(@"ラベル張りますよ");
    
    UIImageView *iconImg = (UILabel*)[cell viewWithTag:2];
  //  iconImg.image = [UIImage imageNamed:@"ameboy3.png"];
    iconImg.image = [FriendIcon objectAtIndex:indexPath.row];
    
    return cell;
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    
//    
//    [super viewWillAppear:animated];
//    
//    _appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
//
//    
////    NSLog(@"%@",_appDelegate.myAccount.twitter_name);
//    if(c==0){
//        if (_appDelegate.myAccount.twitter_name)
//            if(![twitter_ID.text isEqualToString:@"nappertest"]){
//                c=1;
//                NSLog(@"c=%d",c);
//            }
//        NSLog(@"c=%d",c);
//            twitter_ID.text = [NSString stringWithString:_appDelegate.myAccount.twitter_name];
//                 }
//        
//    
//}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [_FriendTable reloadData];
//    [super viewWillAppear:animated];
//}



- (IBAction)pushFbtn:(id)sender {
}
- (IBAction)reloadBtn:(id)sender {
    
    
    
    if(_appDelegate.f==1){
        NSLog(@"tw=%@",tw);
        LabelFriendData = [LabelFriendData arrayByAddingObject:tw.name];
        FriendIcon = [FriendIcon arrayByAddingObject:tw.icon];
        _appDelegate.f=-1;
    }
    
    [self.FriendTable reloadData];
}
@end
