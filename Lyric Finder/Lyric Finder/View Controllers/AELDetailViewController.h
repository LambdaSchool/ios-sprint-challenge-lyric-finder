//
//  AELDetailViewController.h
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AELSongController;
@class AELSong;

NS_ASSUME_NONNULL_BEGIN

@interface AELDetailViewController : UIViewController
- (IBAction)save:(id)sender;
- (IBAction)ratingControl:(id)sender;
- (IBAction)search:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *songTitleField;
@property (weak, nonatomic) IBOutlet UITextField *artistField;
@property (weak, nonatomic) IBOutlet UITextView *lyricTextView;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *ratingSegmentControl;
@property AELSongController *songController;
@property AELSong *song;
@end

NS_ASSUME_NONNULL_END
