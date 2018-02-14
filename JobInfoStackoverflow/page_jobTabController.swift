//
//  page_jobTabController.swift
//  JobInfoStackoverflow
//
//  Created by Hsiao Ai LEE on 14/02/2018.
//  Copyright © 2018 Hsiao Ai LEE. All rights reserved.
//

import UIKit
class page_jobTabController: UITabBarController {
    
    // 2. ###
    var job: Job?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NAVIGATION ITEM
        let jobInfo = page_jobInformation()
        let shots = page_shotList()
        let attachments = page_attachments()
        let notes = page_notesList()
        
        jobInfo.tabBarItem.title = "Information"
        jobInfo.tabBarItem.image = UIImage(named: "jobInfo")
        
        shots.tabBarItem.title = "Shots"
        shots.tabBarItem.image = UIImage(named: "shots")
        
        attachments.tabBarItem.title = "Attachments"
        attachments.tabBarItem.image = UIImage(named: "attachments")
        
        notes.tabBarItem.title = "Notes"
        notes.tabBarItem.image = UIImage(named: "notes")
        
        viewControllers = [jobInfo, shots, attachments, notes]
    }
    
    
    @IBAction func HandleEdit(sender : UIButton) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        
    }
    
}
