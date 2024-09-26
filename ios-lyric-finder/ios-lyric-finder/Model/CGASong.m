//
//  CGASong.m
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "CGASong.h"

@implementation CGASong

- (instancetype)initWithSong:(NSString *)song artist:(NSString *)artist lyrics:(NSString *)lyrics rating:(int)rating {
    self = [super init];
    if (self) {
        _song = song;
        _artist = artist;
        _lyrics = lyrics;
        _rating = rating;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:[self song] forKey:@"song"];
    [encoder encodeObject:[self artist] forKey:@"artist"];
    [encoder encodeObject:[self lyrics] forKey:@"lyrics"];
    [encoder encodeObject:[NSString stringWithFormat:@"%i", [self rating]] forKey:@"rating"];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self) {
        self.song = [aDecoder decodeObjectForKey:@"song"];
        self.artist = [aDecoder decodeObjectForKey:@"artist"];
        self.lyrics = [aDecoder decodeObjectForKey:@"lyrics"];
        self.rating = [[aDecoder decodeObjectForKey:@"rating"] intValue];
    }
    return self;
}

@end
