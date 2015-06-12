//
//  DetailViewController.swift
//  TableViewExercise
//
//  Created by Joao Paulo Galvao Alves on 6/11/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var labelName: UILabel!
  @IBOutlet weak var labelLastName: UILabel!
  
  var selectedPlayer: Person!

    override func viewDidLoad() {
        super.viewDidLoad()
      self.labelName.text = self.selectedPlayer.name
      self.labelLastName.text = self.selectedPlayer.lastName

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
