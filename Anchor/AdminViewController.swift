//
//  AdminViewController.swift
//  Anchor
//
//  Created by Christopher Dumas on 10/12/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//

class AdminViewController: UITableViewController {
    var username: String = ""
    var password: String = ""
    var realm: String = ""
    var admins: [String] = [""]
    
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
}