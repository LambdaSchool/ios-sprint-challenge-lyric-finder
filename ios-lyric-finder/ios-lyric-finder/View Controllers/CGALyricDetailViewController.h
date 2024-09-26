//
//  CGALyricDetailViewController.h
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGASongController.h"
#import "CGASong.h"

NS_ASSUME_NONNULL_BEGIN

@interface CGALyricDetailViewController : UIViewController
@property CGASongController *songController;
@property CGASong *song;
@end

NS_ASSUME_NONNULL_END
