//
//  page_jobInformation.swift
//  JobInfoStackoverflow
//
//  Created by Hsiao Ai LEE on 14/02/2018.
//  Copyright © 2018 Hsiao Ai LEE. All rights reserved.
//
import UIKit

class page_jobInformation: UIViewController{
    
    // CONTENT CREATION
    
    // GENERAL
    let generalTitle: UILabel = {
        let generalTitle = UILabel()
        generalTitle.font = UIFont(name: "HelveticaNeue", size: 12.0)
        generalTitle.text = "GENERAL"
        generalTitle.translatesAutoresizingMaskIntoConstraints = false
        return generalTitle
    }()
    let jobBrand: UITextField = {
        let jobBrand = UITextField()
        //jobBrand.text = "jobBrand"
        jobBrand.isUserInteractionEnabled = false
        jobBrand.keyboardType = UIKeyboardType.default
        jobBrand.translatesAutoresizingMaskIntoConstraints = false
        return jobBrand
    }()
    let jobName: UITextField = {
        let jobName = UITextField()
        jobName.keyboardType = UIKeyboardType.default
        jobName.text = "jobName"
        jobName.isUserInteractionEnabled = false
        jobName.translatesAutoresizingMaskIntoConstraints = false
        return jobName
    }()
    let directorName: UITextField = {
        let directorName = UITextField()
        directorName.text = "directorName"
        directorName.keyboardType = UIKeyboardType.default
        directorName.isUserInteractionEnabled = false
        directorName.translatesAutoresizingMaskIntoConstraints = false
        return directorName
    }()
    let AgencyName: UITextField = {
        let AgencyName = UITextField()
        AgencyName.text = "Agency"
        AgencyName.keyboardType = UIKeyboardType.default
        AgencyName.isUserInteractionEnabled = false
        AgencyName.translatesAutoresizingMaskIntoConstraints = false
        return AgencyName
    }()
    let prodCoName: UITextField = {
        let prodCoName = UITextField()
        prodCoName.text = "Production Company"
        prodCoName.keyboardType = UIKeyboardType.default
        prodCoName.isUserInteractionEnabled = false
        prodCoName.translatesAutoresizingMaskIntoConstraints = false
        return prodCoName}()
    
    // TECHNICAL
    let technicalTitle: UILabel = {
        let technicalTitle = UILabel()
        technicalTitle.font = UIFont(name: "HelveticaNeue", size: 12.0)
        technicalTitle.text = "TECHNICAL"
        technicalTitle.translatesAutoresizingMaskIntoConstraints = false
        return technicalTitle
    }()
    lazy var jobSpecsButton: UIButton = {
        let jobSpecsButton = UIButton(type: .system)
        jobSpecsButton.setTitle("Job Specifications", for: .normal)
        jobSpecsButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14.0)
        jobSpecsButton.layer.masksToBounds = true
        jobSpecsButton.contentHorizontalAlignment = .left
        jobSpecsButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        jobSpecsButton.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        jobSpecsButton.setTitleColor(.black, for: .normal)
        jobSpecsButton.translatesAutoresizingMaskIntoConstraints = false
        
        //jobSpecsButton.addTarget(self, action: #selector(HandleJobSpecs), for: .touchUpInside)
        
        return jobSpecsButton
    }()
    lazy var cameraButton: UIButton = {
        let cameraButton = UIButton(type: .system)
        cameraButton.setTitle("Camera & Lenses", for: .normal)
        cameraButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14.0)
        cameraButton.layer.masksToBounds = true
        cameraButton.contentHorizontalAlignment = .left
        cameraButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        cameraButton.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        cameraButton.setTitleColor(.black, for: .normal)
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        
        //cameraButton.addTarget(self, action: #selector(HandleCameraLenses), for: .touchUpInside)
        
        return cameraButton
    }()
    lazy var SKCButton: UIButton = {
        let SKCButton = UIButton(type: .system)
        SKCButton.setTitle("Shoot Kit Checklist", for: .normal)
        SKCButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 14.0)
        SKCButton.layer.masksToBounds = true
        SKCButton.contentHorizontalAlignment = .left
        SKCButton.setTitleColor(UIColor.gray, for: UIControlState.normal)
        SKCButton.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
        SKCButton.setTitleColor(.black, for: .normal)
        SKCButton.translatesAutoresizingMaskIntoConstraints = false
        
        //SKCButton.addTarget(self, action: #selector(HandleSKC), for: .touchUpInside)
        
        return SKCButton
    }()
    
    lazy var stack:UIStackView = {
        let s = UIStackView(frame: self.view.bounds)
        s.axis = .vertical
        s.distribution = .equalSpacing
        s.alignment = .fill
        s.spacing = 10
        //s.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        s.addArrangedSubview(self.generalTitle)
        s.addArrangedSubview(self.jobBrand)
        s.addArrangedSubview(self.jobName)
        s.addArrangedSubview(self.directorName)
        s.addArrangedSubview(self.AgencyName)
        s.addArrangedSubview(self.prodCoName)
        s.addArrangedSubview(self.technicalTitle)
        s.addArrangedSubview(self.jobSpecsButton)
        s.addArrangedSubview(self.cameraButton)
        s.addArrangedSubview(self.SKCButton)
        
        return s
    }()
    
    // SUPER VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Job Information"
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(HandleEditJob))
        view.addSubview(stack)
        jobInfoValues()
        setupLayout()
    }
    
    // OBSERVE JOB
    var job: Job? {
        // 3.###
        let tabBarController = self.tabBarController as! page_jobTabController
        return tabBarController.job
    }
    
    // FILL IN TEXT FIELDS FROM FIREBASE
    func jobInfoValues(){
        // 4. ###
        jobBrand.text = job?.jobBrand ?? "Unknown Job Brand"
        jobName.text = job?.jobName ?? "Unknown Job Name"
        directorName.text = job?.directorName ?? "Unknown Director Name"
    }
    
    // BUTTONS & ACTIONS
    
//    @IBAction func HandleJobSpecs(sender : UIButton) {
//        let jobSpecs = page_jobSpecs()
//        show(jobSpecs, sender: self)
//    }
//    @IBAction func HandleCameraLenses(sender : UIButton) {
//        let cameras = page_camera_lenses()
//        show(cameras, sender: self)
//    }
//    @IBAction func HandleSKC(sender : UIButton) {
//        let shootKit = page_SKC()
//        show(shootKit, sender: self)
//    }
    @IBAction func HandleEditJob(sender : UIButton) {
        // CHANGE NAVIGATION BAR ITEM
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(HandleJobEditDone))
        // ALLOW TEXT FIELDS TO BE EDITABLE
        jobBrand.isUserInteractionEnabled = true
        jobName.isUserInteractionEnabled = true
        directorName.isUserInteractionEnabled = true
        AgencyName.isUserInteractionEnabled = true
        prodCoName.isUserInteractionEnabled = true
        // ADDING CLEAR BUTTON
        jobBrand.clearButtonMode = .always
        jobName.clearButtonMode = .always
        directorName.clearButtonMode = .always
        AgencyName.clearButtonMode = .always
        prodCoName.clearButtonMode = .always
        
    }
    @IBAction func HandleJobEditDone(sender : UIButton) {
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(HandleEditJob))
        jobBrand.isUserInteractionEnabled = false
        jobName.isUserInteractionEnabled = false
        directorName.isUserInteractionEnabled = false
        AgencyName.isUserInteractionEnabled = false
        prodCoName.isUserInteractionEnabled = false
        // ADDING CLEAR BUTTON
        jobBrand.clearButtonMode = .never
        jobName.clearButtonMode = .never
        directorName.clearButtonMode = .never
        AgencyName.clearButtonMode = .never
        prodCoName.clearButtonMode = .never
    }
    // CONSTRAINTS
    private func setupLayout(){
        
        // Auto layout constraints for jobInfo
        generalTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        generalTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        // Auto layout constraints for jobInfo
        jobBrand.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        // Auto layout constraints for cameras
        jobName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        // Auto layout constraints for attachments
        directorName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        // Auto layout constraints for attachments
        AgencyName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        // Auto layout constraints for attachments
        prodCoName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        // Auto layout constraints for attachments
        technicalTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        // Auto layout constraints for attachments
        jobSpecsButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        // Auto layout constraints for attachments
        cameraButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        // Auto layout constraints for SKC
        SKCButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        SKCButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        
        
    }
}
