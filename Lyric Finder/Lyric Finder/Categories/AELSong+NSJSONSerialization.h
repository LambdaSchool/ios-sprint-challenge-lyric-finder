//
//  AELSong+NSJSONSerialization.h
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import "AELSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface AELSong (NSJSONSerialization)

-(instancetype) initWithDictionary: (NSDictionary *) dictionary;

-(NSDictionary *) dictionaryForm;

@end

NS_ASSUME_NONNULL_END
