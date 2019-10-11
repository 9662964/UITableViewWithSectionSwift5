//
//  ViewController.swift
//  UITableViewWithSections
//
//  Created by Aman Aggarwal on 10/10/19.
//  Copyright © 2019 Aman Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblCoders: UITableView!
    var expertise = [Dictionary<String, Any>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .clear
        
        tblCoders.tableFooterView = UIView(frame: .zero)
        tblCoders.register(UINib(nibName: "CoderInfoCell", bundle: nil), forCellReuseIdentifier: "CoderInfoCell")
        tblCoders.estimatedRowHeight = 60.0
        createDatSource()
        tblCoders.dataSource = self
        tblCoders.delegate = self
    }
    
    func createDatSource() {
        expertise.append(["title": "iOS", "value": ["Tom", "John", "Moody"]])
        expertise.append(["title": "Android", "value": ["Reema", "Raze", "Jack","Joody"]])
        expertise.append(["title": "ROR", "value": ["Majed", "Ali", "Ryan"]])
        expertise.append(["title": "Python", "value": ["Jake", "Riyadh", "Mark"]])
        expertise.append(["title": "PHP", "value": ["Jerry", "Alex", "Cyril","Rohn","ROB","John","Rahul"]])

    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return expertise.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let codersNames = expertise[section]["value"] as? [String] else {
            return 0
        }
        return codersNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoderInfoCell") as! CoderInfoCell
        guard let codersNames = expertise[indexPath.section]["value"] as? [String] else {
            return cell
        }
        cell.setCoderName(codersNames[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tblCoders.frame.size.width, height: 50.0))
        view.backgroundColor = .systemGreen
        let titleLabel = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: view.frame.size.width, height: 50.0))
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        if let title = expertise[section]["title"] as? String {
            titleLabel.text = title
        }
        view.addSubview(titleLabel)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

