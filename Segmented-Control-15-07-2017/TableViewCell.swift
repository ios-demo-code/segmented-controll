//
//  TableViewCell.swift
//  Segmented-Control-15-07-2017
//
//  Created by Soeng Saravit on 7/15/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var accessoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title:String, accessory:String) {
        self.titleLabel.text = title
        self.accessoryLabel.text = accessory
    }
    
}
