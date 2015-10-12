//
//  ViewController.swift
//  Anchor
//  anchor-1095
//  331218086852-ef2a5j8n3ulb8dj9f51ebvcq5nl9u79p.apps.googleusercontent.com
//  Created by Christopher Dumas on 10/10/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var anchor: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var realm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInManually(sender: UIButton) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let nav = segue.destinationViewController as! UINavigationController
        let vc = nav.topViewController as! HomepageViewController
        vc.username = self.username.text!
        vc.password = self.password.text!
        vc.realm = self.realm.text!
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}