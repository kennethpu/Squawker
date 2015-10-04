//
//  TweetsViewController.swift
//  Squawker
//
//  Created by Kenneth Pu on 10/4/15.
//  Copyright © 2015 Kenneth Pu. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {
    var tweets: [Tweet]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TwitterClient.sharedInstance.homeTimelineWithCompletion(nil, completion: { (tweets: [Tweet]?, error: NSError?) -> () in
            self.tweets = tweets
        })
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }
}
