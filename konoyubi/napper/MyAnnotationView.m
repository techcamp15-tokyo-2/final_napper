//
//  MyAnnotationView.m
//  napper
//
//  Created by techcamp on 13/09/06.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "MyAnnotationView.h"

@implementation MyAnnotationView
- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    
    self.canShowCallout = YES;
    
    return self;
}
@end
