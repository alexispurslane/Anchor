//
//  AdminViewController.swift
//  Anchor
//
//  Created by Christopher Dumas on 10/12/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//
import Firebase
class AdminViewController: UITableViewController {
    var username: String = ""
    var password: String = ""
    var realm: String = ""
    var admins: [String] = []
    
    @IBOutlet weak var adminCandidates: UITableViewCell!
    @IBOutlet weak var memberCandidates: UITableViewCell!
    
    @IBOutlet weak var realmAdmins: UITableViewCell!
    @IBOutlet weak var realmGroups: UITableViewCell!
    @IBOutlet weak var realmName: UITableViewCell!
    @IBOutlet weak var realmMembers: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.systemFontOfSize(19, weight: UIFontWeightThin)]
        
        if let _ = admins.indexOf(username) {
        } else {
            adminCandidates.userInteractionEnabled = false
            adminCandidates.textLabel?.enabled = false
            
            memberCandidates.userInteractionEnabled = false
            memberCandidates.textLabel?.enabled = false
            
            realmAdmins.userInteractionEnabled = false
            realmAdmins.textLabel?.enabled = false
            
            realmGroups.userInteractionEnabled = false
            realmGroups.textLabel?.enabled = false
            
            realmName.userInteractionEnabled = false
            realmName.textLabel?.enabled = false
            
            realmMembers.userInteractionEnabled = false
            realmMembers.textLabel?.enabled = false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Adminpage") {
            let nav = segue.destinationViewController as! UINavigationController
            let vc = nav.topViewController as! HomepageViewController
            vc.username = self.username
            vc.password = self.password
            vc.realm = self.realm
        } else if (segue.identifier == "adminCR") {
            let vc = segue.destinationViewController as! AdminMemberRequestsViewController
            vc.type = AM.Admin
        } else if (segue.identifier == "memberCR") {
            let vc = segue.destinationViewController as! AdminMemberRequestsViewController
            vc.type = AM.Member
        } else if (segue.identifier == "newGroup") {
            let vc = segue.destinationViewController as! AddJoinViewController
            vc.type = AM.NewGroup
        } else if (segue.identifier == "newRealm") {
            let vc = segue.destinationViewController as! AddJoinViewController
            vc.type = AM.NewRealm
        } else if (segue.identifier == "applyMembership") {
            let vc = segue.destinationViewController as! AddJoinViewController
            vc.type = AM.ApplyForMembership
        } else if (segue.identifier == "applyAdminship") {
            let vc = segue.destinationViewController as! AddJoinViewController
            vc.type = AM.ApplyForAdminship
        }
    }
}