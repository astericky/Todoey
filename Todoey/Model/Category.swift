//
//  Category.swift
//  Todoey
//
//  Created by Chris Sanders on 10/16/18.
//  Copyright © 2018 Chris Sanders. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
  @objc dynamic var name: String = ""
  let items = List<Item>()
}

