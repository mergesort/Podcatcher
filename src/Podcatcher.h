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

/**
 *  Determine whether a podcast app is installed.
 *
 *  @param app Which app to check install state for.
 *
 *  @return true if the app is installed
 */
+ (BOOL)canOpenPodcastApp:(PodcastApp)app;

/**
 *  Open a podcast app. It's best to check if the app is installed first.
 *
 *  @param app Which app to open.
 */
+ (void)openPodcastApp:(PodcastApp)app;

/**
 *  Opens the subscribe mechanism in a supported podcast app.
 *
 *  @param URL The feed URL to subscribe to.
 *  @param app Which app to open.
 *
 *  @return false if the app is not installed, if installed will not return because it will open another app.
 */
+ (BOOL)subscribeToFeedURL:(NSURL *)URL inPodcastApp:(PodcastApp)app;

@end
