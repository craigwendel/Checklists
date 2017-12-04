//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Craig Wendel on 11/28/17.
//  Copyright © 2017 Craig Wendel. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}


