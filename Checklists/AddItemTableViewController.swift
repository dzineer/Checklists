//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Tomasz Oskroba on 11/5/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    
// MARK:- Actions
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }

}
