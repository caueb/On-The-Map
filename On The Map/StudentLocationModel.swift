//
//  StudentLocationModel.swift
//  On The Map
//
//  Created by Caue Borella on 09/10/2017.
//  Copyright © 2017 Caue Borella. All rights reserved.
//

struct StudentLocationModel {
    
    //MARK: Properties
    
    let student: StudentModel
    let location: LocationModel
    let objectID: String
    
    init(dictionary: [String : AnyObject]) {
        objectID = dictionary[Parse_OTM.JSONResponseKeys.objectID] as? String ?? ""
        
        // Fill StudentModel Data
        let firstName = dictionary[Parse_OTM.JSONResponseKeys.firstName] as? String ?? ""
        let lastName = dictionary[Parse_OTM.JSONResponseKeys.lastName] as? String ?? ""
        let uniqueKey = dictionary[Parse_OTM.JSONResponseKeys.uniqueKey] as? String ?? ""
        let mediaURL = dictionary[Parse_OTM.JSONResponseKeys.mediaURL] as? String ?? ""
        student = StudentModel(uniqueKey: uniqueKey, firstName: firstName, lastName: lastName, mediaURL: mediaURL)
        
        // Fill LocationModel Data
        let latitude = dictionary[Parse_OTM.JSONResponseKeys.latitude] as? Double ?? 0.0
        let longitude = dictionary[Parse_OTM.JSONResponseKeys.longitude] as? Double ?? 0.0
        
        
        let mapString = dictionary[Parse_OTM.JSONResponseKeys.mapString] as? String ?? ""
        location = LocationModel(latitude: latitude, longitude: longitude, mapString: mapString)
    }
    
    init(student: StudentModel, location: LocationModel) {
        objectID = ""
        self.student = student
        self.location = location
    }
    
    init(objectID: String, student: StudentModel, location: LocationModel) {
        self.objectID = objectID
        self.student = student
        self.location = location
    }
    
    //Helper Methods
    static func locationsFromDictionaries(dictionaries: [[String:AnyObject]]) -> [StudentLocationModel] {
        var studentLocations = [StudentLocationModel]()
        for studentDictionary in dictionaries {
            studentLocations.append(StudentLocationModel(dictionary: studentDictionary))
        }
        return studentLocations
    }
}
