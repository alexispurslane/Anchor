//
//  PostViewController.swift
//  Anchor
//
//  Created by Christopher Dumas on 10/12/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//
import Firebase
class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var post: Post = Post(author: "Nobody")
    var realm = ""
    var username = ""
    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var body: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.systemFontOfSize(19, weight: UIFontWeightThin)]
        body.text = "\"" + post.text + "\""
        author.text = post.author
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.comments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCard
        let comment = post.comments[indexPath.row]
        cell.titleLabel!.text = comment.author
        cell.contentLabel!.text = comment.text
        cell.contentLabel!.font = UIFont.systemFontOfSize(16, weight: UIFontWeightThin)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Addcommentpage" {
            let vc = segue.destinationViewController as! SpeakViewController
            vc.post = self.post
            vc.realm = self.realm
            vc.username = self.username
        }
    }
}