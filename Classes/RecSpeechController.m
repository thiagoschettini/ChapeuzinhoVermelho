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
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@implementation RecSpeechController

@synthesize textImage, textToRead;

-(IBAction)swapViews:(id)sender{
	ChapeuzinhoVermelhoAppDelegate *delegate = (ChapeuzinhoVermelhoAppDelegate *)[[UIApplication sharedApplication] delegate];
	InitialScreenController *initialScreen = [[InitialScreenController alloc] initWithNibName:@"InitialScreen" bundle:nil];
	[delegate switchViews:self.view toView:initialScreen.view];
}

-(IBAction)recordAudio{
    NSArray *dirPaths;
    NSString *docsDir;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent:fileName];
    
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    NSDictionary *recordSettings = [NSDictionary 
                                    dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderAudioQualityKey,
                                    [NSNumber numberWithInt:16], 
                                    AVEncoderBitRateKey,
                                    [NSNumber numberWithInt: 2], 
                                    AVNumberOfChannelsKey,
                                    [NSNumber numberWithFloat:44100.0], 
                                    AVSampleRateKey,
                                    nil];
    
    NSError *error = nil;
    
    audioRecorder = [[AVAudioRecorder alloc] initWithURL:soundFileURL settings:recordSettings error:&error];
    
    if(error){
        NSLog(@"error: %@", [error localizedDescription]);
    }else{
        [audioRecorder prepareToRecord];
    }    
    
    if(!audioRecorder.recording){
        [audioRecorder record];
    }
    NSLog(@"url arquivo audio: %@", audioRecorder.url);
}

-(IBAction)stop{
    
    if(audioRecorder.recording){
        [audioRecorder stop];
    }else if(audioPlayer.playing){
        [audioPlayer stop];
    }
}

-(IBAction)playAudio{
    
    NSArray *dirPaths;
    NSString *docsDir;
    NSError *error;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    NSString *soundFilePath = [docsDir stringByAppendingPathComponent:fileName];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
    [audioPlayer play];
    NSLog(@"%@", fileName);
}

-(IBAction)chapterSelection:(UIButton *)sender {
    [textImage setImage:nil];
    
    CGPoint bottomOffset = CGPointMake(0, 0);
    [textToRead setContentOffset:bottomOffset animated:YES];
    
    if (sender.tag == 101){
        //filename = @"audioForScene1.caf"; ---> ESTAVA FUNCIONANDO COM ESTA LINHA APENAS
        fileName = @"audioForScene1.caf";
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 311)];
        [textImage setImage:[UIImage imageNamed:@"chap01text.png"]];
    }else if(sender.tag == 102){
        fileName = @"audioForScene2.caf";
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 1024)];
        [textImage setImage:[UIImage imageNamed:@"chap02text.png"]];
    }else if(sender.tag == 103){
        fileName = @"audioForScene3.caf";
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 108)];
        [textImage setImage:[UIImage imageNamed:@"chap03text.png"]];
    }else if(sender.tag == 104){
        fileName = @"audioForScene4.caf";
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 231)];
        [textImage setImage:[UIImage imageNamed:@"chap04text.png"]];
    }else if(sender.tag == 105){
        fileName = @"audioForScene5.caf";
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 257)];
        [textImage setImage:[UIImage imageNamed:@"chap05text.png"]];
    }else if(sender.tag == 106){
        fileName = @"audioForScene6.caf";
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 252)];
        [textImage setImage:[UIImage imageNamed:@"chap06text.png"]];
    }else if(sender.tag == 107){
        fileName = @"audioForScene7.caf";
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 537)];
        [textImage setImage:[UIImage imageNamed:@"chap07text.png"]];
    }else if(sender.tag == 108){
        fileName = @"audioForScene8.caf";
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 456)];
        [textImage setImage:[UIImage imageNamed:@"chap08text.png"]];
    }else if(sender.tag == 109){
        fileName = @"audioForScene9.caf";
        textImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 340, 311)];
        [textImage setImage:[UIImage imageNamed:@"chap09text.png"]];
    }
    [textToRead addSubview:textImage];
    [textToRead setContentSize:CGSizeMake(textImage.frame.size.width, textImage.frame.size.height+5)];
    [textToRead setScrollEnabled:YES];
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	textToRead = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 20, 340, 120)];
    [self.view addSubview:textToRead];
}



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
