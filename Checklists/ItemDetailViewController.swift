//
//  AddItemTableViewController.swift
//  Checklists
//
//  Created by Tomasz Oskroba on 11/5/19.
//  Copyright © 2019 Tomasz Oskroba. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    
    func addItemViewControllerDidCancel(_ controller: ItemDetailViewController)
    
    func addItemViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    
    func addItemViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
    
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    var itemToEdit: ChecklistItem?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    
// MARK:- Actions
    @IBAction func cancel() {
//        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
//
//        print("Contents of the text field: \(textField.text!)")
//        navigationController?.popViewController(animated: true)
        
        if let itemToEdit = itemToEdit {
            itemToEdit.text = textField.text!
            delegate?.addItemViewController(self, didFinishEditing: itemToEdit)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            delegate?.addItemViewController(self, didFinishAdding: item)
        }
        
    }
    
// MARK:- Table View Delegates
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        return nil
    }

// MARK:- Text Field Delegates
    
    func  textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = !newText.isEmpty
        
        return true
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        
        return true
    }
    
}
