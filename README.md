# Squawker
A simple iOS Twitter client

Time spent: 16 hours

### Features

#### Required

- [x] User can sign in using OAuth login flow
- [x] User can view last 20 tweets from their home timeline
- [x] The current signed in user will be persisted across restarts
- [x] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp
- [x] User can pull to refresh
- [x] User can compose a new tweet by tapping on a compose button
- [x] User can tap on a tweet to view it, with controls to retweet, favorite, and reply

#### Optional

- [x] When composing a tweet, user can see an up-to-date count of characters remaining
- [x] After creating a new tweet, user is able to view it in the timeline immediately without refetching the timeline from the network
- [x] Retweeting and favoriting increment the retweet and favorite count
- [x] User is able to unfavorite and decrement the favorite count
- [x] Replies are prefixed with the username and the reply_id is set when posting the tweet

### Walkthrough
![Video Walkthrough](/res/codepath_squawker_demo.gif)

Credits
---------
* [Twitter API](https://dev.twitter.com/rest/public)
* [AFNetworking](https://github.com/AFNetworking/AFNetworking)
* [BDBOAuth1Manager](https://github.com/bdbergeron/BDBOAuth1Manager)
* Icons from [Twitter](https://dev.twitter.com/overview/general/image-resources) and [IconFinder](https://www.iconfinder.com/)
