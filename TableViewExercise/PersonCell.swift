//
//  PersonCell.swift
//  DetailAndTextFieldExercise
//
//  Created by Joao Paulo Galvao Alves on 6/26/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

  @IBOutlet weak var labelName: UILabel!
  @IBOutlet weak var labelLastName: UILabel!
  
  @IBOutlet weak var imgViewPhoto: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
