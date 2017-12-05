//
//  ListDetailViewController.swift
//  Checklists
//
//  Created by Craig Wendel on 12/4/17.
//  Copyright © 2017 Craig Wendel. All rights reserved.
//

import Foundation
import UIKit

protocol ListDetailViewControllerDelegate: class {

    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController)

    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist)

    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let checklist = checklistToEdit {
            title = "Edit Checklist"
            textField.text = checklist.name
            doneBarButton.isEnabled = true
        }

        navigationItem.largeTitleDisplayMode = .never
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!

    weak var delegate: ListDetailViewControllerDelegate?
    var checklistToEdit: Checklist?

    // MARK:- Actions

    @IBAction func cancel() {
        delegate?.listDetailViewControllerDidCancel(self)
        print("Cancelling")
    }

    @IBAction func done() {
        if let checklist = checklistToEdit {
            checklist.name = textField.text!
            delegate?.listDetailViewController(self, didFinishEditing: checklist)
            print("Trying to edit item")
        } else {
            let checklist = Checklist(name: textField.text!)
            delegate?.listDetailViewController(self, didFinishAdding: checklist)
            print("Trying to add item")
        }
    }

    // MARK:- TableView Delegates

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

    // MARK:- UITextField Delegates

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)

        doneBarButton.isEnabled = !newText.isEmpty

        return true
    }
}


