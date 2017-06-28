//
//  HomeViewController.swift
//  Tavisgram
//
//  Created by Tavis Thompson on 6/27/17.
//  Copyright © 2017 Tavis Thompson. All rights reserved.
//

import UIKit
import Parse


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var username: [PFObject]?
    //created this variable to assign to the post that is in the parse chat
    var posts : [PFObject]
    
 
    @IBOutlet weak var TLTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFQuery(className: "Post")
        query.includeKey("author")
        query.findObjectsInBackground { ( posts: [PFObject]?, error: Error?) in
            self.posts = posts
            //reload the table so everything is rendered
            self.TLTableView.reloadData()
//            if let user = post["author"] as? PFUser {
//                cell.usernameLabel.text = user.username
//            }
        }
        
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.TLTableView.dequeueReusableCell(withIdentifier: "TLTableViewCell") as! TLTableViewCell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // determind whether how many cells we should have in a function 
        return posts.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   
}
