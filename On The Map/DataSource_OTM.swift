//
//  DataSource_OTM.swift
//  On The Map
//
//  Created by Caue Borella on 09/10/2017.
//  Copyright © 2017 Caue Borella. All rights reserved.
//

import UIKit

class DataSource_OTM: NSObject {
    
    //MARK: Properties
    private let parse_otm = Parse_OTM.sharedInstance()
    var studentLocations = [StudentLocationModel]()
    var studentUser: StudentModel? = nil
    
    //MARK: Singleton Instance
    private static let sharedInstance = DataSource_OTM()
    
    class func sharedDataSource_OTM() -> DataSource_OTM  {
        return sharedInstance
    }
    
    //MARK: Pin Down Students Locations
    
    func pinDownStudentsLocations() {
        parse_otm.getMultipleStudentLocations(){ (studentLocationDics, error) in
            // Check for Error
            if let _ = error {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: AppConstants.notifications.studentLocationsPinnedDownError), object: nil)
            } else {
                guard let studentLocationDics = studentLocationDics else {
                    return
                }
                self.studentLocations = studentLocationDics
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: AppConstants.notifications.studentLocationsPinnedDown), object: nil);
            }
        }
    }
}
