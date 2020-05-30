//
//  SBAArtist+NSJSONSerialization.h
//  Favorite Artists
//
//  Created by Sal B Amer on 5/29/20.
//  Copyright © 2020 Sal B AmerDEv. All rights reserved.
//

#import "SBAArtist.h"

NS_ASSUME_NONNULL_BEGIN

@interface SBAArtist (NSJSONSerialization)


- (instancetype)initFromDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

//TODO Add persistence


@end

NS_ASSUME_NONNULL_END