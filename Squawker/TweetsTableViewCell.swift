//
//  TweetsTableViewCell.swift
//  Squawker
//
//  Created by Kenneth Pu on 10/4/15.
//  Copyright © 2015 Kenneth Pu. All rights reserved.
//

import UIKit

class TweetsTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
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
            timestampLabel.text = self.formatTimeElapsed(tweet.createdAt!)
            tweetTextLabel.text = tweet.text
            retweetButton.selected = tweet.retweeted!
            favoriteButton.selected = tweet.favorited!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 3
        profileImageView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func formatTimeElapsed(sinceDate: NSDate) -> String {
        let formatter = NSDateComponentsFormatter()
        formatter.unitsStyle = NSDateComponentsFormatterUnitsStyle.Abbreviated
        formatter.collapsesLargestUnit = true
        formatter.maximumUnitCount = 1
        let interval = NSDate().timeIntervalSinceDate(sinceDate)
        return formatter.stringFromTimeInterval(interval)!
    }
}
