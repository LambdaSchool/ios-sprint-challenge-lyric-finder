//
//  AELSongController.h
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AELSong;

NS_ASSUME_NONNULL_BEGIN

@interface AELSongController : NSObject

@property (readonly) NSArray *songs;

#pragma mark CRUD
-(void) addSongWithTitle:(NSString *) title artist: (NSString *) artist lyrics: (NSString *) lyrics rating: (NSUInteger) rating;
-(void) updateSong:(AELSong *) song lyrics: (NSString*) lyrics rating: (NSUInteger) rating;
-(void) deleteSong:(AELSong *) song;

#pragma mark Networking
- (void)searchForLyricsWithTitle:(NSString *)title by:(NSString *)artist completion:(void (^)(NSString* lyrics, NSError *error))completion;

#pragma mark Persistence
-(void) loadFromPersistentFile;
-(void) saveToPersistentFile;
@end

NS_ASSUME_NONNULL_END
