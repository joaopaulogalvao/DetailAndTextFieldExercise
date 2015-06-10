//
//  ViewController.swift
//  TableViewExercise
//
//  Created by Joao Paulo Galvao Alves on 6/9/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    var john = Person(name: "John", age: 34)
    println(john.name)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

