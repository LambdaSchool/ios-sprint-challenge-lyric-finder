//
//  ALWSongController.h
//  

#import <Foundation/Foundation.h>

@class ALWSong;

NS_ASSUME_NONNULL_BEGIN

// Completion block that returns a song and an error
typedef void(^CompletionBlock)(ALWSong *, NSError *);

@interface ALWSongController : NSObject

@property (nonatomic, readonly) NSArray *savedSongs;

- (void)searchForLyricsWithArtist:(NSString *)artist title:(NSString *)title withCompletionBlock:(CompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
