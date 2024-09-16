//
//  STDSongController.m
//  ios-sprint11-challenge
//
//  Created by De MicheliStefano on 05.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import "STDSongController.h"

@interface STDSongController ()

// Internal list of songs that is mutable but not exposed externally
@property NSMutableArray *internalSongs;
@property NSString *internalFilePath;

@end

@implementation STDSongController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalSongs = [[NSMutableArray alloc] init];
    }
    return self;
}

// MARK: - Public methods

- (void)fetchSongsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(STDSong *song, NSError *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseUrlString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *artistQueryItem = [NSURLQueryItem queryItemWithName:@"q_artist" value:artist];
    NSURLQueryItem *trackQueryItem = [NSURLQueryItem queryItemWithName:@"q_track" value:title];
    [components setQueryItems:@[artistQueryItem, trackQueryItem]];
    
    NSURL *requestURL = [components URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    [request setValue:apiKey forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[NSURLSession.sharedSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        // NOT WORKING: COULDNT GET CATEGORY TO WORK
        // NSDictionary *songDict = [NSJSONSerialization getSongDictionaryForData];
        // self.internalSongs addObject:songDict["song"];
        // completion(songDict["song"], nil);
        
        
    }] resume];
}

- (void)fetchSongsFromLocalStore:(void (^)(NSError *))completion
{
    if([[NSFileManager defaultManager] fileExistsAtPath:self.internalFilePath])
    {
        NSData *data = [[NSFileManager defaultManager] contentsAtPath:self.internalFilePath];
        STDSong *fetchedSongs = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [self.internalSongs addObject:fetchedSongs];
    }
        else
    {
        NSLog(@"File not exits");
    }
}

- (void)persistSongToLocalStore:(STDSong *)song completion:(void (^)(NSError *))completion;
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:self.internalFilePath]) {
        NSData *songData = [NSKeyedArchiver archivedDataWithRootObject:song requiringSecureCoding:NO error:NULL];
        [songData writeToFile:self.internalFilePath atomically:YES];
    }
}

- (void)updateSongsInLocalStore:(STDSong *)song completion:(void (^)(NSError * _Nonnull))completion
{
}


// MARK: - Private methods

// Songs getter which return the internal mutable songs array
- (NSArray *)songs
{
    return [_internalSongs copy];
}

- (void)setFilePath:(NSString *)internalFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, @"songs"];
    self.internalFilePath = filePath;
}

static NSString * const baseUrlString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
// apiKey is hidden
static NSString * const apiKey = @"XXX";


@end
