//
//  AELSongController.m
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import "AELSongController.h"
#import "AELSong.h"

@interface AELSongController()

@property NSMutableArray *internalSongs;

@end

@implementation AELSongController

#pragma mark -Initializers
- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalSongs = [[NSMutableArray alloc] init];
    }
    return self;
}
#pragma mark - CRUD functions

-(void) addSongWithTitle:(NSString *) title artist: (NSString *) artist lyrics: (NSString *) lyrics rating: (NSUInteger) rating
{
    AELSong *newSong = [[AELSong alloc] initWithTitle:title artist:artist lyrics:lyrics rating:rating];
    [[self internalSongs] addObject:newSong];
    [self saveToPersistentFile];
}

-(void) updateSong:(AELSong *) song lyrics: (NSString*) lyrics rating: (NSUInteger) rating
{
    NSInteger index = [[self internalSongs] indexOfObject:song];
    [[self internalSongs] removeObject:song];
    [song setLyrics:lyrics];
    [song setRating:rating];
    [[self internalSongs] insertObject:song atIndex:index];
    [self saveToPersistentFile];
    
}

-(void) deleteSong:(AELSong *) song
{
    [[self internalSongs] removeObject:song];
}

#pragma mark - Persistence Methods
-(void) saveToPersistentFile{
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"data.json"];
    
    NSData* data = [NSJSONSerialization dataWithJSONObject:[self songs] options:0 error:NULL];
    [data writeToFile:filePath atomically:YES];
}

-(void) loadFromPersistentFile{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"data.json"];

    NSData *data = [NSData dataWithContentsOfFile: filePath];
    
    [[self internalSongs] setArray:[NSJSONSerialization JSONObjectWithData:data options:0 error: NULL]];
}

#pragma mark - Networking

- (void)searchForLyricsWithTitle:(NSString *)title by:(NSString *)artist completion:(void (^)(NSString* lyrics, NSError *error))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *artistQueryItem = [NSURLQueryItem queryItemWithName:@"q_artist" value:[artist lowercaseString]];
    NSURLQueryItem *titleQueryItem = [NSURLQueryItem queryItemWithName:@"q_track" value:[title lowercaseString]];
    [components setQueryItems: @[artistQueryItem, titleQueryItem]];
    NSURL *requestURL = [components URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    
    [request setValue:@"kXoo0gl9rEmshO0LdGwMvnzrJAsLp1n1y7FjsnDM80FhRpkgVr" forHTTPHeaderField:@"X-Mashape-Key"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *r, NSError *error) {
        if (error){
            NSLog(@"Error fetching data; %@", error);
            completion(nil,error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        if (![dictionary isKindOfClass: [NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        NSString *lyrics = dictionary[@"lyrics_body"];
        
        completion(lyrics,nil);
    }]resume];
}

#pragma mark - Properties
-(NSArray *) songs{
    return [[self internalSongs] copy];
}

static NSString * const baseURLString = @"https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1/matcher.lyrics.get";
@end
