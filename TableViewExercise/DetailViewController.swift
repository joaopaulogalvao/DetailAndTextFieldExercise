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
  @IBOutlet weak var imageView: UIImageView!
  
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
  
  @IBAction func buttonPressed(sender: AnyObject) {
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
    let image = info[UIImagePickerControllerEditedImage] as! UIImage
    self.imageView.image = image
    
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
  
}

































