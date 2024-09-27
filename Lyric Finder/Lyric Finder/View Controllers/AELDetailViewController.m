//
//  AELDetailViewController.m
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import "AELDetailViewController.h"
#import "AELSong.h"
#import "AELSongController.h"

@interface AELDetailViewController ()

@end

@implementation AELDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateView];
}

-(void) updateView
{
    if (![self isViewLoaded]){
        return;
    }
    if([self song]){
        //if there is a song
        [self setTitle: @"View Song Lyric"];
        
        [[self songTitleField] setText: [[self song] title]];
        [[self artistField] setText: [[self song] artist]];
        [[self lyricTextView] setText: [[self song] lyrics]];
        [[self ratingLabel] setText: [@(self.song.rating) stringValue]];
        
    } else {
        [self setTitle: @"Add Song Lyric"];
        
        [[self lyricTextView] setText: @""];
        [[self ratingLabel] setText: @"0"];
        
    }
}


- (IBAction)save:(id)sender {
    NSString *title = [[self songTitleField] text];
    NSString *artist = [[self artistField] text];
    NSString *lyrics = [[self lyricTextView] text];
    NSUInteger rating = [[[self ratingLabel] text] integerValue];
    
    if(![self song]){
        [[self songController] addSongWithTitle:title artist:artist lyrics:lyrics rating:rating ];
    } else {
        [[self songController] updateSong:[self song] lyrics:lyrics rating:rating];
    }
    
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)ratingControl:(id)sender {
    NSUInteger index = [[self ratingSegmentControl] selectedSegmentIndex];
    NSUInteger rating = [[[self ratingLabel] text] integerValue];
    if(index == 0) {
        rating -= 1;
    } else {
        rating += 1;
    }
    [[self ratingLabel] setText: [@(rating) stringValue]];
    
}

- (IBAction)search:(id)sender {
    NSString *title = [[self songTitleField] text];
    NSString *artist = [[self artistField] text];
    
    [[self songController] searchForLyricsWithTitle:title by:artist completion:^(NSString * lyrics, NSError * error) {
        if (error){
            NSLog(@"Error searching for lyrics: %@", error);
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self lyricTextView] setText: lyrics];
        });
        
    }];
}
@end
