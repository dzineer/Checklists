//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Tomasz Oskroba on 11/3/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false

    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }

    func toggleChecked() {
        checked = !checked
    }
}
