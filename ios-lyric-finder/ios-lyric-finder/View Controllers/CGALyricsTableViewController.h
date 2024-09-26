//
//  CGALyricsTableViewController.h
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGASongController;

NS_ASSUME_NONNULL_BEGIN

@interface CGALyricsTableViewController : UITableViewController
@property CGASongController *songController;
@end

NS_ASSUME_NONNULL_END
