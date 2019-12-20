//
//  JobsUtils.swift
//  CareerSkills
//
//  Created by khawlitta on 12/20/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import Foundation

class JobsUtils{
    
    static let shared = JobsUtils ()
    
    func parseCareerFromJson(jsonData: [String: AnyObject]) -> Career?{
        
        //Required fileds
       // print ("parsing my carrers ")
        guard let id = jsonData["uuid"] as? String,let name = jsonData["title"] as? String,
        let domainId = jsonData["parent_uuid"] as? String else{
            return nil
        }
        
        let career = Career(jobId: id, jobDomainId: domainId, jobTitle: name)
        
        return career
    }

}
