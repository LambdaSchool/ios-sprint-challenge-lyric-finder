//
//  AELSong.h
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AELSong : NSObject

-(instancetype) initWithTitle:(NSString *) title artist:(NSString *) artist lyrics:(NSString*) lyrics rating: (NSUInteger) rating;

@property (readonly) NSString *title;
@property (readonly) NSString *artist;
@property NSString *lyrics;
@property NSUInteger rating;

@end

NS_ASSUME_NONNULL_END
