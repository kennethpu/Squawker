//
//  TweetsViewController.swift
//  Squawker
//
//  Created by Kenneth Pu on 10/4/15.
//  Copyright © 2015 Kenneth Pu. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    var tweets: [Tweet]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
        
        fetchData()
    }
    
    func fetchData() {
        TwitterClient.sharedInstance.homeTimelineWithCompletion(nil, completion: { (tweets: [Tweet]?, error: NSError?) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
        })
    }
    
    func refresh(sender: AnyObject) {
        fetchData()
        self.refreshControl.endRefreshing()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! TweetDetailsViewController
        let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
        
        destinationVC.tweet = tweets[indexPath.row]
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }
}

extension TweetsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tweets != nil) ? tweets!.count : 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetsTableViewCell", forIndexPath: indexPath) as! TweetsTableViewCell
        
        cell.tweet = tweets[indexPath.row]
        
        return cell
    }
}