//
//  ViewController.h
//  Lesson_20
//
//  Created by maxud on 20.10.2017.
//  Copyright © 2017 lesson_1. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GestsureRecognizer)
{
    TapGestureRecognizer,
    PinchGestureRecognizer,
    RotationGestureRecognizer,
    SwipeGestureRecognizer,
    PanGestureRecognizer,
    ScreenEdgePanGestureRecognizer,
    LongPressGestureRecognizer
};

@interface GestsureViewController : UIViewController

@property(nonatomic, assign) GestsureRecognizer gestsureType;

@end

