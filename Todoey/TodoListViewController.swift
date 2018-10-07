//
//  ViewController.swift
//  Todoey
//
//  Created by Chris Sanders on 10/6/18.
//  Copyright © 2018 Chris Sanders. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
  
  var itemArray = ["Find Mike",  "Buy Eggos", "Destroy Demogorgon"]
  let defaults = UserDefaults.standard

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    if let items = defaults.array(forKey: "TodoListArray") as? [String] {
      itemArray = items
    }
  }

  // MARK:- TableView Datasource Methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
    cell.textLabel?.text = itemArray[indexPath.row]
    
    return cell
  }
  
  // MARK:- TableView Delegate Methods
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.deselectRow(at: indexPath, animated: true)
    
    if let cell = tableView.cellForRow(at: indexPath) {
      
      if cell.accessoryType == .none {
        cell.accessoryType = .checkmark
      } else {
        cell.accessoryType = .none
      }
      
    }
    
  }
  
  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
    var textField = UITextField()
    let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
    let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
      // What will happen once user clicks the Add Item button on our uIAlert
      self.itemArray.append(textField.text!)
      self.defaults.set(self.itemArray, forKey: "TodoListArray")
      self.tableView.reloadData()
    }
    
    alert.addTextField { (alertTextField) in
      alertTextField.placeholder = "Create new item"
      textField = alertTextField
    }
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)

  }
  
}

