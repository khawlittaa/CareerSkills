//
//  Skill.swift
//  CareerSkills
//
//  Created by khawlitta on 12/19/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import Foundation

class Skill {
    
    var  SkillID: String = ""
    var  SkillName: String = ""
    var  SkillType: String = ""
    var  SkillDescription: String = ""
    
    init(skillId: String, skillType: String, skillTitle:String, desc: String) {
        self.SkillID = skillId
        self.SkillName = skillType
        self.SkillType = skillType
        self.SkillDescription = desc
    }
}
