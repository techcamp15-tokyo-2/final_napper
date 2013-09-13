//
//  Finger.m
//  napper
//
//  Created by techcamp on 13/09/10.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "Finger.h"

static int pk=0;



@implementation Finger

@synthesize finger_id;
@synthesize host_name;
@synthesize finger_title;
@synthesize finger_startdate;
@synthesize finger_finishdate;
@synthesize finger_place;
@synthesize finger_detail;
@synthesize gps_latitude;
@synthesize gps_longitude;
@synthesize list_id;

-(Finger *)initFinger:(NSString *)hn finger_title:(NSString *)ft finger_startdate:(NSString *)fs finger_finishdate:(NSString *)ff finger_place:(NSString *)fp finger_detail:(NSString *)fd gps_latitude:(double)gla gps_longitude:(double)glo list_id:(NSInteger)li icon:(UIImage *)ic parsonN:(NSInteger)pn{
    self.host_name=hn;
    self.finger_id=[NSNumber numberWithInt:pk++];
    self.finger_title=ft;
    self.finger_startdate=fs;
    self.finger_finishdate=ff;
    self.finger_place=fp;
    self.finger_detail=fd;
    self.gps_latitude=gla;
    self.gps_longitude=glo;
    self.list_id=li;
    self.icon = ic;
    self.parsonN = pn;
    self.my=false;
    
    return self;
    
}

-(void)add:(Finger *)f{
    f.my =true;
}
@end
