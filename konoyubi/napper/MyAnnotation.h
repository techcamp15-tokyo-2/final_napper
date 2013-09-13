//
//  MyAnnotation.h
//  napper
//
//  Created by techcamp on 13/09/06.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation> {
	//CLLocationCoordinate2D _coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString* subtitle;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) UIImage *image;

-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;

@end
