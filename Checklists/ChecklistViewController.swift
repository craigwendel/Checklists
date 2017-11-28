//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Craig Wendel on 11/27/17.
//  Copyright © 2017 Craig Wendel. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView,
                               numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ChecklistItem",
                for: indexPath)
            
            let label = cell.viewWithTag(1000) as! UILabel
            
            if indexPath.row % 5 == 0 {
                label.text = "Walk the dog"
            } else if indexPath.row % 5 == 1 {
                label.text = "Brush my teeth"
            } else if indexPath.row % 5 == 2 {
                label.text = "Learn iOS development"
            } else if indexPath.row % 5 == 3 {
                label.text = "Finish my application"
            } else if indexPath.row % 5 == 4 {
                label.text = "Eat ice cream"
            }
            
            return cell
    }
    
}

