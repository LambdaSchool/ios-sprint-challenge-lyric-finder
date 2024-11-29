//
//  SearchViewController.h
//  Lyric Finder
//
//  Created by Lotanna Igwe-Odunze on 3/1/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LyricsController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController

@property LyricsController *lyricsController;

@property LyricModel *currentLyrics;

@end

NS_ASSUME_NONNULL_END
