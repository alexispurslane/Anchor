//
//  AdminMemberRequestsViewController.swift
//  Anchor
//
//  Created by Christopher Dumas on 10/20/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//
import Firebase
enum AM {
    case Admin
    case Member
    case None
    case NewGroup
    case NewRealm
    case ApplyForMembership
    case ApplyForAdminship
}

class AdminMemberRequestsViewController: UITableViewController {
    var type: AM = AM.None
    var requests: [String] = [""]
    var myRootRef = Firebase(url:"https://anchor-ios-app.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationItem.title = "\(type)";
        
        if type == AM.Admin {
            // Get admin requests
        } else if type == AM.Member {
            // Get member requests
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return requests.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel!.text = requests[indexPath.row]
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if type == AM.Admin {
            // add admin person
        } else if type == AM.Member {
            // add member
        }
    }
}