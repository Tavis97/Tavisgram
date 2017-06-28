//
//  TLTableViewCell.swift
//  Tavisgram
//
//  Created by Tavis Thompson on 6/28/17.
//  Copyright © 2017 Tavis Thompson. All rights reserved.
//

import UIKit

class TLTableViewCell: UITableViewCell {

    @IBOutlet weak var TLImageView: UIImageView!
    
    @IBOutlet weak var TLCaptionLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
