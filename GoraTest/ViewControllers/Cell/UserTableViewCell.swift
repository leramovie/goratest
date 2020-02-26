//
//  UserTableViewCell.swift
//  GoraTest
//
//  Created by Valery Shel on 25.02.2020.
//  Copyright © 2020 Parakluence. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    

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
