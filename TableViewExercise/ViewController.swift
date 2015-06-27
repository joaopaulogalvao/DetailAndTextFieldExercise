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
  
  var greatFootBallPlayers = [Person]()
  
  
 
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    if let peopleFromArchive = self.loadFromArchive() {
      self.greatFootBallPlayers = peopleFromArchive
    } else {
      self.loadPeopleFromPlist()
      self.saveToArchive()
    }
    
    //Setup the dataSource
    self.tableView.dataSource = self
    
  }
  
  func loadPeopleFromPlist() {
    
    if let peoplePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist"),
      peopleObjects = NSArray(contentsOfFile: peoplePath) as? [[String : AnyObject]]
    {
      for object in peopleObjects {
        
        if let name = object["name"] as? String,
          lastName = object["lastName"] as? String,
          //Add age if needed later
          age = object["age"] as? Int {
            let person = Person(name: name, lastName: lastName, age: age)
            self.greatFootBallPlayers.append(person)
        }
      }
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.saveToArchive()
    self.tableView.reloadData()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  //Number of Rows
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return self.greatFootBallPlayers.count
  }
  
  //Title for headers
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
      return "Seattle Seahawks"
  }
  
  //Populate all cells
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PersonCell
    
    //Layer
    cell.imgViewPhoto.layer.cornerRadius = 25
    cell.imgViewPhoto.layer.masksToBounds = true;
    cell.imgViewPhoto.layer.borderWidth = 1
    cell.imgViewPhoto.layer.borderColor = UIColor.blackColor().CGColor
    
    //Display players names
    let nameToDisplay = self.greatFootBallPlayers[indexPath.row]
    
    //with optional binding
    if let image = nameToDisplay.image {
      cell.imgViewPhoto.image = image
    }
    
    
    cell.labelName.text = nameToDisplay.name
    cell.labelLastName.text = nameToDisplay.lastName
    //Add age if needed later
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    if let lastSelectedName = userDefaults.objectForKey("LastSelected") as? String where lastSelectedName == nameToDisplay.name  {
      
      cell.backgroundColor = UIColor.lightGrayColor()
    }
    //Convert ages to String
//    var myAgeToDisplay = String(nameToDisplay.age)
//    cell.detailTextLabel?.text = myAgeToDisplay
    
    return cell
  }
  
  override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "ShowDetailSegue"{
      
      if let personDetailViewController = segue.destinationViewController as? DetailViewController {
        
        //grab the selected indexPath from the TableView
        let mySelectedIndexPath = self.tableView.indexPathForSelectedRow()
        
        if let selectedIndexPath = self.tableView.indexPathForSelectedRow() {
          
          let selectedRow = selectedIndexPath.row
          
          //grab the selected person using the indexPath as the index in the players array
          let selectedFootballPlayer = self.greatFootBallPlayers[selectedRow]
          
          //Set destinationViewController player propery to reference the selected player
            personDetailViewController.selectedPlayer = selectedFootballPlayer
          
          let userDefaults = NSUserDefaults.standardUserDefaults()
          userDefaults.setObject(selectedFootballPlayer.name, forKey: "LastSelected")
          userDefaults.synchronize()
        }

      }
      
    }
    
  }
  
  func saveToArchive() {
    
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      println(archivePath)
      NSKeyedArchiver.archiveRootObject(self.greatFootBallPlayers, toFile: archivePath + "/archive")
    }
  }
  
  func loadFromArchive() -> [Person]? {
    
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      
      if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath + "/archive") as? [Person] {
        return peopleFromArchive
      }
      
    }
    return nil
    
  }
  
  

}






















