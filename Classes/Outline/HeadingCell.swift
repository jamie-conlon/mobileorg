//
//  HeadingCell.swift
//  MobileOrg
//
//  Created by Jamie Conlon on 11/01/2017.
//  Copyright © 2017 Sean Escriva. All rights reserved.
//

import UIKit

class HeadingCell: UITableViewCell {

  @IBOutlet weak var headingTextField: UITextField?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  @IBAction func editHeading(sender: UITextField) {
    // do something
  }

  
}
