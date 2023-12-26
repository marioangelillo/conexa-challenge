//
//  UserTableViewCell.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 23/12/2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
