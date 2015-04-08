# Podcatcher

A library for interacting with iOS Podcast apps.

__Currently supported podcast apps__

```
Podcasts
Overcast
Castro
Instacast
Pocketcasts
Downcast
```

_If you'd like your podcast app added, just create an issue or pull request._

<br>
Working with Podcatcher is simple enough. It only has 3 methods.
<br><br>

```
+ (BOOL)canOpenPodcastApp:(PodcastApp)app;
```
This method checks whether or not a podcast app can be opened, i.e. whether it is installed on the user's device.

<br>

```
+ (void)openPodcastApp:(PodcastApp)app;
```
This method opens a podcast app, if it's installed on the user's device. Otherwise, it will just return.

<br>

```
+ (BOOL)subscribeToFeedURL:(NSURL *)URL inPodcastApp:(PodcastApp)app;
```
This method subscribes to a podcast feed in the app of choice. Unfortunately not every app supports subscribing via URL scheme, so if it doesn't, this method will return `false`.

<br>
And that's it... Hope this can be of use to you. 🙌