//
//  HomepageViewController.swift
//  Anchor
//
//  Created by Christopher Dumas on 10/11/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//

import UIKit

class Post {
    var author = "Unknown"
    var text   = "Lorem Ipsum Ildor, austin set amet, amor ilsor olet"
    var comments: [Post] = []
    
    init(author: String, text: String, comments: [Post]) {
        self.author = author
        self.text = text
        self.comments = comments
    }
    
    init(author: String, text: String) {
        self.author = author
        self.text = text
    }
    
    init(author: String) {
        self.author = author
    }
    
    init(text: String) {
        self.text = text
    }
}

class HomepageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var username: String = "Anonymous"
    var password: String = "P@$$W0RD"
    var realm: String     = "None"
    var teacherPosts: [[Post]] = []
    var sections: [String] = []
    var admins: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var newAnchor: UIBarButtonItem!
    
    @IBOutlet weak var postButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.systemFontOfSize(19, weight: UIFontWeightThin)]
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        if realm == "GBF" {
            teacherPosts = [[Post(author: "Ed Chou", text: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", comments: [Post(author: "Somebody"), Post(author: "Somebody Else")]),
                             Post(author: "Austin Thompsan", text: "something else"),
                             Post(author: "David Tong", text: "some other thing")],
                            [Post(author: "Cliff McManis", text: "Hope House Concert - Oct 23")]]
            sections = ["Youth Group", "Events"]
            admins = ["Austin Thompsan", "Ed Chou", "David Tong", "Cliff McManis"]
        } else {
            teacherPosts = [[Post(author: "Jonny Appleseed")]]
            sections = ["Puorg Htuoy"]
            admins = ["Jonny Appleseed"]
        }
        
        if let _ = admins.indexOf(username) {
            postButton.enabled = true
            postButton.tintColor = UIColor.redColor()
        } else {
            postButton.enabled = false
            postButton.tintColor = UIColor.clearColor()
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        print(segue.identifier)
        if segue.identifier == "Adminpage" {
            let vc = segue.destinationViewController as! AdminViewController
            vc.username = self.username
            vc.password = self.password
            vc.realm = self.realm
            vc.admins = self.admins
        } else if segue.identifier == "Postpage" {
            let vc = segue.destinationViewController as! PostViewController
            
            let myIndexPath = self.tableView.indexPathForSelectedRow
            vc.post = self.teacherPosts[myIndexPath!.section][myIndexPath!.row]
        } else if segue.identifier == "Addpostpage" {
            let vc = segue.destinationViewController as! SpeakViewControler
            vc.realm = self.realm
            vc.username = self.username
            vc.password = self.password
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return self.teacherPosts.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teacherPosts[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let post = teacherPosts[indexPath.section][indexPath.row]
        cell.textLabel!.text = post.text
        cell.textLabel!.font = UIFont.systemFontOfSize(16, weight: UIFontWeightThin)
        cell.detailTextLabel!.text = "By " + post.author
        cell.detailTextLabel!.font = UIFont.systemFontOfSize(11, weight: UIFontWeightThin)
        return cell
    }
}