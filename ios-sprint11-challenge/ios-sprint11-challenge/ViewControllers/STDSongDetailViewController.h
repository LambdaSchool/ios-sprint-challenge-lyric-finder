//
//  STDSongDetailViewController.h
//  ios-sprint11-challenge
//
//  Created by De MicheliStefano on 05.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STDSong.h"
#import "STDSongController.h"

NS_ASSUME_NONNULL_BEGIN

@interface STDSongDetailViewController : UIViewController

@property STDSong *song;
@property STDSongController *songController;
@property NSInteger *rating;
@property (weak, nonatomic) IBOutlet UILabel *ratingTextLabel;
@property (weak, nonatomic) IBOutlet UITextField *songTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;
@property (weak, nonatomic) IBOutlet UITextView *lyricsTextView;

- (void)updateViews;
- (IBAction)save:(UIBarButtonItem *)sender;
- (IBAction)search:(UIButton *)sender;
- (IBAction)ratingStepper:(UIStepper *)sender;

@end

NS_ASSUME_NONNULL_END
