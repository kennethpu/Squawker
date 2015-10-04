//
//  LoginViewController.swift
//  
//
//  Created by Kenneth Pu on 10/1/15.
//
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitterdemo://oauth"), scope: nil, success:
            { (requestCredential) -> Void in
                print("Got the request token!")
            })
            { (error) -> Void in
                print("Failed to get the request token")
            }
    }
}
