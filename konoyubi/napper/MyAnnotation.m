//
//  MyAnnotation.m
//  napper
//
//  Created by techcamp on 13/09/06.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "MyAnnotation.h"
@implementation MyAnnotation

//@synthesize coordinate=_coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate{
	_coordinate = coordinate;
	return self;
}



@end