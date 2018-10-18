//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Chris Sanders on 10/12/18.
//  Copyright © 2018 Chris Sanders. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
  
  let realm = try! Realm()
  
  var categories: Results<Category>?
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadCategories()
  }
  
  // MARK:= TableView Datasource Methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return categories?.count ?? 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
    

    cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet,"
    
    return cell
  }
  
  // MARK:= TableView Delegate Methods
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "goToItems", sender: self)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destinationVC = segue.destination as! TodoListViewController
    
    if let indexPath = tableView.indexPathForSelectedRow {
      destinationVC.selectedCategory = categories?[indexPath.row]
    }
  }
  
  // MARK:= Data Manipulation Methods
  func save(category: Category) {
    do {
      try realm.write {
        realm.add(category)
      }
    }  catch {
      print("Error saving context \(error)")
    }
    
    tableView.reloadData()
  }
  
  func loadCategories() {
    categories = realm.objects(Category.self)
    tableView.reloadData()
  }
  
  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    var textField = UITextField()
    let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
    let action = UIAlertAction(title: "Add", style: .default) { (action) in
      let newCategory = Category()
      newCategory.name = textField.text!

      self.save(category: newCategory)
    }
    
    alert.addTextField { (alertTextField) in
      alertTextField.placeholder = "Create new category"
      textField = alertTextField
    }
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  
}
