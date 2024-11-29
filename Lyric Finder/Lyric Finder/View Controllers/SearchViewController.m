//
//  SearchViewController.m
//  Lyric Finder
//
//  Created by Lotanna Igwe-Odunze on 3/1/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

//Properties and Outlets
@property (weak, nonatomic) IBOutlet UITextField *songField;
@property (weak, nonatomic) IBOutlet UITextField *musicianField;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIStepper *lyricScore;
@property (weak, nonatomic) IBOutlet UITextView *lyricsView;

//Actions
- (IBAction)searchClicked:(id)sender;
- (IBAction)stepperClicked:(UIStepper *)sender;
- (IBAction)saveLyrics:(id)sender;

//Functions
- (void)updateScore: (int)rating;
- (void)updateSearchView;

@end

@implementation SearchViewController

//Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateSearchView];
}

//Functions

//Set the rating score label.
- (void)updateScore:(int)rating {
    [self.scoreLabel setText:[NSString stringWithFormat:@"Rating: %d", rating]];
}

//Set changes
- (void)updateSearchView {
    if (_currentLyrics) {
        [self setTitle: self.currentLyrics.song];
        [self.musicianField setText: self.currentLyrics.musician];
        [self.songField setText: self.currentLyrics.song];
        [self.lyricsView setText: self.currentLyrics.lyrics];
        [self.lyricScore setValue: self.currentLyrics.rating];
    } else {
        [self setTitle: @"New Song Lyrics"];
        [self.lyricScore setValue: 5];
    }
    
    [self updateScore: self.lyricScore.value];
}

//Actions
- (IBAction)stepperClicked:(UIStepper *)sender {
    [self updateScore: sender.value];
}

//Searching for lyrics
- (IBAction)searchClicked:(UIButton *)sender {
    NSString *song = self.songField.text;
    NSString *musician = self.musicianField.text;
    [sender setEnabled: NO];
    if (song && ![song isEqualToString:@""] && musician && ![musician isEqualToString:@""]) {
        [self.lyricsController findLyrics:song byMusician:musician completion:^(NSString *lyrics) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.lyricsView setText: lyrics];
                [sender setEnabled: YES];
            });
        }];
    }
    
}

- (IBAction)saveLyrics:(id)sender {
    NSString *song = self.songField.text;
    NSString *musician = self.musicianField.text;
    NSString *lyrics = self.lyricsView.text;
    int rating = self.lyricScore.value;
    
    if (self.currentLyrics) {
        [self.lyricsController updateLyrics:self.currentLyrics newScore:rating];
        [self.navigationController popViewControllerAnimated: YES];
    } else {
        if (song && ![song isEqualToString:@""] && musician && ![musician isEqualToString:@""] && lyrics && ![lyrics isEqualToString:@""]) {
            [self.lyricsController saveNewLyrics:song byMusician:musician theLyrics:lyrics score:rating];
            [self.navigationController popViewControllerAnimated: YES];
        }
    }
    
}



@end
