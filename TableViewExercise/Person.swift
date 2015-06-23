//
//  Person.swift
//  TableViewExercise
//
//  Created by Joao Paulo Galvao Alves on 6/9/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class Person {
  var name: String
  var lastName: String
  var age: Int
  var image: UIImage?
  
  init (name: String, lastName: String, age: Int){
    self.name = name
    self.lastName = lastName
    self.age = age
  }
  
}