//
//  Account.m
//  napper
//
//  Created by techcamp on 13/09/12.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "Account.h"

static int pk=0;



@implementation Account

@synthesize Account_id;
@synthesize name;
@synthesize icon;
@synthesize friends;
@synthesize twitter_name;

-(Account *)initAccount:(NSString *)na icon:(UIImage *)ic friends:(NSArray *)fr{
    
    self.Account_id = [NSNumber numberWithInt:pk++];
    self.name=na;
    self.icon=ic;
    
    if(fr!=nil){
        self.friends = fr;
    }
    
    NSLog(@"%@を作成",self.name);
    
    return self;    
}

-(void *)addTwitterId:(Account *)ac twitter_name:(NSNumber *)tw{
    ac.twitter_name=tw;
}

-(void *)addTwitterNuid:(Account *)ac twitter_Nuid:(NSNumber *)ti{
    ac.twitter_Nuid = ti;
    NSLog(@"%d",[ac.twitter_Nuid intValue]);
}





@end
