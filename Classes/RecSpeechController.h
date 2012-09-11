//
//  RecSpeechController.h
//  ChapeuzinhoVermelho
//
//  Created by Thiago on 9/6/12.
//  Copyright 2012 LPJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

NSString *fileName;

@interface RecSpeechController : UIViewController 
			<AVAudioRecorderDelegate, AVAudioPlayerDelegate> 
{
	AVAudioRecorder *audioRecorder;
    AVAudioPlayer *audioPlayer;

	IBOutlet UIScrollView *textToRead;
    UIImageView *textImage;
	
}

@property (nonatomic, retain) UIView *textToRead;
@property (nonatomic, retain) UIImageView *textImage;

-(IBAction)swapViews:(id)sender;
-(IBAction)chapterSelection:(id)sender;
-(IBAction)playAudio;
-(IBAction)recordAudio;
-(IBAction)stop;


@end
