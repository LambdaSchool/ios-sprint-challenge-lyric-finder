//
//  STDSong.m
//  ios-sprint11-challenge
//
//  Created by De MicheliStefano on 05.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import "STDSong.h"

@implementation STDSong

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist lyric:(NSString *)lyric
{
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
        _lyric = lyric;
        _rating = 0;
    }
    return self;
}

@end
