//
//  ViewController.swift
//  Todoey
//
//  Created by Chris Sanders on 10/6/18.
//  Copyright © 2018 Chris Sanders. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
  
  let itemArray = ["Find Mike",  "Buy Eggos", "Destroy Demogorgon"]

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
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
  
  
}

