//
//  HomeViewController.swift
//  Tavisgram
//
//  Created by Tavis Thompson on 6/27/17.
//  Copyright © 2017 Tavis Thompson. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var username: [PFObject]?
    //created this variable to assign to the post that is in the parse chat
    var posts : [PFObject] = []
    
 
    @IBOutlet weak var TLTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let logo = UIImage(named: "Tavis1.png")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        //this helps tableview know which data to load
        TLTableView.dataSource = self
        TLTableView.delegate = self
        
         Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
        
        
//        let query = PFQuery(className: "Post")
//        query.includeKey("author")
//        query.addDescendingOrder("media")
//        query.findObjectsInBackground { ( posts: [PFObject]?, error: Error?) in
//            self.posts = posts!
//            //reload the table so everything is rendered
//            print(self.posts)
//            self.TLTableView.reloadData()
////            if let user = post["author"] as? PFUser {
////                cell.usernameLabel.text = user.username
////            }
//        
//        }
//       
        
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.TLTableView.dequeueReusableCell(withIdentifier: "TLTableViewCell") as! TLTableViewCell
        // this gives us the number of rows
       let post =  posts[indexPath.row]
        cell.instagramPost = post 
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // determind whether how many cells we should have in a function 
        return posts.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onTimer() {
        // Add code to be run periodically
        
        let query = PFQuery(className: "Post")
        query.addDescendingOrder("createdAt")
        query.includeKey("author")
        query.findObjectsInBackground { (post: [PFObject]?, error: Error?) in
            
            self.posts = post!
            self.TLTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailSegue" {
            let vc = segue.destination as! PressedPictureViewController
            let cell = sender as! TLTableViewCell
            vc.posts = cell.instagramPost
        }
    }
    
    
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
   

