//
//  ViewController.swift
//  CareerSkills
//
//  Created by khawlitta on 12/19/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import UIKit
import Alamofire

class JobsViewController: UIViewController {

    @IBOutlet weak var jobsTableView: UITableView!
    
    var allJobs: [Career] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // registering cell to use later
        let nib = UINib.init(nibName: "JobInfoCell", bundle: nil)
            self.jobsTableView.register(nib, forCellReuseIdentifier: "JobInfoCell")
        
        // filling table views
        getJobsFromInternet(onComplition: { (jobs: [Career]?) in
             guard let jobs = jobs else{
                return }
            self.allJobs = jobs
            self.jobsTableView.reloadData()
       })
                
        
    }

    
    

    func getJobsFromInternet(onComplition: @escaping ([Career]?)->()){
        
    request(APIController.baseUrl+"/jobs", method: .get).responseJSON { (dataResponse: DataResponse<Any>) in
        
        guard let statusCode = dataResponse.response?.statusCode else {
            onComplition(nil)
            return
        }
        
        let result = dataResponse.result.value
        
        switch statusCode {
        case 200:
            guard let allData = result as? [[String: AnyObject]] else {
                onComplition(nil)
                return
            }
            
            var allJobs: [Career] = []
            
            for data in allData {
                if let career = JobsUtils.shared.parseCareerFromJson(jsonData: data) {
                    allJobs.append(career)
                }
            }
            
            onComplition(allJobs)
        default:
            onComplition(nil)
            return
        }
      }
    }
        
}

//MARK:- UITableViewDelegate
extension JobsViewController: UITableViewDelegate{
    
    
}

//MARK:- UITableViewDataSource
extension JobsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  allJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = jobsTableView.dequeueReusableCell(withIdentifier: "JobInfoCell", for: indexPath) as! JobInfoCell
        cell.JobCategoryLbl.text = "Career Category"
        cell.jobTitleLbl.text = allJobs[indexPath.row].JobTitle
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let skills = storyboard?.instantiateViewController(withIdentifier: "SkillsVC") as! SkillsViewController
        skills.jobId = allJobs[indexPath.row].JobID
        skills.jobTitle = allJobs[indexPath.row].JobTitle
        self.navigationController?.pushViewController(skills, animated: true)
    }
    
    
}

