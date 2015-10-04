//
//  Tweet.swift
//  Squawker
//
//  Created by Kenneth Pu on 10/3/15.
//  Copyright © 2015 Kenneth Pu. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var dictionary: NSDictionary
    var author: User?
    var text: String?
    var createdAt: NSDate?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        author = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        let createdAtString = dictionary["created_at"] as? String
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        return tweets
    }
}
