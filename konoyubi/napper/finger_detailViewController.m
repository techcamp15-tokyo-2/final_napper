//
//  finger_detailViewController.m
//  napper
//
//  Created by Nagashima Takeshi on 2013/09/06.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

// memo ScrollViewを挟んだらスタンプできなくなった

#import "finger_detailViewController.h"
#import "AppDelegate.h"
#import "Finger.h"
#import <AVFoundation/AVFoundation.h>


@interface finger_detailViewController ()

@end

@implementation finger_detailViewController

//@synthesize myStr;

NSTimer *tm;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // [self configureView];

    p=0;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"conga01" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(url), &sound);
    
  //  AudioServicesPlaySystemSound(sound);
    
    
    
//    AVAudioPlayer* audio;
//    NSString* path = [[NSBundle mainBundle]
//                      pathForResource:@"a1-012_fall_02" ofType:@"mp3"]; //bgm1.mp3ってファイルを読み込んでます。
//    NSURL* url = [NSURL fileURLWithPath:path];
//    audio = [[AVAudioPlayer alloc]
//             initWithContentsOfURL:url error:nil];
//    audio.numberOfLoops = 5; //ループする回数の指定。（-1： 無限、0：
//    
//    [audio play];
    
    
    
    
     _backGroundView.alpha = 0;
    
    //  _sv.delegate = self;
    /*オレンジバージョン
     self.view.backgroundColor=[UIColor orangeColor];
    */
    self.view.backgroundColor=[UIColor colorWithRed:1.0 green:0.747 blue:0.4 alpha:1.0];
    
//    self.myLabel_title.text = myStr;
    //NSLog(@"%d",self.finger_id);
/*
    NSString *timeBeginStr = [NSString stringWithString:@"12:30"];
    NSString *timeFinishStr = [NSString stringWithString:@"14:30"];
    NSString *placeStr = [NSString stringWithString:@"二郎"];
    
    NSString *detailStr = [NSString stringWithString:@"詳細　1000あれば足りるよー"];
*/
    
    _appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //NSLog(@"表示したいfinger_idは%dだよ！",self.finger_id);
    
    self.detailView.numberOfLines =0;
    
    for(Finger *f in _appDelegate.fingers){
        NSLog(@"finger_idは%dだっけ？",[f.finger_id intValue]);
        NSLog(@"for文に入ったよ！");
        if( [f.finger_id intValue] ==  self.finger_id){
            finger = f;
            NSLog(@"同じfinger_idの情報をラベルに張るよ！");
            self.myLabel_title.text = f.finger_title;
            self.timeBegin.text = f.finger_startdate;
            self.timeFinish.text = f.finger_finishdate;
            self.place.text = f.finger_place;
            self.detailView.text = f.finger_detail;
            break;
        }
    }
    
    [self.myLabel_title.layer setCornerRadius:10.0f];
    [self.myLabel_title.layer setMasksToBounds:YES];

/*
    self.myLabel_title.text=
    self.timeBegin.text = timeBeginStr;
    self.timeFinish.text = timeFinishStr;
    self.place.text = placeStr;
    self.detailView.text = detailStr;
*/
    if(finger.parsonN ==2 ){
        _stampBoy = [[UIImageView alloc]
                     initWithFrame:CGRectMake(131, 71, 45, 45)];
        _stampBoy.image = [UIImage imageNamed:@"ameboy2.png"];
        _stampBoy.userInteractionEnabled = YES;
        [self.view addSubview:_stampBoy];
    
    
        _stampGirl = [[UIImageView alloc]
                  initWithFrame:CGRectMake(91, 141, 45, 45)];
        _stampGirl.image = [UIImage imageNamed:@"amegirl.png"];
        _stampGirl.userInteractionEnabled = YES;
        [self.view addSubview:_stampGirl];
    }
    if(finger.my){
        _myIcon = [[UIImageView alloc]
                     initWithFrame:CGRectMake(_appDelegate.myPoint.x+50, _appDelegate.myPoint.y+30, 45, 45)];
        _myIcon.image = [UIImage imageNamed:@"ameboy.png"];
        _myIcon.userInteractionEnabled = YES;
        [self.view addSubview:_myIcon];
    }
}

//UIImageView *_fingerImageView =nil;
// ベースとなる画像の貼り付け
// _fingerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 10, 80, 80)];
//_fingerImageView.image = [UIImage imageNamed:@"finger_resize.png"];
//[self.view addSubview:_fingerImageView];

// スタンプ画像は最初はセットしない
UIImageView *_icontStampView = nil;


// 最初はスタンプモードでない

BOOL _isPressStamp = NO;
int i=0; //スタンプがおかれた回数をカウント

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if(!finger.my){
        
        tm =
        [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(hoge:) userInfo:nil
                                        repeats:YES];
        
        
        
    // タッチされた座標を取得
    //UITouch* touch = [touches anyObject];
    UITouch* touch = [touches anyObject];

    CGPoint point = [touch locationInView:_fingerImageView];
    _appDelegate.myPoint = point;
        
    //    if(point.x>30 && point.x<80 && point.y>51 && point.y<212){
 
    printf("%f",point.x);
    // スタンプを貼り付ける データベースに値を渡すときには原点の位置を設定する必要があるかも
    _iconStampView = [[UIImageView alloc]
                      initWithFrame:CGRectMake(point.x+50, point.y+30, 45, 45)];
    _iconStampView.image = [UIImage imageNamed:@"ameboy.png"];
    _iconStampView.userInteractionEnabled = YES;
    [self.view addSubview:_iconStampView];
    //[_iconStampView.image drawAtPoint:CGPointMake(point.x+30, point.y+30)];
    //アニメーション
        //アニメーション
        NSArray *imageArray= [NSArray arrayWithObjects:
                              [UIImage imageNamed:@"finger_anime?_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime1_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime2_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime3?_ver3-01.png"],
                              
                              [UIImage imageNamed:@"finger_anime5_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime6_ver3-01.png"],
                              
                              [UIImage imageNamed:@"finger_anime8_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime8?_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime9_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime10_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime11_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime10_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime9_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime8_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime8?_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime6_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime5_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime3?_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime2_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime1_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime?_ver3-01.png"],
                              
                              
                              [UIImage imageNamed:@"finger_anime1_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime2_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime3_left_ver3-01.png"],
                              
                              [UIImage imageNamed:@"finger_anime5_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime6_left_ver3-01.png"],
                              
                              [UIImage imageNamed:@"finger_anime8_left_ver3-01.png"],
                              
                              [UIImage imageNamed:@"finger_anime10_left_ver3-01.png"],
                              
                              [UIImage imageNamed:@"finger_anime11_left_ver3-01.png"],
                              /* [UIImage imageNamed:@"finger_anime12_left_ver3-01.png"],
                               
                               [UIImage imageNamed:@"finger_anime13_left_ver3-01.png"],
                               */ [UIImage imageNamed:@"finger_anime12_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime11_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime10_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime9_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime8_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime6_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime5_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime3_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime2_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime1_left_ver3-01.png"],
                              [UIImage imageNamed:@"finger_anime?_ver3-01.png"],
                              nil];
        _fingerImageView.animationImages= imageArray;
        _fingerImageView.animationDuration= 0.5;
        _fingerImageView.animationRepeatCount=3;
        [_fingerImageView startAnimating];
        
        //アニメーション
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:2];
        int i=0;
        for(i=0 ;i <100 ; i++ ){
            
            _backGroundView.alpha += 0.01;
            //[self.view addSubview:_backGroundView];
            [UIView commitAnimations];
        }
   
    //参加人数を１増やす
 //       finger.parsonN++;
        [finger add:finger];
        
    // スタンプモードON
    _isPressStamp = YES;
    // i++;
        }//}
}
/*
 - (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
 // タッチされた座標を取得
 UITouch* touch = [touches anyObject];
 CGPoint point = [touch locationInView:_fingerImageView];
 //タッチ座標x
 
 // スタンプの位置を変更する
 if (_isPressStamp) {
 _iconStampView.frame = CGRectMake(point.x, point.y, 60, 60);
 }
 }
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    // スタンプモード終了（スタンプを確定する）
    _isPressStamp = NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    // スタンプモード終了（スタンプを確定する）
    _isPressStamp = NO;
}


/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 
 
 
 - (void)didReceiveMemoryWarninga
 {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 */

-(void)hoge:(NSTimer*)timer{
    // ここに何かの処理を記述する
    // （引数の timer には呼び出し元のNSTimerオブジェクトが引き渡されてきます）
    AudioServicesPlaySystemSound(sound);
    p++;
    if(p==5){
        [tm invalidate];
    }
    
}

@end

