//
//  BodyCell.swift
//  MobileOrg
//
//  Created by Jamie Conlon on 11/01/2017.
//  Copyright © 2017 Sean Escriva. All rights reserved.
//

import UIKit

class BodyCell: UITableViewCell {

    @IBOutlet weak var bodyTextView: UITextView?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  // why can't I connect it?
  @IBAction func editBody(sender: UITextView) {
    // do something
  }


}
