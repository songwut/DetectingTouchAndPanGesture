//
//  ViewController.m
//  DetectingTouchAndPanGesture
//
//  Created by Songwut on 8/9/14.
//  Copyright (c) 2014 Songwut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIGestureRecognizer *recognizer;
}
@synthesize touchX = touchX;
@synthesize touchY = touchY;
@synthesize panTo = panTo;
- (void)viewDidLoad
{
    [super viewDidLoad];
	recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:recognizer];
    recognizer.enabled = YES;
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    
    // Get the specific point that was touched
    CGPoint point = [touch locationInView:self.view];
    touchX.text = [NSString stringWithFormat:@"Start X :%f", point.x];
    touchY.text = [NSString stringWithFormat:@"Start Y :%f", point.y];
    
}
- (void)handleGesture:(UIPanGestureRecognizer *)sender
{
    CGPoint velocity = [sender velocityInView:self.view];
    //NSLog(@"X : %f, Y : %f",localView.x,localView.y);
    
    if(velocity.x > 0)
    {
        panTo.text = [NSString stringWithFormat:@"Pan To right"];
    }
    else
    {
        panTo.text = [NSString stringWithFormat:@"Pan To left"];
    }
    /*
    if(velocity.y < 0)
    {
        panTo.text = [NSString stringWithFormat:@"Pan To top"];
    }
    else
    {
        panTo.text = [NSString stringWithFormat:@"Pan To bottom"];
    }
     */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
