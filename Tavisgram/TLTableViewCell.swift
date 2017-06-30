//
//  TLTableViewCell.swift
//  Tavisgram
//
//  Created by Tavis Thompson on 6/28/17.
//  Copyright © 2017 Tavis Thompson. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class TLTableViewCell: UITableViewCell {
    
    @IBOutlet weak var TLImageView: PFImageView!
    
    @IBOutlet weak var TLCaptionLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var smallusernameLabel: UILabel!
    
    @IBOutlet weak var profileImageView: PFImageView!
    var instagramPost: PFObject! {
        didSet {
            self.TLImageView.file = instagramPost["media"] as? PFFile
            self.TLImageView.loadInBackground()
            let username = instagramPost["author"] as! PFUser
            self.usernameLabel.text = username["username"] as? String
            self.smallusernameLabel.text = username.username
            self.TLCaptionLabel.text  = instagramPost["caption"] as? String
            if let userImagefile = username["portrait"] as? PFFile {
                print(userImagefile)
                self.profileImageView.file = userImagefile
                self.profileImageView.loadInBackground()
            } else {
                print("no profile file found")
            }
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
