//
//  LyricsController.h
//  Lyric Finder
//
//  Created by Lotanna Igwe-Odunze on 3/8/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LyricModel.h"

typedef void (^CompletionHandler)(NSString * lyrics);

NS_ASSUME_NONNULL_BEGIN

@interface LyricsController : NSObject

@property (readonly) NSMutableArray *lyrics;

- (void)findLyrics: (NSString *)song byMusician: (NSString *)musician completion: (CompletionHandler)completion;
- (void)saveNewLyrics: (NSString *)song byMusician: (NSString *)musician theLyrics: (NSString *)lyrics score: (int)rating;
- (void)updateLyrics: (LyricModel *)lyric newScore: (int)rating;
- (void)deleteLyrics: (NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
