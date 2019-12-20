//
//  SkillsUtils.swift
//  CareerSkills
//
//  Created by khawlitta on 12/20/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import Foundation

class SkillsUtils{
    
    static let shared = SkillsUtils ()
    
    func parseSkillFromJson(jsonData: [String: AnyObject]) -> Skill?{
        
        //Required fileds
       // print ("parsing my Skill ")
        guard let id = jsonData["skill_uuid"] as? String,let name = jsonData["skill_name"] as? String, let type = jsonData["skill_type"] as? String, let description = jsonData["description"] as? String else{
            return nil
        }
        
        let skill = Skill(skillId: id, skillType: type, skillTitle: name, desc: description)
        
        return skill
    }

}
