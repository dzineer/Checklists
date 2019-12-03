//
//  Checklist.swift
//  Checklists
//
//  Created by Tomasz Oskroba on 11/18/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
}
