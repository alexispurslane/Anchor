//
//  GroupManagerViewController.swift
//  Anchor
//
//  Created by Christopher Dumas on 10/14/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//

import Firebase
class GroupManagerViewController: UITableViewController {
    var newPost = false
    var newComment = false
    var text = ""
    var realm = ""
    var post: Post? = nil
    var realmGroups = [""]
    var myRootRef = Firebase(url:"https://anchor-ios-app.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if realm == "GBF" {
            realmGroups = ["Youth Group", "Events"]
        } else {
            realmGroups = ["Puorg Htuoy"]
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if newPost {
            return 2
        } else {
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if newPost {
            let cell = UITableViewCell()
            cell.textLabel!.text = realmGroups[indexPath.row]
        
            return cell
        } else {
            let cell = UITableViewCell()
            cell.textLabel!.text = "Post Comment"
            return cell
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if newPost {
            // add post
        } else {
            // add comment
        }
    }
}