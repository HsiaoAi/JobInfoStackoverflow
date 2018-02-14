//
//  page_jobList.swift
//  JobInfoStackoverflow
//
//  Created by Hsiao Ai LEE on 14/02/2018.
//  Copyright © 2018 Hsiao Ai LEE. All rights reserved.
//

import UIKit

class page_jobList: UITableViewController {
    
    let cellId = "cellId"
    var jobs = [Job]()

    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        // NAVIGATION ITEM
        navigationItem.title = "Jobs"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(JobCell.self, forCellReuseIdentifier: cellId)
        // FIREBASE FETCH JOBS
        fetchJobs()
    }

    func fetchJobs() {
        
        let jobDictionary1: [String: Any] = ["id": "-L59sEGslWF7HFza26ay",
                              "FPS" : "25",
                              "director" : "Mike & Jim",
                              "jobBrand" : "Honda",
                              "jobName" : "Dreammakers"]
        let jobDictionary2: [String: Any] = ["id": "-L59sWGEccWMFEeFWyNU",
                              "FPS" : "25",
                              "director" : "Anthony Test",
                              "jobBrand" : "WWF",
                              "jobName" : "Eye"]
        
        let job1 = Job(dictionary: jobDictionary1)
        let job2 = Job(dictionary: jobDictionary2)
        self.jobs.append(job1)
        self.jobs.append(job2)
        
        self.tableView.reloadData()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let job = jobs[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = job.jobBrand
        cell.detailTextLabel?.text = job.jobName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let jobInfo = page_jobTabController()
        // 1. ###
        jobInfo.job = jobs[indexPath.row]
        show(jobInfo, sender: self)
    }

}

class JobCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super .init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
