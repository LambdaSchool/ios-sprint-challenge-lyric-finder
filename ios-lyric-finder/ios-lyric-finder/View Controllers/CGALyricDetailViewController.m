//
//  CGALyricDetailViewController.m
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "CGALyricDetailViewController.h"
#import "CGASongController.h"

@interface CGALyricDetailViewController ()
@property (strong, nonatomic) IBOutlet UITextField *songNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *artistTextField;
@property (strong, nonatomic) IBOutlet UITextView *lyricsTextView;
- (IBAction)searchForLyricsTapped:(id)sender;
- (IBAction)saveSong:(id)sender;

@end

@implementation CGALyricDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateViews];
}

- (IBAction)searchForLyricsTapped:(id)sender {
    NSString *artistName = [[self artistTextField] text];
    NSString *track = [[self songNameTextField] text];
    
    [[self songController] searchForSongWithArtist:artistName track:track completion:^(NSString * songWithLyrics, NSError * error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self lyricsTextView] setText:songWithLyrics];
        });
    }];
}

- (IBAction)saveSong:(id)sender {
    NSString *artistName = [[self artistTextField] text];
    NSString *track = [[self songNameTextField] text];
    NSString *lyrics = [[self lyricsTextView] text];
    [[self songController] createSongWithArtist:artistName track:track lyrics:lyrics rating:0.0];
    [[self navigationController] popViewControllerAnimated:true];
}

- (void)updateViews {
    if ([self song]) {
        NSString *title = [[self song] song];
        NSString *songLyrics = [[self song] lyrics];
        NSString *songArtist = [[self song] artist];
        self.title = title;
        [[self songNameTextField] setText:title];
        [[self artistTextField] setText:songArtist];
        [[self lyricsTextView] setText:songLyrics];
    }
}

@end
