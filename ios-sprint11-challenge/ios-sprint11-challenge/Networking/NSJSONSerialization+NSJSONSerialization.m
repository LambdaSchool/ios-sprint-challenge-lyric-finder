//
//  NSJSONSerialization+NSJSONSerialization.m
//  ios-sprint11-challenge
//
//  Created by De MicheliStefano on 05.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import "NSJSONSerialization+NSJSONSerialization.h"
#import "STDSong.h"

@interface NSJSONSerialization ()

@property (nonatomic, strong) STDSong *song;

@end

@implementation NSJSONSerialization (NSJSONSerialization)

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.song = [[STDSong alloc] init];
    }
    return self;
}

- (NSDictionary *)getSongDictionaryForData:(NSData *)data artist:(NSString *)artist title:(NSString *)title
{
    NSMutableDictionary *songDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    if (![songDict isKindOfClass:[NSDictionary class]]) {
        NSLog(@"JSON was not a dictionary");
    }
    
    NSString *lyric = songDict[@"lyrics_body"];
    
    self.song.lyric = lyric;
    self.song.artist = artist;
    self.song.title = title;
    self.song.rating = 0;
    
    return [NSDictionary dictionaryWithObjectsAndKeys:@"song", self.song, nil];
}


@end
