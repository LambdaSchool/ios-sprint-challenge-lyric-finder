//
//  STDSong.h
//  ios-sprint11-challenge
//
//  Created by De MicheliStefano on 05.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STDSong : NSObject

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyric:(NSString *)lyric;

@property NSString *title;
@property NSString *artist;
@property NSString *lyric;
@property NSInteger rating;

@end

NS_ASSUME_NONNULL_END
