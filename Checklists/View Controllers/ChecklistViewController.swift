//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Craig Wendel on 11/27/17.
//  Copyright © 2017 Craig Wendel. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, AddItemViewControllerDelegate {
    
    var checklist: Checklist!
    
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated:true)
    }

    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem) {

        let newRowIndex = checklist.items.count
        checklist.items.append(item)

        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated:true)
    }

    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem) {
        if let index = checklist.items.index(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated:true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.largeTitleDisplayMode = .never
        title = checklist.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- TableView Delegates

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklist.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)

        let item = checklist.items[indexPath.row]

        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let cell = tableView.cellForRow(at: indexPath) {

            let item = checklist.items[indexPath.row]
            item.toggleChecked()

            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit edittingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        checklist.items.remove(at: indexPath.row)

        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    // MARK:- Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
             let controller = segue.destination as! ItemDetailViewController
                controller.delegate = self
            if let indexPath = tableView.indexPath(
                for: sender as! UITableViewCell) {
                controller.itemToEdit = checklist.items[indexPath.row]
            }
        }
    }

    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {

        let label = cell.viewWithTag(1001) as! UILabel
        label.textColor = view.tintColor

        if item.checked {
            label.text = "✓"
        } else {
            label.text = ""
        }
    }

    func configureText(for cell: UITableViewCell, with item: ChecklistItem) {

        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }

}




