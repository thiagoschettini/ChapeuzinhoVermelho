//
//  ChapeuzinhoVermelhoAppDelegate.h
//  ChapeuzinhoVermelho
//
//  Created by Thiago on 9/6/12.
//  Copyright 2012 LPJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InitialScreenController;

@interface ChapeuzinhoVermelhoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	InitialScreenController *initialScreen;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) InitialScreenController *initialScreen;

-(void)switchViews:(UIView *)view1 toView:(UIView *)view2;

@end