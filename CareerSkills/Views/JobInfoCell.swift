//
//  JobInfoCell.swift
//  CareerSkills
//
//  Created by khawlitta on 12/19/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import UIKit

class JobInfoCell: UITableViewCell {

    @IBOutlet weak var jobTitleLbl: UILabel!
    @IBOutlet weak var JobCategoryLbl: UILabel!
    @IBOutlet weak var SkillsBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func SkillsBtnPressed(_ sender: Any) {
        

    }
}
