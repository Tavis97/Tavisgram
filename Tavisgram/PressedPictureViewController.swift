//
//  PressedPictureViewController.swift
//  Tavisgram
//
//  Created by Tavis Thompson on 6/29/17.
//  Copyright © 2017 Tavis Thompson. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PressedPictureViewController: UIViewController {

    @IBOutlet weak var ProfileImageView: PFImageView!
    
    @IBOutlet weak var usernameTextLabel: UILabel!
    
    @IBOutlet weak var picturePostImageView: PFImageView!
    
    @IBOutlet weak var captionTextLabel: UILabel!
    
    @IBOutlet weak var smallusernameLabelView: UILabel!
   
    var posts: PFObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
            let photo = posts["media"] as! PFFile
            photo.getDataInBackground { (imageData: Data?, error: Error?) in
                self.picturePostImageView.image = UIImage(data: imageData!)
            }
        
        picturePostImageView.backgroundColor = UIColor.black
        
        
        
            self.captionTextLabel.text = posts["caption"] as? String
            let username = posts["author"] as! PFUser
        
            self.usernameTextLabel.text = username.username!
            self.smallusernameLabelView.text = username.username!
        
            if let userImagefile = username["portrait"] as? PFFile {
                print(userImagefile)
                self.ProfileImageView.file = userImagefile
                self.ProfileImageView.loadInBackground()
            } else {
                print("no profile file found")
            }
            
    }

        // Do any additional setup after loading the view.
    

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
