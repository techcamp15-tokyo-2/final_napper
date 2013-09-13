//
//  map.h
//  napper
//
//  Created by techcamp on 13/09/06.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyAnnotation.h"
#import "MessageBoard.h"
#import "AppDelegate.h"
#import <AudioToolbox/AudioToolbox.h>


@interface map : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UINavigationControllerDelegate>{
    CLLocationManager *lm;
    Boolean flag;
    double mylatitude;
    double mylongitude;
    SystemSoundID sound;
}
@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property (weak, nonatomic) IBOutlet UILabel *ido;
@property (weak, nonatomic) IBOutlet UILabel *keido;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *Nowbtn;
- (IBAction)PushBtn:(id)sender;

@property (nonatomic, strong)AppDelegate *appDelegate;




@end
