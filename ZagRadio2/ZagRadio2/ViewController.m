//
//  ViewController.m
//  ZagRadio2
//
//  Created by Trevor Farthing on 3/1/16.
//  Copyright © 2016 Will Miner and Trevor Farthing. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "AVFoundation/AVAudioPlayer.h"
@import UIKit;

#define redColor colorWithRed:(213/255.0) green:(0/255.0) blue:(90/255.0) alpha:1.0

@interface ViewController () {
    //The primary title on the Listen Live viewController
    __weak IBOutlet UILabel *zagRadioLabel;
}

@end

@implementation ViewController

@synthesize dayPicker, days;


- (IBAction)playButton:(id)sender {
    
    //Images to for play and pause button of radio stream
    UIImage * play = [UIImage imageNamed:@"play.png"];
    UIImage * pause = [UIImage imageNamed:@"pause.png"];
    
    //Pauses or plays music based on button selection
    if ([sender isSelected]) {
        [sender setImage:play forState:UIControlStateNormal];
        [sender setSelected:NO];
        [self.musicPlayer pause];
    } else {
        [sender setImage:pause forState:UIControlStateSelected];
        [sender setSelected:YES];
        [self.musicPlayer play];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    //Initializes the array of days
    self.days = [[NSArray alloc] initWithObjects:@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday", nil];
    
    //Sets the custom font to the title
    zagRadioLabel.font = [UIFont fontWithName:@"Colleged" size:50.0];
    
    //Sets up the bar button to access the slide menu
    UIImage *slideIcon = [UIImage imageNamed: @"menuSlide.png"];
    self.barButton.image = slideIcon;
    
    //Sends the events WebView to the initial URL of Gonzaga's Events Facebook page
    [eventsPage loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.facebook.com/groups/291480060930116/"]]];
    
    //Sends the songs WebView to the initial URL of the Billboard Hot 100
    //NOTE: Will be replaced later with information of top played songs by ZagRadio DJ's
    [songsPage loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.billboard.com/charts/hot-100"]]];
    
    //Initializes the music player
    /*NOTE: Because we are currently working on producing the radio station and there is no official
      broadcast at the moment, a song will be played with the play button.  This will later be replaced by
     the actual online stream. */
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Mr_Brightside" withExtension:@"mp3"];
    NSError *error;
    self.musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (error)
    {
        NSLog(@"Audio player error: %@",
              [error localizedDescription]);
    } else {
        [self.musicPlayer prepareToPlay];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *) pickerView {
    return 1;
}

//Returns the number of rows in the picker (in this case, days)
-(NSInteger)pickerView:(UIPickerView *) pickerView numberOfRowsInComponent:(NSInteger)component {
    return [days count];
}

//Returns the title of each row in the picker
-(NSString *) pickerView:(UIPickerView *) pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.days objectAtIndex:row];
}

//Updates labels and other info when a pickerView row is selected
-(void) pickerView:(UIPickerView *) pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSInteger select = row;
    if (select == 0) {
        //Updates the labels for Monday
        dayTitle.text = @"MONDAY";
        show1.text = @"Mornin Blues";
        show2.text = @"EDM Hour";
        show3.text = @"Rewind and Reflect";
    } else if (select == 1) {
        //Updates the labels for Tuesday
        dayTitle.text = @"TUESDAY";
        show1.text = @"Country Sucks";
        show2.text = @"Rockin Out";
        show3.text = @"Go ZOGS";
    } else if (select == 2) {
        //Updates the labels for Wednesday
        dayTitle.text = @"WEDNESDAY";
        show1.text = @"Wake Up Call";
        show2.text = @"Afternoon Comedy";
        show3.text = @"Gangsta Rap";
    } else if (select == 3) {
        //Updates the labels for Thursday
        dayTitle.text = @"THURSDAY";
        show1.text = @"Enter the Trance";
        show2.text = @"Tropical Vibes";
        show3.text = @"Angsty Punk";
    } else if (select == 4) {
        //Updates the labels for Friday
        dayTitle.text = @"FRIDAY";
        show1.text = @"Low Key";
        show2.text = @"Get Pumped Up";
        show3.text = @"Soft Rock and Chill";
    }
    
    //Creates the image paths for each show
    NSString *show1Path = [show1.text stringByAppendingString: @".jpg"];
    NSString *show2Path = [show2.text stringByAppendingString: @".jpg"];
    NSString *show3Path = [show3.text stringByAppendingString: @".jpg"];
    //Updates the images for each show
    self.show1Img.image = [UIImage imageNamed: show1Path];
    self.show2Img.image = [UIImage imageNamed: show2Path];
    self.show3Img.image = [UIImage imageNamed: show3Path];
    
}

@end
