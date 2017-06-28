//
//  HomeViewController.swift
//  Tavisgram
//
//  Created by Tavis Thompson on 6/27/17.
//  Copyright © 2017 Tavis Thompson. All rights reserved.
//

import UIKit
import Parse


class HomeViewController: UIViewController {

    var username1: [PFObject]?
 
    @IBOutlet weak var TLTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let query = PFQuery(className: "Post")
        query.findObjectsInBackground { ( post: [PFObject]?, error: Error?) in
            let cell = self.TLTableView.dequeueReusableCell(withIdentifier: "TLTableViewCell") as! TLTableViewCell
            if let user = username["user"] as? PFUser {
                cell.usernameLabel.text = user.username
            }
        }
        
        // Do any additional setup after loading the view.
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
