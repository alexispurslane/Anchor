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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.systemFontOfSize(19, weight: UIFontWeightThin)]
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        if realm == "GBF" {
            teacherPosts = [[Post(author: "Ed Chou"), Post(author: "Austin Thompsan"), Post(author: "David Tong")], [Post(author: "Cliff McManis", text: "Hope House Concert - Oct 23")]]
            sections = ["Youth Group", "Events"]
            admins = ["Austin Thompsan", "Ed Chou", "David Tong"]
        } else {
            teacherPosts = [[Post(author: "Jonny Appleseed")]]
            sections = ["Puorg Htuoy"]
            admins = ["Jonny Appleseed"]
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
        let nav = segue.destinationViewController as! UINavigationController
        let vc = nav.topViewController as! AdminViewController
        vc.username = self.username
        vc.password = self.password
        vc.realm = self.realm
        vc.admins = self.admins
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