//
//  RecSpeechController.m
//  ChapeuzinhoVermelho
//
//  Created by Thiago on 9/6/12.
//  Copyright 2012 LPJ. All rights reserved.
//

#import "RecSpeechController.h"
#import "ChapeuzinhoVermelhoAppDelegate.h"
#import	"InitialScreenController.h"

@implementation RecSpeechController

-(IBAction)swapViews:(id)sender{
	ChapeuzinhoVermelhoAppDelegate *delegate = (ChapeuzinhoVermelhoAppDelegate *)[[UIApplication sharedApplication] delegate];
	InitialScreenController *initialScreen = [[InitialScreenController alloc] initWithNibName:@"InitialScreen" bundle:nil];
	[delegate switchViews:self.view toView:initialScreen.view];
}
// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
