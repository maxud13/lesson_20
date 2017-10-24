//
//  ViewController.m
//  Lesson_20
//
//  Created by maxud on 20.10.2017.
//  Copyright © 2017 lesson_1. All rights reserved.
//

#import "GestsureViewController.h"

@interface GestsureViewController ()

@property(nonatomic, strong)UIView *animatedView;

@end

@implementation GestsureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureteGestsure];
    
    self.animatedView = [[UIView alloc] initWithFrame:(100, 300, 100, 100)];
    self.animatedView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.animatedView];
}

#pragma mark - Gestsures Action

-(void)handleTap:(UITapGestureRecognizer*)tap
{
    if (tap.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"Tapped");
        CGRect frame = self.animatedView.frame;
        
        
    }
}

- (void)handlePinch:(UIPinchGestureRecognizer*)pinch
{
    NSLog(@"Pinch scale: %f.2",pinch.scale);
    NSLog(@"Pinch velocity: %f.2", pinch.velocity);
}

-(void)handleRotation:(UIRotationGestureRecognizer*)rotation
{
    NSLog(@"Rotation rotation: %f.2",rotation.rotation);
    NSLog(@"Rotation velocity: %f.2",rotation.velocity);

}
- (void)handlwSwipe:(UISwipeGestureRecognizer *)swipe
{
    switch (swipe.direction)
    {
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"Swipe: UP");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"Swipe: DOWN");
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"Swipe: LEFT");
            break;
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"Swipe: RIGHT");
            break;
        default:
            break;
    }
}

- (void)handlePan:(UIPanGestureRecognizer*)pan
{
    NSLog(@"Pan");
}

- (void)handleScreenEdge:(UIScreenEdgePanGestureRecognizer*)screenEdge
{
    NSLog(@"ScreenEdge..");
}

- (void)handleLongPress:(UILongPressGestureRecognizer*)longPress
{
    NSLog(@"Long Press...");
}

#pragma mark - Private MAthods

-(void)configureteGestsure
{
    UIGestureRecognizer *gestsure = nil;
    
    switch (self.gestsureType)
    {
        case TapGestureRecognizer:
            gestsure = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
            break;
            case PinchGestureRecognizer:
            gestsure = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
                break;
        case RotationGestureRecognizer:
            gestsure = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleRotation:)];
            break;
        case SwipeGestureRecognizer:
            gestsure = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handlwSwipe:)];
            ((UISwipeGestureRecognizer*)gestsure).numberOfTouchesRequired = 1;
            ((UISwipeGestureRecognizer*)gestsure).direction = UISwipeGestureRecognizerDirectionLeft;
            break;
        case PanGestureRecognizer:
            gestsure = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
            ((UIPanGestureRecognizer*)gestsure).minimumNumberOfTouches = 1;
            break;
        case ScreenEdgePanGestureRecognizer:
            gestsure = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleScreenEdge:)];
            [(UIScreenEdgePanGestureRecognizer*)gestsure setEdges:UIRectEdgeRight];
            break;
        case LongPressGestureRecognizer:
            gestsure = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
            ((UILongPressGestureRecognizer*)gestsure).minimumPressDuration = 2.0f;
            break;
            default:
                break;
    }
    if (gestsure) {
        [self.view addGestureRecognizer:gestsure];
    }
        
    
}


@end
