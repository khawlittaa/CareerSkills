//
//  SkillsViewController.swift
//  CareerSkills
//
//  Created by khawlitta on 12/19/19.
//  Copyright © 2019 khawla. All rights reserved.
//

import UIKit
import Alamofire

class SkillsViewController: UIViewController {

    @IBOutlet weak var skillsCollectionView: UICollectionView!
    @IBOutlet weak var jobNameLbl: UILabel!
    
    var jobId: String!
    var jobTitle: String!
    
    var allSkills: [Skill] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jobNameLbl.text = jobTitle
        
        // registering cell to use later
        let nib = UINib.init(nibName: "SkillDetailsCell", bundle: nil)
        self.skillsCollectionView.register(nib, forCellWithReuseIdentifier: "SkillDetailsCell")
            
            // filling table views
           getSkillsFromInternet(onComplition: { (skills: [Skill]?) in
                 guard let skills = skills else{
                    return }
                self.allSkills = skills
                self.skillsCollectionView.reloadData()
           })
    }
    
    func getSkillsFromInternet(onComplition: @escaping ([Skill]?)->()){
     
        request(APIController.baseUrl+"/jobs/"+jobId+"/related_skills" , method: .get).responseJSON { (dataResponse: DataResponse<Any>) in
        
              guard let statusCode = dataResponse.response?.statusCode else {
            onComplition(nil)
            return
        }
        
            let result = dataResponse.result.value as? NSDictionary
        
        switch statusCode {
        case 200:
            guard let allData = result?["skills"] as? [[String: AnyObject]] else {
                onComplition(nil)
                return
            }
            
            var allSkills: [Skill] = []
            
            for data in allData {
                if let skill = SkillsUtils.shared.parseSkillFromJson(jsonData: data){
                    allSkills.append(skill)
                }
            }
            
            onComplition(allSkills)
        default:
            onComplition(nil)
            return
        }
      }
    }
    
}

extension SkillsViewController: UICollectionViewDelegate{
    
}

extension SkillsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allSkills.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = skillsCollectionView.dequeueReusableCell(withReuseIdentifier: "SkillDetailsCell", for: indexPath) as! SkillDetailsCell
        cell.SkillDescText.text = allSkills[indexPath.row].SkillDescription
        cell.SkillTitleLbl.text = allSkills[indexPath.row].SkillName
               return cell
    }
    
    
}

