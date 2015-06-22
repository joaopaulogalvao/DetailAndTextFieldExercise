//
//  DetailViewController.swift
//  TableViewExercise
//
//  Created by Joao Paulo Galvao Alves on 6/11/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  
  @IBOutlet weak var txtFieldFirstName: UITextField!
  @IBOutlet weak var txtFieldLastName: UITextField!
  
  var selectedPlayer: Person!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.txtFieldFirstName.delegate = self
    self.txtFieldLastName.delegate = self
    
    self.txtFieldFirstName.tag = 0
    self.txtFieldLastName.tag = 1
    
    self.txtFieldFirstName.text = self.selectedPlayer.name
    self.txtFieldLastName.text = self.selectedPlayer.lastName
    
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    
    return false
    
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      self.selectedPlayer.name = self.txtFieldFirstName.text
    } else {
      self.selectedPlayer.lastName = self.txtFieldLastName.text
    }
  }
  
  
  
}
