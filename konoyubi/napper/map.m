//
//  map.m
//  napper
//
//  Created by techcamp on 13/09/06.
//  Copyright (c) 2013年 technologycamp. All rights reserved.
//

#import "map.h"
#import "AppDelegate.h"
#import "Finger.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation map

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"マップに入りました！");
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"a1-012_fall_02" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    AudioServicesCreateSystemSoundID((CFURLRef)CFBridgingRetain(url), &sound);
    
    // サウンドの再生
//    AudioServicesPlaySystemSound(sound);
    //全てのクラスで情報を共有しようと思った
    _appDelegate=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    lm=[[CLLocationManager alloc] init];
    lm.delegate=self;
    lm.desiredAccuracy=kCLLocationAccuracyHundredMeters;
    lm.distanceFilter=kCLDistanceFilterNone;
    [lm startUpdatingLocation];

    _myMapView.delegate = self;
    [_myMapView setShowsUserLocation:YES];
    
 //   self.navigationController.delegate = self;
    
    NSLog(@"latitude = %f",_myMapView.userLocation.coordinate.latitude);
    NSLog(@"longitude = %f", _myMapView.userLocation.coordinate.longitude);
    
  //  _myMapView.region.span.latitudeDelta = 0.01;
    
    
    //mylatitude = _myMapView.userLocation.coordinate.latitude;
    //mylongitude = _myMapView.userLocation.coordinate.longitude;
    
    
    CLLocationCoordinate2D location1 = CLLocationCoordinate2DMake(35.653623+0.0015,139.692890+0.001);
    MyAnnotation *annotation1 = [[MyAnnotation alloc] initWithCoordinate:location1];
    annotation1.title = @"長嶋岳志";
    annotation1.subtitle = @"ガストへ行こう！";
    annotation1.image = [UIImage imageNamed:@"finger_icon.png"];
    [_myMapView addAnnotation:annotation1];

    
    CLLocationCoordinate2D location2 = CLLocationCoordinate2DMake(35.653623-0.002,139.692890-0.001);
    MyAnnotation *annotation2 = [[MyAnnotation alloc] initWithCoordinate:location2];
    annotation2.title = @"坂本奈保";
    annotation2.subtitle = @"カラオケ！";
    annotation2.image = [UIImage imageNamed:@"finger_icon.png"];
    [_myMapView addAnnotation:annotation2];

    
    
   /* CLLocationCoordinate2D  ctrpoint;
    ctrpoint.latitude = 53.58448;
    ctrpoint.longitude =-8.93772;
    MKAnnotationView *addAnnotation = [[MKAnnotationView alloc] init];
    [mapview addAnnotation:addAnnotation];
    
    CustomAnnotation* st = [[CustomAnnotation alloc] init];
    st.coordinate = CLLocationCoordinate2DMake(35.710139, 139.810833);
    st.title = @"Tokyo Skytree";
    st.subtitle = @"opening in May 2012";
    st.sample = @"35.710, 139.810";
    
    // add annotations to map
    [map_ addAnnotations:@[tt, st]];*/
}
/*
double *mylatitude;
double *mylongitude;
*/

-(void) locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    NSLog(@"現在地を検索しますよ！");
    
//    if(newLocation == nil){
//        NSLog(@"もしかしてGPS起動してないんじゃない？");
//    }
    
    //MKCoordinateRegion region = _myMapView.region;
    //region.center.latitude = newLocation.coordinate.latitude;
    mylatitude = newLocation.coordinate.latitude;
    //region.center.longitude=newLocation.coordinate.longitude;
    mylongitude = newLocation.coordinate.longitude;
    //region.span.latitudeDelta=0.01;
    //region.span.longitudeDelta=0.01;
    
//    
    MKCoordinateRegion region = _myMapView.region;
    region.center.latitude = newLocation.coordinate.latitude;
    region.center.longitude=newLocation.coordinate.longitude;
    region.span.latitudeDelta=0.01;
    region.span.longitudeDelta=0.01;
    
    _myMapView.region=region;
    
    

/*    myregion.center.latitude = newLocation.coordinate.latitude;
    myregion.center.longitude = newLocation.coordinate.longitude;
 */
    //_myMapView.region = region;
    
    //[_myMapView setShowsUserLocation:YES];

    //ログに出力
    //_ido.text=[NSString stringWithFormat:@"%g",newLocation.coordinate.latitude];
    //_keido.text=[NSString stringWithFormat:@"%g",newLocation.coordinate.longitude];
    //NSLog(@"latitude = %@",_ido.text);
    //NSLog(@"longitude = %@",_keido.text);
    
    NSLog(@"latitude = %f",newLocation.coordinate.latitude);
    NSLog(@"longitude = %f", newLocation.coordinate.longitude);
    
    [lm stopUpdatingLocation];
    
}

-(MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id)annotation{
    // 現在地表示なら nil を返す
    if (annotation == _myMapView.userLocation) {
        return nil;
    }
    
    NSString* identifier = @"Pin";
    MKAnnotationView *annotationView = (MKAnnotationView*)[_myMapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annotationView) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    annotationView.image = [(MyAnnotation *)annotation image];
    annotationView.canShowCallout = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    annotationView.annotation = annotation;
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    for (MKAnnotationView *pin in views) {
        
        //はじめからコールアウト
  //      [mapView selectAnnotation:[mapView.annotations lastObject] animated:YES];
        
        
       // AudioServicesPlaySystemSound(sound);

        
        
        
        
        //UIButton *detailsButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        //[detailsButton addTarget:self action:@selector(detailsButtonAct:) forControlEvents:UIControlEventTouchUpInside];

        
        //音の再生
      //  AudioServicesPlaySystemSound(sound);

        
        
//落ちてくるアニメーション        
        pin.canShowCallout = YES;
        //pin.rightCalloutAccessoryView = detailsButton;
        CGRect endFrame = pin.frame;
        //pin.frame = CGRectOffset(pin.frame, 0, -230);
   
        //拡大から縮小
        pin.frame = CGRectMake(endFrame.origin.x-150,endFrame.origin.y-600,300,400);
        
   //     pin.frame = CGRectMake(0,-230,1000,1000);
        
//        [UIView animateWithDuration:0.45f animations:^(void){
//            pin.frame = endFrame;
//        } completion:^(BOOL finished) {
//            
//
//        }];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.0f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        pin.frame = endFrame;
        [UIView commitAnimations];
        
 //       UIImage *comment=[[UIImage imageNamed:@"point.png"];
        
        
        
        
        
//        
////バウンドするアニメーション
//        CGRect endFrame2 = pin.frame;
//        endFrame2=CGRectOffset(endFrame2, 0, -20);
//        [UIView beginAnimations:nil context:nil];
//                [UIView setAnimationDelay:1.0];
//        [UIView setAnimationDuration:0.20f];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//
//        pin.frame = endFrame2;
//        [UIView commitAnimations];

    }
//    for (MKAnnotationView *pin in views) {
//        //UIButton *detailsButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        //[detailsButton addTarget:self action:@selector(detailsButtonAct:) forControlEvents:UIControlEventTouchUpInside];
//        
//        
////        //落ちてくるアニメーション
////        pin.canShowCallout = YES;
////        //pin.rightCalloutAccessoryView = detailsButton;
////        CGRect endFrame = pin.frame;
////        pin.frame = CGRectOffset(pin.frame, 0, -230);
////        
////        //拡大から縮小
////        // pin.frame = CGRectMake(endFrame.origin.x-150,endFrame.origin.y-600,300,400);
////        
////        //     pin.frame = CGRectMake(0,-230,1000,1000);
////        
////        //        [UIView animateWithDuration:0.45f animations:^(void){
////        //            pin.frame = endFrame;
////        //        } completion:^(BOOL finished) {
////        //
////        //
////        //        }];
////        
////        [UIView beginAnimations:nil context:nil];
////        [UIView setAnimationDuration:0.45f];
////        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
////        pin.frame = endFrame;
////        [UIView commitAnimations];
//        
//        //バウンドするアニメーション
//        CGRect endFrame2 = pin.frame;
//        endFrame2=CGRectOffset(endFrame2, 0, -20);
//        [UIView beginAnimations:nil context:nil];
//        [UIView setAnimationDelay:1.0];
//        [UIView setAnimationDuration:0.20f];
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
//        
//        pin.frame = endFrame2;
//        [UIView commitAnimations];
//        
//    }

}




-(void)viewDidUnload
{
    [super viewDidUnload];
}

- (IBAction)PushBtn:(id)sender {
    
    [MessageBoard showMessageBoard:_myMapView message:@"この指と〜まれ！！"];
    
    AudioServicesPlaySystemSound(sound);


    
    //NSLog(@"OK!");
    
    CLLocationCoordinate2D mylocation = CLLocationCoordinate2DMake(mylatitude,mylongitude);
    MyAnnotation *myannotation = [[MyAnnotation alloc] initWithCoordinate:mylocation];
    myannotation.title = @"青木耀平";
    myannotation.subtitle = @"今すぐ集合！";
    myannotation.image = [UIImage imageNamed:@"finger_icon.png"];
    
    [_myMapView addAnnotation:myannotation];
    
//    
//    MyAnnotation *myannotation2 = [[MyAnnotation alloc] initWithCoordinate:mylocation];
//    myannotation2.title = @"青木耀平";
//    myannotation2.subtitle = @"今すぐ集合！";
//    myannotation2.image = [UIImage imageNamed:@"point.png"];
//    
//    [_myMapView addAnnotation:myannotation2];
//    
    
    
    //commentを付けたい
    
    
    
    
    
    
//    UIImageView *comment=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"point.png"]];
//    comment.image.
    
    
    
    //指一覧に登録する
    Finger *mytempfinger=[Finger alloc];
//    NSLog((@"aaaaaaaaaa"));
    mytempfinger = [mytempfinger initFinger:@"青木耀平" finger_title:@"今すぐ集合！" finger_startdate:@"今" finger_finishdate:nil finger_place:nil finger_detail:nil gps_latitude:mylatitude gps_longitude:mylongitude list_id:0 icon:[UIImage imageNamed:@"ameboy.png"] parsonN:0];
    _appDelegate.fingers = [_appDelegate.fingers arrayByAddingObject:mytempfinger];
//                            fingers = [fingers arrayByAddingObject:tempfinger1]];
    
    // サウンドの再生
    //   AudioServicesPlaySystemSound(sound);

    
//    NSLog(@"%f",mylatitude);
//    NSLog(@"%f",mylongitude);

}
/*
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"willShowViewController");
	[viewController viewWillAppear:animated];
}
*/



//独自のコールあうとを表示したいんだ



@end
