//
//  ViewController.swift
//  TableViewExercise
//
//  Created by Joao Paulo Galvao Alves on 6/9/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

  
  @IBOutlet weak var tableView: UITableView!
  
  var greatBasketPlayers = [Person]()
  var greatFootBallPlayers = [Person]()
  
  let numberOfSections = 2
  
 
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //Setup the dataSource
    self.tableView.dataSource = self
    
    //Create Basketball player objects
    var jordan = Person(name: "Michael Jordan", age: 45)
    var johnson = Person(name: "Magic Johnson", age: 50)
    var bird = Person(name: "Larry Bird", age: 60)
    var bryant = Person(name: "Kobe Bryant", age: 36)
    var james = Person(name: "Lebron James", age: 34)
    
    //Add Basketball players objects to the Array
     greatBasketPlayers = [jordan,johnson,bird,bryant,james]
    
    //Create Football player objects
    var sherman = Person(name: "Richard Sherman", age: 29)
    var wilson = Person(name: "Russell Wilson", age: 30)
    var lynch = Person(name: "Marshawn Lynch", age: 27)
    var chancellor = Person(name: "Kameron Chancellor", age: 34)
    var graham = Person(name: "Jimmy Graham", age: 32)
    
    //Add Football players objects to the Array
    greatFootBallPlayers = [sherman,wilson,lynch,chancellor,graham]
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //Number of Sections
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return self.numberOfSections
  }
  
  //Number of Rows
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return greatBasketPlayers.count
  }
  
  //Title for headers
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return "Great Basketball Players (Name:Age)"
    } else {
      return "Great Football Players(Name:Age)"
    }
  }
  
  //Populate all cells
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    
    if indexPath.section == 0 {
      
      //Display players names
      let nameToDisplay = self.greatBasketPlayers[indexPath.row]
      cell.textLabel?.text = nameToDisplay.name
      
      //Convert ages to String
      var myAgeToDisplay = String(nameToDisplay.age)
      cell.detailTextLabel?.text = myAgeToDisplay
      
    } else {
      
      //Display players names
      let nameToDisplay = self.greatFootBallPlayers[indexPath.row]
      cell.textLabel?.text = nameToDisplay.name
      
      //Convert ages to String
      var myAgeToDisplay = String(nameToDisplay.age)
      cell.detailTextLabel?.text = myAgeToDisplay
      
    }
    return cell
  }


}






















