//
//  Person.swift
//  TableViewExercise
//
//  Created by Joao Paulo Galvao Alves on 6/9/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
  var name: String
  var lastName: String
  var age: Int
  var image: UIImage?
  
  init (name: String, lastName: String, age: Int){
    self.name = name
    self.lastName = lastName
    self.age = age
  }
  
  required init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObjectForKey("name") as!String
    self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
    self.age = aDecoder.decodeObjectForKey("age") as! Int
    self.image = aDecoder.decodeObjectForKey("image") as? UIImage
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.name, forKey: "name")
    aCoder.encodeObject(self.lastName, forKey: "lastName")
    aCoder.encodeObject(self.age, forKey: "age")
    aCoder.encodeObject(self.image, forKey: "image")
  }
  
}