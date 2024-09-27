//
//  AELSong+NSJSONSerialization.m
//  Lyric Finder
//
//  Created by Andrew Dhan on 10/5/18.
//  Copyright © 2018 Andrew Liao. All rights reserved.
//

#import "AELSong+NSJSONSerialization.h"

@implementation AELSong (NSJSONSerialization)

-(instancetype) initWithDictionary: (NSDictionary *) dictionary
{
    self = [super init];
    if (self) {
        NSString *title = dictionary[@"title"];
        NSString *artist = dictionary[@"artist"];
        NSString *lyrics = dictionary[@"lyrics"];
        NSNumber *rating = dictionary[@"rating"];
        return [self initWithTitle:title artist:artist lyrics:lyrics rating:rating.unsignedIntegerValue];
    }
    return self;
}

-(NSDictionary *) dictionaryForm{
    NSMutableDictionary* dictionary = [NSMutableDictionary init];
    dictionary[@"title"] = [self title];
    dictionary[@"artist"] = [self artist];
    dictionary[@"lyrics"] = [self lyrics];
    dictionary[@"rating"] = @([self rating]);
    
    return [dictionary copy];
}

@end
