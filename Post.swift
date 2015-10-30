//
//  Post.swift
//  Anchor
//
//  Created by Christopher Dumas on 10/27/15.
//  Copyright © 2015 Christopher Dumas. All rights reserved.
//

class Post {
    var author = "Unknown"
    var text   = "Lorem Ipsum Ildor, austin set amet, amor ilsor olet"
    var comments: [Post] = []
    var id = 0
    
    init(author: String, text: String, comments: [Post], id: Int) {
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
    
    class func fromDictionary (i: Int = 0, dic: NSDictionary) -> Post {
        var c: [Post] = [];
        if let _c = dic["comments"] {
            c = (_c as! [NSDictionary]).enumerate().map(fromDictionary)
            print(c)
        }
        return Post(author: dic["author"] as! String,
            text: dic["text"] as! String,
            comments: c,
            id: i)
    }
    
    class func toDictionary (i: Int, post: Post) -> NSDictionary {
        return [
            "text": post.text,
            "author": post.author,
            "id": i,
            "comments": post.comments.enumerate().map(toDictionary)
        ]
    }
}