//
//  Account.h
//  napper
//
//  Created by techcamp on 13/09/12.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject {
    /*    NSInteger finger_id;
     __unsafe_unretained NSString *finger_title;
     __unsafe_unretained NSString *finger_startdate;
     __unsafe_unretained NSString *finger_finishdate;
     __unsafe_unretained NSString *finger_place;
     NSString *figner_detail;
     double gps_latitude;
     double gps_longitude;
     NSInteger list_id;
     */
}
@property (assign,nonatomic)NSNumber *Account_id;
@property (assign,nonatomic)NSString *name;
@property (nonatomic, assign)UIImage *icon;
@property (nonatomic, assign)NSArray *friends;
@property (nonatomic, assign)NSString *twitter_name;
@property (nonatomic, assign)NSNumber *twitter_Nuid;

//リストIDは自分の友達リストのことです
@property (nonatomic,assign)NSInteger list_id;


-(Account *)initAccount:(NSString *)na icon:(UIImage *)ic friends:(NSArray *)fr;
-(void *)addTwitterId:(Account *)ac twitter_name:(NSString *)tw;
-(void *)addTwitterNuid:(Account *)ac twitter_Nuid:(NSNumber *)ti;

@end
