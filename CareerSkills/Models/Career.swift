//
//  Career.swift
//  CareerSkills
//
//  Created by khawlitta on 12/19/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import Foundation

class Career {
    
    var  JobID: String = ""
    var  JobDomainID: String = ""
    var  JobTitle: String = ""
    
    init(jobId: String, jobDomainId: String, jobTitle:String) {
        self.JobID = jobId
        self.JobDomainID = jobDomainId
        self.JobTitle = jobTitle
    }
}
