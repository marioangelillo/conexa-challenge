//
//  UserTableViewCell.swift
//  conexaChallenge
//
//  Created by Mario Angelillo on 23/12/2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(user: UserEntity) {
        self.name.text = user.getFullName()
        self.address.text = user.getCompleteAddress()
    }
    
}
