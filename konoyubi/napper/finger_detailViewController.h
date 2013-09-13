//
//  finger_detailViewController.h
//  napper
//
//  Created by Nagashima Takeshi on 2013/09/06.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "Finger.h"
#import <AudioToolbox/AudioServices.h>
#import <AVFoundation/AVFoundation.h>



@interface finger_detailViewController : UIViewController{
/*
    NSString *myStr;
    NSString *timeBeginStr;
    NSString *timeFinishStr;
    NSString *placeStr;
    NSString *detailStr;
*/
    Finger *finger;
    SystemSoundID sound;
    
    int p;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *backGroundView;
@property (weak, nonatomic) IBOutlet UILabel *detailView;
@property (retain, nonatomic) IBOutlet UITableView *testTablel;

@property (strong, nonatomic) IBOutletCollection(UIScrollView) NSArray *sv;

//アプリケーション全体で使えるデータ
@property (nonatomic, strong)AppDelegate *appDelegate;



// ベース（スタンプの下敷き）となる指画像
@property (weak, nonatomic) IBOutlet UIImageView *fingerImageView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel_title;
@property (assign,nonatomic)NSInteger finger_id;
//weakをstrongにしたらううまくいった strongはobjectを保持し続ける
@property (strong, nonatomic) IBOutlet UIImageView *iconStampView;  // 貼り付け中のスタンプ画像
@property (strong, nonatomic) IBOutlet UIImageView *stampBoy;  // 男の子のスタンプ画像
@property (strong, nonatomic) IBOutlet UIImageView *stampGirl;// 女の子のスタンプ画像
@property (strong, nonatomic) IBOutlet UIImageView *myIcon;

@property (assign) BOOL _isPressStamp;  // スタンプ貼り付け中かどうか
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UILabel *timeFinish;
@property (weak, nonatomic) IBOutlet UILabel *timeBegin;

@property(nonatomic,retain)AVAudioPlayer *audio;

@end