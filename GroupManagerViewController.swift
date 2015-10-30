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
    var username = ""
    var selection = 0
    var realmGroups: [String] = []
    var myRootRef = Firebase(url:"https://anchor-ios-app.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let realmRef = myRootRef.childByAppendingPath(realm)
        
        realmRef.observeEventType(.Value, withBlock: { snapshot in
            self.realmGroups = (snapshot.value.objectForKey("groups") as! [String])
            self.tableView.reloadData()
        }, withCancelBlock: { error in
            print(error.description)
        })
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if newPost {
            return realmGroups.count
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selection = indexPath.row
        performSegueWithIdentifier("backhome", sender: self)
    }
    
    var counter = 0
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if newPost {
            let postsRef = myRootRef.childByAppendingPath(realm).childByAppendingPath("posts")
            let post = postsRef.childByAutoId()
            post.setValue([
                "author": self.username,
                "text": self.text,
                "group": realmGroups[self.selection],
                "comments": [[
                    "author": "Admin",
                    "group": self.realm,
                    "text": "Please respect the poster, and keep your comments respectable and mature."
                ]]
            ])
        } else if segue.identifier == "backhome" && counter == 0 {
            let postRef = myRootRef.childByAppendingPath(realm).childByAppendingPath("posts")
            postRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
                let p = (snapshot.value as! NSDictionary).allValues[self.post!.id]
                let k = (snapshot.value as! NSDictionary).allKeys[self.post!.id] as! String
                var comments = p.objectForKey("comments") as! [NSDictionary]
                comments.append(["text": self.text, "author": self.username, "group": self.realm])
                postRef.childByAppendingPath(k).setValue(["comments": comments, "author": self.post!.author, "text": self.post!.text, "group": p.objectForKey("group") as! String])
                self.counter++;
            }, withCancelBlock: { error in
                    print(error.description)
            })
        }
        let vc = segue.destinationViewController as! HomepageViewController
        vc.username = self.username
        vc.realm = self.realm
    }
}