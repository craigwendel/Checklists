//
//  Checklist.swift
//  Checklists
//
//  Created by Craig Wendel on 12/4/17.
//  Copyright © 2017 Craig Wendel. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    var name = ""
    
    init(name: String) {
        self.name = name
        super.init()
    }
}

