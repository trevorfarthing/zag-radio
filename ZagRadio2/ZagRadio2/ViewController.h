//
//  ViewController.h
//  ZagRadio2
//
//  Created by Trevor Farthing on 3/1/16.
//  Copyright © 2016 Will Miner and Trevor Farthing. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVFoundation/AVAudioPlayer.h"

@interface ViewController : UIViewController {
    //Title for the selected day on the schedule
    IBOutlet UILabel *dayTitle;
    //Picker allowing user to select a day on the schedule
    IBOutlet UIPickerView *dayPicker;
    //Array to contain the various days in the picker
    NSArray *days;
    
    //Labels for the shows at various timeslots in the schedule
    IBOutlet UILabel *show1;
    IBOutlet UILabel *show2;
    IBOutlet UILabel *show3;
    
    //Gonzaga Events facebook page WebView
    IBOutlet UIWebView *eventsPage;
    
    //Top Songs WebView for the Songs ViewController
    IBOutlet UIWebView *songsPage;
   
}
//ImageViews for the available shows in the schedule
@property (weak, nonatomic) IBOutlet UIImageView *show1Img;
@property (weak, nonatomic) IBOutlet UIImageView *show2Img;
@property (weak, nonatomic) IBOutlet UIImageView *show3Img;

//Item to change between ViewControllers using slide out menu
@property(weak,nonatomic) IBOutlet UIBarButtonItem *barButton;

//File path for the song
@property(weak, nonatomic) NSURL *song;

//Player which actually plays the radio broadcast
@property(strong, nonatomic) AVAudioPlayer *musicPlayer;

//Picker for the day of the week to display the schedule
@property (retain, nonatomic)  IBOutlet UIPickerView *dayPicker;
//Holds the Strings of various days
@property (retain, nonatomic)  NSArray *days;

@end

