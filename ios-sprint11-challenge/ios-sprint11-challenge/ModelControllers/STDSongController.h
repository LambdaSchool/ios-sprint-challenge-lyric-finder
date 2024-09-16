//
//  STDSongController.h
//  ios-sprint11-challenge
//
//  Created by De MicheliStefano on 05.10.18.
//  Copyright © 2018 De MicheliStefano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STDSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface STDSongController : NSObject

// Immutable readonly list of songs
@property (nonatomic, readonly) NSArray *songs;

- (void)fetchSongsWithTitle:(NSString *)title artist:(NSString *)artist completion:(void (^)(STDSong *songs, NSError *))completion;
- (void)persistSongToLocalStore:(STDSong *)song completion:(void (^)(NSError *))completion;
- (void)updateSongsInLocalStore:(STDSong *)song completion:(void (^)(NSError *))completion;
- (void)fetchSongsFromLocalStore:(void (^)(NSError *))completion;

@end

NS_ASSUME_NONNULL_END
