//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Craig Wendel on 11/28/17.
//  Copyright © 2017 Craig Wendel. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID: Int
    
    func toggleChecked() {
        checked = !checked
    }
    
    override init() {
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
}


