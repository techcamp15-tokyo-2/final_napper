//
//  FirstViewController.m
//  napper
//
//  Created by techcamp on 13/09/05.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "FirstViewController.h"
#import "finger_detailViewController.h"
#import "Finger.h"
#import "AppDelegate.h"
#import "Account.h";

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    
    
    
//    //head
//    _head = [UIView alloc];
//    _head.frame = CGRectMake(0, 0, 100, 80);
//    
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                             target:self action:@selector(nextpage:)];
    self.navigationController.navigationItem.rightBarButtonItem = btn;
    
	// Do any additional setup after loading the view, typically from a nib.
    
    //指リストをテンプレートで初期化しようと思う
/*    fingers =[NSArray arrayWithObjects:nil];
    for(int i=0;i<5;i++){
        Finger *tempfinger=[Finger alloc];
        tempfinger=[tempfinger initFinger:@"青木太郎" finger_title:@"ラーメン食べたい" finger_startdate:@"12:30" finger_finishdate:@"14:30" finger_place:@"二郎" finger_detail:@"１０００円あれば足りるよ" gps_latitude:0 gps_longitude:0 list_id:0];
        fingers = [fingers arrayByAddingObject:tempfinger];
        //      NSLog(@"%@",tempfinger.finger_title);
    }
    NSLog(@"%@", fingers);
    for(int i=0;i<5;i++){
        Finger *tempfinger=[Finger alloc];
        tempfinger=[tempfinger initFinger:@"長嶋太郎" finger_title:@"ボーリング行きたい" finger_startdate:@"12:30" finger_finishdate:@"14:30" finger_place:@"渋谷" finger_detail:@"３ゲームくらい？" gps_latitude:0 gps_longitude:0 list_id:0];
        fingers = [fingers arrayByAddingObject:tempfinger];
        //       NSLog(@"%@",tempfinger.finger_title);
    }
    
    
    for (Finger *f in fingers) {
        //       NSLog(@"%@", f.finger_title);
    }
 */
    
    //AppDelegateから指リストを得たいと思った
    _appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //テスト
    for(Account *f in _appDelegate.myAccount.friends){
        NSLog(@"フレンドをdataに登録");
//        LabelFriendData = [LabelFriendData arrayByAddingObject:f.name];
//        FriendIcon = [FriendIcon arrayByAddingObject:f.icon];
    }
    NSLog(@"ココは？3");
    
    
    
    list_id=0;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // LabelData1=[[NSArray alloc] initWithObjects:@"長嶋岳志",@"青木耀平", nil];
    
    //ラベルに指の情報を張りたい
    LabelData1=[[NSArray alloc] initWithObjects:nil];
    LabelData2=[[NSArray alloc] initWithObjects:nil];
    Label_finger_id=[[NSArray alloc] initWithObjects:nil];
    iconData=[[NSArray alloc] initWithArray:nil];
/*    for(Finger *f in _appDelegate.fingers){
        //        NSLog(@"ラベルに情報張るよー！");
        LabelData1=[LabelData1 arrayByAddingObject:f.host_name];
        LabelData2=[LabelData2 arrayByAddingObject:f.finger_title];
    }
    //    testLabelData2=[[NSArray alloc] initWithObjects:@"ラーメン食べたい", nil];
*/
    [self showFingerList];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapBtn:(id)sender {
    NSLog(@"tapBtn");
/*    switch (list_id) {
        case 0:
            list_id=(++list_id)%3;
            break;
        case 1:
            list_id=(++list_id)%3;            //            tableView.title=@"全員";
            break;
        case 2:
            list_id=(++list_id)%3;
        default:
            break;
    }*/
    list_id=(++list_id)%3;
    [self showFingerList];
    [self.tableView reloadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [LabelData2 count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"myCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UILabel *label1 = (UILabel*)[cell viewWithTag:1];
    //  label1.text=@"長嶋";
    label1.text = [LabelData1 objectAtIndex:indexPath.row];
    
    UILabel *label2 = (UILabel*)[cell viewWithTag:2];
    label2.text = [LabelData2 objectAtIndex:indexPath.row];
    
    UIImageView *iconView=(UIImageView *)[cell viewWithTag:3];
    iconView.image = [iconData objectAtIndex:indexPath.row];
    
    //ここはlabelではなくcellに直接
    //cell.textLabel.text = [LabelData2 objectAtIndex:indexPath.row];
    
    //cellではなくlabelに直接
    /*    switch(list_id){
     case 0:
     list_id++;
     label2.text=nil;
     LabelData2=[[NSArray alloc] initWithObjects:@"ラーメン食べたい", nil];
     //        label2.text = [LabelData2 objectAtIndex:indexPath.row];
     break;
     case 1:
     list_id--;
     //        label2.text=nil;
     //         label2.text = [LabelData2 objectAtIndex:indexPath.row];
     
     break;
     }
     */
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (list_id) {
        case 0: return @"全員";
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"mySegue"]){
        finger_detailViewController *viewController = [segue destinationViewController];
        NSInteger selectedIndex = [[self.tableView indexPathForSelectedRow] row];
        viewController.finger_id = [[Label_finger_id objectAtIndex:selectedIndex] intValue];
        
    }
}

-(void)nextpage:(id)sender {
    NSLog(@"nextpage");
}

//list_idに対応するfingerをlabelに張るメソッド
-(void)showFingerList{
    LabelData1 = [NSMutableArray array];
    LabelData2 = [NSMutableArray array];
    iconData = [NSMutableArray array];
    Label_finger_id = [NSMutableArray array];
    switch (list_id) {
        case 0:
            for(Finger *f in _appDelegate.fingers){
                LabelData1=[LabelData1 arrayByAddingObject:f.host_name];
                LabelData2=[LabelData2 arrayByAddingObject:f.finger_title];
                iconData=[iconData arrayByAddingObject:f.icon];
                Label_finger_id=[Label_finger_id arrayByAddingObject:f.finger_id];
            }
            break;
        case 1:
            for(Finger *f in _appDelegate.fingers){
                if(f.list_id == list_id){
                    LabelData1=[LabelData1 arrayByAddingObject:f.host_name];
                    LabelData2=[LabelData2 arrayByAddingObject:f.finger_title];
                    iconData=[iconData arrayByAddingObject:f.icon];
                    Label_finger_id=[Label_finger_id arrayByAddingObject:f.finger_id];
                }
            }
            break;
        case 2:
            for(Finger *f in _appDelegate.fingers){
                if(f.list_id == list_id){
                    LabelData1=[LabelData1 arrayByAddingObject:f.host_name];
                    LabelData2=[LabelData2 arrayByAddingObject:f.finger_title];
                    iconData=[iconData arrayByAddingObject:f.icon];
                    Label_finger_id=[Label_finger_id arrayByAddingObject:f.finger_id];
                }
            }
            break;
        default:
            break;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [_tableView reloadData];
    [super viewWillAppear:animated];
}




////テーブルのヘッダの高さを変えたい
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return _head;
//}

@end
