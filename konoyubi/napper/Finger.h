//
//  Finger.h
//  napper
//
//  Created by techcamp on 13/09/10.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Finger : NSObject {
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
@property (assign,nonatomic)NSNumber *finger_id;
@property (assign,nonatomic)NSString *host_name;
@property (nonatomic,assign)NSString *finger_title;
@property (nonatomic,assign)NSString *finger_startdate;
@property (nonatomic,assign)NSString *finger_finishdate;
@property (nonatomic,assign)NSString *finger_place;
@property (nonatomic,assign)NSString *finger_detail;
@property (nonatomic,assign)double gps_latitude;
@property (nonatomic,assign)double gps_longitude;
@property (nonatomic, assign)UIImage *icon;
@property (nonatomic, assign)NSInteger parsonN;

@property (nonatomic, assign)Boolean my;

//リストIDは自分の友達リストのことです
@property (nonatomic,assign)NSInteger list_id;


-(Finger *)initFinger:(NSString *)hn finger_title:(NSString *)ft finger_startdate:(NSString *)fs finger_finishdate:(NSString *)ff finger_place:(NSString *)fp finger_detail:(NSString *)fd gps_latitude:(double)gla gps_longitude:(double)glo list_id:(NSInteger)li icon:(UIImage *)ic parsonN:(NSInteger)pn;

-(void)add:(Finger *)f;

@end
