//
//  CGASong.h
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGASong : NSObject

- (instancetype)initWithSong:(NSString *)song artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int) rating;

@property NSString *song;
@property NSString *artist;
@property NSString *lyrics;
@property int rating;

@end

NS_ASSUME_NONNULL_END
