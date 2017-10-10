//
//  StudentLocationCell.swift
//  On The Map
//
//  Created by Caue Borella on 09/10/2017.
//  Copyright © 2017 Caue Borella. All rights reserved.
//

import UIKit

class StudentLocationCell: UITableViewCell {

    //MARK: Outlets
    
    @IBOutlet weak var pinImage: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var mediaURL: UILabel!
    
    func configureStudentLocationCell(studentLocation: StudentLocationModel){
        pinImage.image = #imageLiteral(resourceName: "pin")
        fullName.text = studentLocation.student.fullName
        mediaURL.text = studentLocation.student.mediaURL
    }

}
