//
//  SpeakViewController.swift
//  Anchor
//
//  Created by Christopher Dumas on 10/13/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//
import Firebase
class SpeakViewController: UIViewController {
    var realm = ""
    var password = ""
    var username = ""
    var post: Post? = nil
    var newPost = false
    var newComment = false
    @IBOutlet weak var textContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _ = post {
            newComment = true
            self.navigationItem.title = "Comment on " + self.post!.author + "'s Post"
        } else {
            newPost = true
            self.navigationItem.title = "New Post to " + self.realm
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Selectgrouppage" {
            let vc = segue.destinationViewController as! GroupManagerViewController
            vc.newPost = self.newPost
            vc.newComment = self.newComment
            vc.text = self.textContent.text
            vc.post = self.post
            vc.username = self.username
            vc.realm = self.realm
        }
    }
}