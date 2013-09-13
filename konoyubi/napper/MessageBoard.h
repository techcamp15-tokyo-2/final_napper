//  Created by aqubi on 10/12/05.
//  Copyright 2010 aqubi. All rights reserved.
//
typedef enum {
    MessageBoardTop,
    MessageBoardBottom
} MessageBoardPosition;

@interface MessageBoard : UIView {
    UILabel *label;
    UIView *parentView;
    MessageBoardPosition position;
}

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, assign) MessageBoardPosition position;

+ (MessageBoard *)showMessageBoard:(UIView *)view message:(NSString *) message;
- (void)fillRoundedRect:(CGRect)rect inContext:(CGContextRef)context;
@end