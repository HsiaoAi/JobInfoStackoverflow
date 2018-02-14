//
//  JobData.swift
//  JobInfoStackoverflow
//
//  Created by Hsiao Ai LEE on 14/02/2018.
//  Copyright © 2018 Hsiao Ai LEE. All rights reserved.
//

import Foundation

class Job: NSObject {
    
    var id: String?
    var jobBrand: String?
    var jobName : String?
    var directorName : String?
    var FPSvalue : String?
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String
        self.jobBrand = dictionary["jobBrand"] as? String
        self.jobName = dictionary["jobName"] as? String
        // 5. ###
        self.directorName = dictionary["director"] as? String
        self.FPSvalue = dictionary["FPSvalue"] as? String
    }
    
}



