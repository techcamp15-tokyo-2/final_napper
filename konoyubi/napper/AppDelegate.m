//
//  AppDelegate.m
//  napper
//
//  Created by techcamp on 13/09/05.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "AppDelegate.h"
#import "Finger.h"
#import "Account.h"

@implementation AppDelegate

@synthesize fingers;
@synthesize allAccount;
@synthesize acc;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    //指リストをテンプレートで初期化しようと思う
    fingers =[NSArray arrayWithObjects:nil];
/*    for(int i=0;i<5;i++){
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
 */
    Finger *tempfinger1=[Finger alloc];
    tempfinger1=[tempfinger1 initFinger:@"閑野伊織" finger_title:@"ラーメン食べにいこうぜ！" finger_startdate:@"12:30" finger_finishdate:@"14:30" finger_place:@"二郎渋谷店" finger_detail:@"１０００円あれば足りるよ" gps_latitude:0 gps_longitude:0 list_id:1 icon:[UIImage imageNamed:@"amestamp.png"] parsonN:2] ;
        fingers = [fingers arrayByAddingObject:tempfinger1];
    Finger *tempfinger2=[Finger alloc];
    tempfinger2=[tempfinger2 initFinger:@"小田祐子" finger_title:@"レポート一緒にやりませんか？" finger_startdate:@"今から" finger_finishdate:@"" finger_place:@"図書館" finger_detail:@"微積のレポートを\n今、図書館でやっています。" gps_latitude:0 gps_longitude:0 list_id:2 icon:[UIImage imageNamed:@"amegirl.png"] parsonN:0];
    fingers = [fingers arrayByAddingObject:tempfinger2];
    Finger *tempfinger3=[Finger alloc];
    tempfinger3=[tempfinger3 initFinger:@"星野叡子" finger_title:@"スカイプで話がしたい" finger_startdate:@"今夜" finger_finishdate:@"" finger_place:@"" finger_detail:@"人生の悩みの相談に乗ってほしい" gps_latitude:0 gps_longitude:0 list_id:1 icon:[UIImage imageNamed:@"amegirl2.png"] parsonN:0];
    fingers = [fingers arrayByAddingObject:tempfinger3];
    Finger *tempfinger4=[Finger alloc];
    tempfinger4=[tempfinger4 initFinger:@"岩崎真也" finger_title:@"カラオケ行こう！" finger_startdate:@"13:00" finger_finishdate:@"15:30" finger_place:@"渋谷" finger_detail:@"久しぶりにカラオケに行きたい" gps_latitude:0 gps_longitude:0 list_id:2 icon:[UIImage imageNamed:@"ameboy2.png"] parsonN:0];
    fingers = [fingers arrayByAddingObject:tempfinger4];
    Finger *tempfinger5=[Finger alloc];
    tempfinger5=[tempfinger5 initFinger:@"石橋弦樹" finger_title:@"ラウンジで遊ぼう" finger_startdate:@"" finger_finishdate:@"" finger_place:@"" finger_detail:@"" gps_latitude:0 gps_longitude:0 list_id:1 icon:[UIImage imageNamed:@"ameboy3.png"] parsonN:0];
    fingers = [fingers arrayByAddingObject:tempfinger5];
    Finger *tempfinger6=[Finger alloc];
//    tempfinger6=[tempfinger6 initFinger:@"青木太郎" finger_title:@"カラオケ行こうよ1" finger_startdate:@"12:30" finger_finishdate:@"14:30" finger_place:@"カラ館" finger_detail:@"１０００円あれば足りるよ" gps_latitude:0 gps_longitude:0 list_id:2 icon:[UIImage imageNamed:@"ameboy.png"]];
//    fingers = [fingers arrayByAddingObject:tempfinger6];
//    Finger *tempfinger7=[Finger alloc];
//    tempfinger7=[tempfinger7 initFinger:@"青木二郎" finger_title:@"カラオケ行こうよ2" finger_startdate:@"12:30" finger_finishdate:@"14:30" finger_place:@"カラ館2" finger_detail:@"１０００円あれば足りるよ" gps_latitude:0 gps_longitude:0 list_id:2 icon:[UIImage imageNamed:@"ameboy.png"]];
//    fingers = [fingers arrayByAddingObject:tempfinger7];
//    Finger *tempfinger8=[Finger alloc];
//    tempfinger8=[tempfinger8 initFinger:@"青木三郎" finger_title:@"カラオケ行こうよ3" finger_startdate:@"12:30" finger_finishdate:@"14:30" finger_place:@"カラ館3" finger_detail:@"１０００円あれば足りるよ" gps_latitude:0 gps_longitude:0 list_id:2 icon:[UIImage imageNamed:@"ameboy.png"]];
//    fingers = [fingers arrayByAddingObject:tempfinger8];
//    Finger *tempfinger9=[Finger alloc];
//    tempfinger9=[tempfinger9 initFinger:@"青木四郎" finger_title:@"カラオケ行こうよ4" finger_startdate:@"12:30" finger_finishdate:@"14:30" finger_place:@"カラ館4" finger_detail:@"１０００円あれば足りるよ" gps_latitude:0 gps_longitude:0 list_id:2 icon:[UIImage imageNamed:@"ameboy.png"]];
//    fingers = [fingers arrayByAddingObject:tempfinger9];
//    Finger *tempfinger10=[Finger alloc];
//    tempfinger10=[tempfinger10 initFinger:@"青木五郎" finger_title:@"カラオケ行こうよ5" finger_startdate:@"12:30" finger_finishdate:@"14:30" finger_place:@"カラ館5" finger_detail:@"１０００円あれば足りるよ" gps_latitude:0 gps_longitude:0 list_id:2 icon:[UIImage imageNamed:@"ameboy.png"]];
//    fingers = [fingers arrayByAddingObject:tempfinger10];




//自分のアカウントを静的に作っておく
    NSArray *friends =[NSArray arrayWithObjects:nil];
    Account *tempAc1 = [[Account alloc] initAccount:@"閑野伊織" icon:[UIImage imageNamed:@"amestamp.png"] friends:nil];
    friends = [friends arrayByAddingObject:tempAc1];
    Account *tempAc2 = [[Account alloc] initAccount:@"小田祐子" icon:[UIImage imageNamed:@"amegirl.png"] friends:nil];
    friends = [friends arrayByAddingObject:tempAc2];
    Account *tempAc3 = [[Account alloc] initAccount:@"星野叡子" icon:[UIImage imageNamed:@"amegirl2.png"] friends:nil];
    friends = [friends arrayByAddingObject:tempAc3];
    Account *tempAc4 = [[Account alloc] initAccount:@"岩崎真也" icon:[UIImage imageNamed:@"ameboy2.png"] friends:nil];
    friends = [friends arrayByAddingObject:tempAc4];
    Account *tempAc5 = [[Account alloc] initAccount:@"石橋弦樹" icon:[UIImage imageNamed:@"ameboy3.png"] friends:nil];
    friends = [friends arrayByAddingObject:tempAc5];
    
    allAccount = [NSArray arrayWithObjects:nil];
    allAccount =[allAccount arrayByAddingObject:tempAc1];
    allAccount =[allAccount arrayByAddingObject:tempAc2];
    allAccount =[allAccount arrayByAddingObject:tempAc3];
    allAccount =[allAccount arrayByAddingObject:tempAc4];
    allAccount =[allAccount arrayByAddingObject:tempAc5];
    
    NSLog(@"%@",allAccount);
    
    
//    NSLog(@"%@", tempAc5.name);
//    NSLog(@"tempAc5の名前は%@です",tempAc5.)
    _myAccount = [[Account alloc] initAccount:@"青木耀平" icon:[UIImage imageNamed:@"ameboy.png"] friends:friends];
    _myfriend = friends;
    
    allAccount =[allAccount arrayByAddingObject:_myAccount];
    
    for (Account *a in _myAccount.friends) {
        NSLog(@"%@は友達",a.name);
    }
    
    
    Account *tempAc6 = [[Account alloc] initAccount:@"フォロしてる人" icon:[UIImage imageNamed:@"twitter.jpg"] friends:nil];
    allAccount = [allAccount arrayByAddingObject:tempAc6];
    [tempAc6 addTwitterNuid:tempAc6 twitter_Nuid:[NSNumber numberWithInteger:268732024]];
    
    acc=tempAc6;
    
    [_myAccount addTwitterId:_myAccount twitter_name:@"nappertest"];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
