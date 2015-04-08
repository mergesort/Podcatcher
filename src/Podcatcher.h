//
//  PodcastAppsManager.h
//  Picks
//
//  Created by Joe Fabisevich on 4/6/15.
//  Copyright (c) 2015 Snarkbots. All rights reserved.
//

#import <Foundation/Foundation.h>


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Enums

typedef NS_ENUM(NSUInteger, PodcastApp) {
    PodcastAppApple,
    PodcastAppOvercast,
    PodcastAppCastro,
    PodcastAppInstacast,
    PodcastAppPocketcasts,
    PodcastAppDowncast,
};


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface Podcatcher : NSObject

+ (BOOL)canOpenPodcastApp:(PodcastApp)app;
+ (void)openPodcastApp:(PodcastApp)app;
+ (BOOL)subscribeToFeedURL:(NSURL *)URL inPodcastApp:(PodcastApp)app;

@end
