//
//  ViewController.swift
//  Anchor
//  anchor-1095
//  331218086852-ef2a5j8n3ulb8dj9f51ebvcq5nl9u79p.apps.googleusercontent.com
//  Created by Christopher Dumas on 10/10/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//
import Firebase
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var anchor: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var realm: UITextField!
    
    @IBOutlet weak var signin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate = self
        password.delegate = self
        realm.delegate = self
        signin.enabled = false
    }
    
    @IBAction func signInManually(sender: UIButton) {
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        signin.enabled = (username.text != "" && password.text != "" && realm.text != "")
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (username.text != "" && password.text != "" && realm.text != "") {
            performSegueWithIdentifier("home", sender: self)
        }
        return true
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