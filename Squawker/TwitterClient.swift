//
//  TwitterClient.swift
//  Squawker
//
//  Created by Kenneth Pu on 10/1/15.
//  Copyright © 2015 Kenneth Pu. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let kTwitterConsumerKey = valueForAPIKey("API_KEY")
let kTwitterConsumerSecret = valueForAPIKey("API_SECRET")
let kTwitterBaseUrl = "https://api.twitter.com"

class TwitterClient: BDBOAuth1RequestOperationManager {
    static let sharedInstance = TwitterClient(baseURL: NSURL(string: kTwitterBaseUrl), consumerKey: kTwitterConsumerKey, consumerSecret: kTwitterConsumerSecret)
    
}
