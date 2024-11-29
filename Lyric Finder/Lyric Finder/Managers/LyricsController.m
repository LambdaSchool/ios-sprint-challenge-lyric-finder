//
//  LyricsController.m
//  Lyric Finder
//
//  Created by Lotanna Igwe-Odunze on 3/8/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

#import "LyricsController.h"
#import "LyricsJSONSerialisation.h"

@interface LyricsController ()

@end

@implementation LyricsController

static NSString * baseURL = @"https://musixmatchcom-musixmatch.p.rapidapi.com/wsr/1.1/matcher.lyrics.get";
static NSString * apiKey = @"39fb0b75e8msh8db9748aa458e88p19ea96jsn066d04b6bfba";

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _lyrics = [[NSMutableArray alloc] init];
    }
    return self;
}

//Find and Download Lyrics
- (void)findLyrics:(NSString *)song byMusician:(NSString *)musician completion:(CompletionHandler)completion {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString: baseURL];
    NSURLQueryItem *musicianName = [NSURLQueryItem queryItemWithName:@"q_artist" value: musician];
    NSURLQueryItem *songName = [NSURLQueryItem queryItemWithName:@"q_track" value: song];
    [urlComponents setQueryItems:@[musicianName, songName]];
    
    NSURL *requestURL = urlComponents.URL;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setValue: apiKey forHTTPHeaderField:@"X-RapidAPI-Key"];
    
    NSURLSessionDataTask *datatask = [NSURLSession.sharedSession dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching lyrics: %@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (data) {
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData: data options: 0 error: NULL];
            NSString *lyrics = results[@"lyrics_body"];
            completion(lyrics);
            return;
        } else {
            NSLog(@"Couldn't find any lyrics.");
            completion(nil);
        }
    }];
    
    [datatask resume];
}

//CRUD the downloaded lyrics
- (void)saveNewLyrics:(NSString *)song byMusician:(NSString *)musician theLyrics:(NSString *)lyrics score:(int)rating {
    LyricModel *newLyrics = [[LyricModel alloc] initLyrics:song byMusician:musician theLyrics:lyrics score:rating];
    [self.lyrics addObject: newLyrics];
}

- (void)updateLyrics:(LyricModel *)lyric newScore:(int)rating {
    [lyric setRating: rating];
}

- (void)deleteLyrics:(NSIndexPath *)indexPath {
    [self.lyrics removeObjectAtIndex: indexPath.row];
}

@end
