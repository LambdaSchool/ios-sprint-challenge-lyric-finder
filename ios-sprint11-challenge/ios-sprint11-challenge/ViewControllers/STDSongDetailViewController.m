//
//  STDSongDetailViewController.m
//  ios-sprint11-challenge
//
//  Created by De MicheliStefano on 05.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import "STDSongDetailViewController.h"
#import "STDSongController.h"
#import "STDSong.h"

@interface STDSongDetailViewController ()

@end

@implementation STDSongDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateViews];
}

- (void)updateViews
{
    if (self.song) {
        
        [self.ratingTextLabel setText: [NSString stringWithFormat:@"Rating: %ld", self.song.rating]];
        [self.songTextField setText:self.song.title];
        [self.artistTextField  setText:self.song.artist];
        [self.lyricsTextView setText:self.song.lyric];
    }
}

- (IBAction)ratingStepper:(UIStepper *)sender
{
    
}

- (IBAction)search:(UIButton *)sender
{
    NSString *title = [self.songTextField text];
    NSString *artist = [self.artistTextField text];
    
    [self.songController fetchSongsWithTitle:title artist:artist completion:^(STDSong * _Nonnull song, NSError * error) {
        if (error) {
            NSLog(@"Error fetching songs from server.");
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updateViews];
        });
    }];
}

- (IBAction)save:(UIBarButtonItem *)sender
{
    NSString *title = [self.songTextField text];
    NSString *artist = [self.artistTextField text];
    NSString *lyric = [self.lyricsTextView text];
    
    // If does not exist then save, else update and save
    if (!self.song) {
        STDSong *song = [[STDSong alloc] initWithTitle:title artist:artist lyric:lyric];
        
        [self.songController persistSongToLocalStore:song completion:^(NSError * error) {
            if (error) {
                NSLog(@"Error saving songs in local store.");
            }
        }];
    } else {
        self.song.artist = artist;
        self.song.title = title;
        self.song.lyric = lyric;
        self.song.rating = *(self.rating);
        
        [self.songController updateSongsInLocalStore:self.song completion:^(NSError * error) {
            if (error) {
                NSLog(@"Error updating songs in local store.");
            }
        }];
    }
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
