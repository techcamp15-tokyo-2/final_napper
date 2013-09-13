//
//  AddFriend.m
//  napper
//
//  Created by techcamp on 13/09/12.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "AddFriend.h"
#import "AppDelegate.h"
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>

@implementation AddFriend
//
//
//- (id)initWithView:(UIView *) view{
//// 生成例
//UIAlertView *alert = [[UIAlertView alloc] init];
//
//// 生成と同時に各種設定も完了させる例
//UIAlertView *alert =
//[[UIAlertView alloc]
// initWithTitle@"タイトル"
// message:@"メッセージ"
// delegate:nil
// cancelButtonTitle:nil
// otherButtonTitles:@"OK", nil
// ];
//
//}

//_appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
// NSString *my_tw_id = AppDlegate.myAccount.twitter_name;
/*- (IBAction)inputMail:(id)sender {

    
    if([TWTweetComposeViewController canSendTweet]){            // ツイートできるかどうかをチェックする
        TWTweetComposeViewController *composeViewController     //
        = [[TWTweetComposeViewController alloc] init];          // TWTweetComposeViewControllerオブジェクトを作成する
        [self presentModalViewController:composeViewController  //
                                animated:YES];                  // TWTweetComposeViewControllerオブジェクトを表示する
    }

}*/

/*- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [statuses count]; // 行数を返す
}*/

/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:11.0];
    }
    // NSDictionary *status = [statuses objectAtIndex:indexPath.row];
    //NSArray *status = [statuses objectAtIndex:indexPath.row];
    NSString *text = [status objectForKey:@"text"];
    cell.textLabel.text = text;
    
    return cell;
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)pushAddFriend:(id)sender {
    //myAccountの情報
    _appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
   
       NSLog(@"%@",_appDelegate.myAccount.twitter_name);
     NSString *my_tw_id = _appDelegate.myAccount.twitter_name;
    NSLog(@"my_tw_id : %@",my_tw_id);
    
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
	ACAccountType *twitterAccountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    
    
    
    
    
    [accountStore requestAccessToAccountsWithType:twitterAccountType
                            withCompletionHandler:^(BOOL granted, NSError *error)
     {
         if (!granted) {
             NSLog(@"ユーザーがアクセスを拒否しました。");
         }else{
             NSLog(@"ユーザーがアクセスを許可しました。");
             NSArray *twitterAccounts = [accountStore accountsWithAccountType:twitterAccountType];
             NSLog(@"twitterAccounts = %@", twitterAccounts);
             if ([twitterAccounts count] > 0) {
                 ACAccount *account = [twitterAccounts objectAtIndex:0];
                 // NSLog(@"account = %@", account);
                //NSURL *url = [NSURL URLWithString:@"http://api.twitter.com/1.1/friends/ids.json?screen_name="];
                 
                 //urlを文字列に
                  //NSString *urlString = [url absoluteString];
                 //  NSLog(@"%@", urlString);
                 
                 NSString *url_str = @"http://api.twitter.com/1.1/friends/ids.json?screen_name=";
                 NSMutableString *my_account_str = my_tw_id;
                 //SString *url = [NSString alloc];
               //  NSLog(@"%@",url);
                 //   url = [@"http://api.twitter.com/1.1/friends/ids.json?screen_name=" stringByAppendingString: _appDelegate.myAccount.twitter_name];
                 NSString *url = [@"http://api.twitter.com/1.1/friends/ids.json?screen_name=" stringByAppendingString:_appDelegate.myAccount.twitter_name];
                 NSLog(@"%@",url);
                 NSURL *u = [NSURL URLWithString:url];
                 TWRequest *request = [[TWRequest alloc] initWithURL:u parameters:nil requestMethod:TWRequestMethodGET];
                 [request setAccount:account];
                
                 [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                  {
                      if(!responseData){
                          NSLog(@"%@", error);
                      }else{
                          NSLog(@"responseData = %@", responseData);
                          NSError* error;
                          statuses = [NSJSONSerialization JSONObjectWithData:responseData  // 書き換える
                                                                     options:NSJSONReadingMutableLeaves  // 書き換える
                                                                       error:&error];  // 書き換える
                          
                          if(statuses){
                              NSLog(@"%@", statuses);
                              NSLog(@"%@", [statuses objectForKey:@"ids"]);
                              
                              // ハッシュの値を配列に
                              //int kArray[99];
                              NSString *urlString = @"http://api.twitter.com/1.1/users/lookup.json?user_id=";
                              NSMutableString *idsString = [[NSMutableString alloc] init];
                              NSArray *ids = [NSArray arrayWithArray:[statuses objectForKey:@"ids"]];
                              
                              for (int i = 0; i < [ids count]; i++) {
                                  NSLog(@"key: %@, value: %@\n",
                                        [ids objectAtIndex:i],
                                        [statuses objectForKey:[ids objectAtIndex:i]]);
                                  [idsString appendFormat:@"%d,",[[ids objectAtIndex:i] intValue]];
                                  
                                
//                                  NSLog(@"for前");
//                                  for(Account *a in _appDelegate.allAccount){
//                                      NSLog(@"%@",a);
//                                //      if([a.twitter_Nuid intValue] == [[ids objectAtIndex:i] intValue]){
//                                      if( [a.twitter_Nuid intValue] == [[ids objectAtIndex:i] intValue]){
//                                          NSLog(@"if中");
//                                          _appDelegate.myfriend = [_appDelegate.myfriend arrayByAddingObject:a];
//                                      }
//                                  }
                                  
                              }
                              
                              //_appDelegate.myfriend = [_appDelegate.allAccount objectAtIndex:6];
                              
                              NSLog(@"%@",_appDelegate.myfriend);
                              _appDelegate.f=1;
                              
                              // [idsString deleteCharactersInRange:NSMakeRange([idsString length]-1, 1)];
                              //  NSString *new_url = [NSString stringWithFormat:@"%@%@", urlString, idsString];
                              
                              //NSURL *url_lookup = [NSURL URLWithString:@"http://api.twitter.com/1.1/users/lookup.json?user_id="];
                              
                              //urlを文字列に
                              //NSString *urlString = [url_lookup absoluteString];
                              //NSLog(@"keysの値は%@" ,kArray[0] );
                              //NSString *new_url = [urlString stringByAppendingString:keys[0]];
                              
                              //NSString *urlString = @"http://api.twitter.com/1.1/users/lookup.json?user_id=";
                              
                              // 新しいURLログ出力してみる。
                              /*   NSURL *new_url = [NSURL URLWithString:@"http://api.twitter.com/1.1/users/lookup.json?user_id=947503878,796415815,588033543,839151126,491894587,949721281,136135227,278053659,169683033,203859926,850074272,103847022,87733623"];
                               
                               NSLog(@"%@", new_url);
                               
                               //ユーザーIDを投げる
                               
                               TWRequest *request_id = [[TWRequest alloc] initWithURL:new_url
                               parameters:nil
                               requestMethod:TWRequestMethodGET];
                               [request setAccount:account];
                               [request performRequestWithHandler:^(NSData *response_new_Data, NSHTTPURLResponse *urlResponse, NSError *error){
                               if(!response_new_Data){
                               NSLog(@"%@", error);
                               }else{
                               // NSLog(@"responseData = %@", responseData);
                               NSError* error;
                               new_statuses = [NSJSONSerialization JSONObjectWithData:response_new_Data  // 書き換える
                               options:NSJSONReadingMutableLeaves  // 書き換える
                               error:&error];  // 書き換える
                               
                               }
                               }];*/
                              
                              //   NSLog(@"%@", new_statuses);
                              
                              
                              /* dispatch_async(dispatch_get_main_queue(), ^{
                               [self.tableView reloadData];
                               });*/
                          }else{
                              NSLog(@"%@", error);
                          }
                      }
                  }];
             }
         }
     }];

}
@end
