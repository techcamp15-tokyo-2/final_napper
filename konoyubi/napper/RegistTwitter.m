//
//  RegistTwitter.m
//  napper
//
//  Created by techcamp on 13/09/12.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "RegistTwitter.h"
#import "AppDelegate.h"
#import "AccountView.h"
#import <Twitter/Twitter.h>
@implementation RegistTwitter

@synthesize appDelegate;

- (IBAction)inputID:(id)sender {
}
- (IBAction)inputPass:(id)sender {
}
- (IBAction)pushRBtn:(id)sender {

    appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
        
//    AccountView *accV;
//    accV = (AccountView *)[[UIApplication sharedApplication] delegate];
//    accV.twitter_ID = _textID.text;
    
    //ツイート機能
    if([TWTweetComposeViewController canSendTweet]){
        
        
        appDelegate.myAccount.twitter_name = [NSString stringWithString:_textID.text];

        
        TWTweetComposeViewController* vc = [[TWTweetComposeViewController alloc] init];
        [vc setInitialText:@"この指と〜まれ始めました！"];
        [self presentViewController:vc animated:YES completion:nil];
        //   [vc release];
        
        
    }

//    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
