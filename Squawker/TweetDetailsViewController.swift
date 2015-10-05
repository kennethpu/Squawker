//
//  TweetDetailsViewController.swift
//  Squawker
//
//  Created by Kenneth Pu on 10/4/15.
//  Copyright © 2015 Kenneth Pu. All rights reserved.
//

import UIKit

class TweetDetailsViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet: Tweet! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = 3
        profileImageView.clipsToBounds = true
        
        let request = NSURLRequest(URL: (tweet.author?.profileImageURL)!)
        weak var weakIV = profileImageView
        profileImageView.setImageWithURLRequest(request, placeholderImage: nil, success: { (request, response, image) -> Void in
            weakIV!.image = image
            if (response != nil && response!.statusCode != 0) {
                weakIV!.alpha = 0.0
                UIView.animateWithDuration(0.5) {
                    weakIV!.alpha = 1.0
                }
            }
            }, failure: nil)
        fullNameLabel.text = tweet.author?.name
        usernameLabel.text = "@\(tweet.author!.screenName!)"
        tweetTextLabel.text = tweet.text
        timeStampLabel.text = self.formatTimestamp(tweet.createdAt!)
        let retweetCount = tweet.retweetCount!
        retweetCountLabel.text = "\(retweetCount)"
        retweetsLabel.text = retweetCount == 1 ? "RETWEET" : "RETWEETS"
        let favoriteCount = tweet.favoriteCount!
        favoriteCountLabel.text = "\(favoriteCount)"
        favoritesLabel.text = favoriteCount == 1 ? "FAVORITE" : "FAVORITES"
        retweetButton.selected = tweet.retweeted!
        favoriteButton.selected = tweet.favorited!
    }
    
    func formatTimestamp(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "h:mm a - d MMM y"
        return formatter.stringFromDate(date)
    }
}
