//
//  Checklist.swift
//  Checklists
//
//  Created by Craig Wendel on 12/4/17.
//  Copyright © 2017 Craig Wendel. All rights reserved.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var iconName = "No Icon"
    var items = [ChecklistItem]()
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
    
    init(name: String) {
        self.name = name
        super.init()
    }
}

