//
//  MessageBoard.m
//  CrossBacklog
//
//  Created by aqubi on 10/12/05.
//  Copyright 2010 aqubi. All rights reserved.
//

#import "MessageBoard.h"

@implementation MessageBoard
@synthesize label;
@synthesize position;

int height = 52;
float backgroundAlpha = 0.75f;
float radius = 10.0f;

- (id)initWithView:(UIView *) view {
    if (self = [super init]) {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        parentView = view;
        CGRect rect = CGRectMake(0, - height, parentView.bounds.size.width, height);
        self.frame = rect;
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 32)];
        label.adjustsFontSizeToFitWidth = NO;
        label.textAlignment = UITextAlignmentCenter;
        label.opaque = NO;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:32];
        position = MessageBoardBottom;
        [self addSubview:label];
    }
    return self;
}

- (void)dealloc {
     label = nil;
}

- (void) show {
    CGPoint startPoint;
    if (position == MessageBoardTop) {
        startPoint = CGPointMake(parentView.bounds.size.width / 2.0, - height / 2);
    } else {
        startPoint = CGPointMake(parentView.bounds.size.width / 2.0, parentView.bounds.size.height + height / 2);
    }
    CGPoint endPoint;
    if (position == MessageBoardTop) {
        endPoint = CGPointMake(parentView.bounds.size.width / 2.0, height / 2);
    } else {
        endPoint = CGPointMake(parentView.bounds.size.width / 2.0, parentView.bounds.size.height - height / 2);
    }
    
    self.center = startPoint;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(_didEndAnimation)];
    self.center = endPoint;
    [UIView commitAnimations];
}

- (void) _didEndAnimation {
    [NSThread sleepUntilDate:[[NSDate date] addTimeInterval:2]]; //wait
    CGPoint endPoint;
    if (position == MessageBoardTop) {
        endPoint = CGPointMake(parentView.bounds.size.width / 2.0, - height / 2);
    } else {
        endPoint = CGPointMake(parentView.bounds.size.width / 2.0, parentView.bounds.size.height + height / 2);
    }
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    self.center = endPoint;
    [UIView commitAnimations];
}

- (void)drawRect:(CGRect)rect {
    CGRect allRect = self.bounds;
    CGRect boxRect = CGRectMake(1, 0, allRect.size.width - 2, allRect.size.height - 2);
    CGContextRef ctxt = UIGraphicsGetCurrentContext();
    [self fillRoundedRect:boxRect inContext:ctxt];
}

- (void)fillRoundedRect:(CGRect)rect inContext:(CGContextRef)context {
    CGContextBeginPath(context);
    CGContextSetGrayFillColor(context, 0.0, backgroundAlpha);
    CGContextMoveToPoint(context, CGRectGetMinX(rect) + radius, CGRectGetMinY(rect));
    float topRadius = radius;
    float bottomRadius = radius;
    if (position == MessageBoardTop) {
        topRadius = 0.0f;
    } else if (position == MessageBoardBottom) {
        bottomRadius = 0.0f;
    }
    CGContextAddArc(context, CGRectGetMaxX(rect) - topRadius, CGRectGetMinY(rect) + topRadius, topRadius, 3 * M_PI / 2, 0, 0);
    CGContextAddArc(context, CGRectGetMaxX(rect) - bottomRadius, CGRectGetMaxY(rect) - bottomRadius, bottomRadius, 0, M_PI / 2, 0);
    CGContextAddArc(context, CGRectGetMinX(rect) + bottomRadius, CGRectGetMaxY(rect) - bottomRadius, bottomRadius, M_PI / 2, M_PI, 0);
    CGContextAddArc(context, CGRectGetMinX(rect) + topRadius, CGRectGetMinY(rect) + topRadius, topRadius, M_PI, 3 * M_PI / 2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
}

+ (MessageBoard *)showMessageBoard:(UIView *)view message:(NSString *) message {
    MessageBoard *board = [[MessageBoard alloc] initWithView:view];
    board.label.text = message;
    
    [view addSubview:board];
    [board show];
    return board;
}

@end