//
//  LyricsJSONSerialisation.m
//  Lyric Finder
//
//  Created by Lotanna Igwe-Odunze on 3/8/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

#import "LyricsJSONSerialisation.h"

@implementation LyricModel (NSJSONSerialization)

- (instancetype)initDictionary:(NSDictionary *)dictionary {
    NSString *song = dictionary[@"song"];
    NSString *musician = dictionary[@"musician"];
    NSString *lyrics = dictionary[@"lyrics"];
    NSNumber *rating = dictionary[@"rating"];
    
    return [self initLyrics: song byMusician: musician theLyrics: lyrics score: rating.intValue];
}

- (NSDictionary *)lyricsDictionary {
    return @{@"song": self.song, @"musician": self.musician, @"lyrics": self.lyrics, @"rating": @(self.rating)};
}

@end
