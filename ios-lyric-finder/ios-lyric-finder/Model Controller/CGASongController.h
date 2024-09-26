//
//  CGASongController.h
//  ios-lyric-finder
//
//  Created by Conner on 10/5/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CGASongController : NSObject

- (void)searchForSongWithArtist:(NSString *)artist track:(NSString *)track completion:(void (^)(NSString *, NSError *))completion;
- (void)createSongWithArtist:(NSString *)artist track:(NSString *)track lyrics:(NSString *)lyrics rating:(double)rating;
- (void)loadSongsFromDocuments;

@property NSMutableArray *songs;

@end

NS_ASSUME_NONNULL_END
