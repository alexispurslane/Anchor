//
//  AddJoinViewController.swift
//  Anchor
//
//  Created by Christopher Dumas on 10/23/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//
import Firebase
class AddJoinViewController: UIViewController {
    var type: AM = AM.None
    var myRootRef = Firebase(url:"https://anchor-ios-app.firebaseio.com")
    @IBOutlet weak var text: UITextField!
    
    func show (type: AM) -> String {
        if type == AM.NewGroup { return "New Group" }
        else if type == AM.NewRealm { return "New Realm" }
        else if type == AM.ApplyForAdminship { return "Apply for Admin Access" }
        else if type == AM.ApplyForMembership { return "Apply for Membership" }
        else { return "\(type)" }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "\(show(type))";
        
        if type == AM.NewGroup {
            self.text.placeholder = "Group name"
            // Create new Group
        } else if type == AM.NewRealm {
            self.text.placeholder = "Realm name"
            // Create new Realm
        } else if type == AM.ApplyForAdminship {
            self.text.placeholder = "Realm name"
            // Send application for adminship
        } else if type == AM.ApplyForMembership {
            self.text.placeholder = "Realm name"
            // Send application for membership
        }
    }
}