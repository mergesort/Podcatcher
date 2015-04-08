//
//  PodcastAppsManager.m
//  Picks
//
//  Created by Joe Fabisevich on 4/6/15.
//  Copyright (c) 2015 Snarkbots. All rights reserved.
//

#import "Podcatcher.h"


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Constants

NSString * const appleURLScheme = @"pcast://";
NSString * const overcastURLScheme = @"overcast://";
NSString * const castroURLScheme = @"castro://";
NSString * const castroHTTPSURLScheme = @"castros://";
NSString * const instacastURLScheme = @"icast://";
NSString * const pocketcastsURLScheme = @"pktc://";
NSString * const downcastURLScheme = @"downcast://";


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation Podcatcher

+ (BOOL)canOpenPodcastApp:(PodcastApp)app
{
    NSURL *appURL = [self appURLForApp:app];
    return [[UIApplication sharedApplication] canOpenURL:appURL];
}

+ (void)openPodcastApp:(PodcastApp)app
{
    if ([self canOpenPodcastApp:app])
    {
        NSURL *appURL = [self appURLForApp:app];
        [[UIApplication sharedApplication] openURL:appURL];
    }
}

+ (BOOL)canSubscribeToFeedInPodcastApp:(PodcastApp)app
{
    return app == PodcastAppApple ||
    app == PodcastAppOvercast ||
    app == PodcastAppCastro ||
    app == PodcastAppDowncast;
}

+ (BOOL)subscribeToFeedURL:(NSURL *)URL inPodcastApp:(PodcastApp)app
{
    NSString *URLString = nil;
    NSString *feedURLString = URL.absoluteString;

    switch (app)
    {
        case PodcastAppApple:
        {
            URLString = [NSString stringWithFormat:@"%@%@", appleURLScheme, [Podcatcher schemelessURLString:URL]];
            break;
        }

        case PodcastAppOvercast:
        {
            URLString = [NSString stringWithFormat:@"%@x-callback-url/add?url=%@", overcastURLScheme, feedURLString];
            break;
        }

        case PodcastAppCastro:
        {
            NSString *URLScheme = ([URLString hasPrefix:@"https://"]) ? castroHTTPSURLScheme : castroURLScheme;
            URLString = [NSString stringWithFormat:@"%@subscribe/%@", URLScheme, [Podcatcher schemelessURLString:URL]];
            break;
        }

        case PodcastAppInstacast:
        {
            URLString = nil;
            break;
        }

        case PodcastAppPocketcasts:
        {
            URLString = nil;
            break;
        }

        case PodcastAppDowncast:
        {
            URLString = [NSString stringWithFormat:@"%@%@", downcastURLScheme, [Podcatcher schemelessURLString:URL]];
            break;
        }

        default:
            break;
    }

    if (URLString.length > 0)
    {
        NSURL *appURL = [NSURL URLWithString:URLString];
        [[UIApplication sharedApplication] openURL:appURL];
        return YES;
    }
    else
    {
        return NO;
    }
}


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private helpers

+ (NSString *)URLSchemeForApp:(PodcastApp)app
{
    NSString *appURLScheme = nil;
    switch (app)
    {
        case PodcastAppApple:
        {
            appURLScheme = appleURLScheme;
            break;
        }

        case PodcastAppOvercast:
        {
            appURLScheme = overcastURLScheme;
            break;
        }

        case PodcastAppCastro:
        {
            appURLScheme = castroURLScheme;
            break;
        }

        case PodcastAppInstacast:
        {
            appURLScheme = instacastURLScheme;
            break;
        }
            
        case PodcastAppPocketcasts:
        {
            appURLScheme = pocketcastsURLScheme;
            break;
        }
            
        case PodcastAppDowncast:
        {
            appURLScheme = downcastURLScheme;
            break;
        }
            
        default:
            break;
    }

    return appURLScheme;
}

+ (NSURL *)appURLForApp:(PodcastApp)app
{
    NSString *appURLScheme = [Podcatcher URLSchemeForApp:app];
    return [NSURL URLWithString:appURLScheme];
}

+ (NSString *)schemelessURLString:(NSURL *)URL
{
    NSString *URLString = URL.absoluteString;
    NSString *schemelessURLString = [URLString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@://", URL.scheme] withString:@""];

    return schemelessURLString;
}

@end
