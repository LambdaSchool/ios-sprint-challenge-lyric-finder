//
//  LSIArtist.h
//  FaveArtists
//
//  Created by John Pitts on 7/19/19.
//  Copyright © 2019 johnpitts. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIArtist : NSObject

@property (copy) NSString *strArtist;
@property (copy) NSString *strBiographyEN;
@property long intFormedYear;

- (instancetype)initWithStrArtist:(NSString *)strArtist
                   strBiographyEN:(NSString *)strBiographyEN
                    intFormedYear:(long )intFormedYear;

/*
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
*/

@end

NS_ASSUME_NONNULL_END