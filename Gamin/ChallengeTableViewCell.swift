//
//  ChallengeTableViewCell.swift
//  Gamin
//
//  Created by yiling on 7/16/16.
//  Copyright © 2016 yiling. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
    //MARK : Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var challengeImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
