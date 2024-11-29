//
//  LyricModel.h
//  Lyric Finder
//
//  Created by Lotanna Igwe-Odunze on 3/1/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LyricModel : NSObject

@property (copy) NSString *song;
@property (copy) NSString *musician;
@property (copy) NSString *lyrics;
@property int rating;

- (instancetype)initLyrics: (NSString *)song byMusician: (NSString *)musician theLyrics: (NSString *)lyrics score: (int)rating;

@end

NS_ASSUME_NONNULL_END
