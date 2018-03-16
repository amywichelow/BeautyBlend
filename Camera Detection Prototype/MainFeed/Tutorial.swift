//
//  TutorialClass.swift
//  Camera Detection Prototype
//
//  Created by Amy Wichelow on 13/03/2018.
//  Copyright © 2018 Amy Wichelow. All rights reserved.
//

import UIKit
import Firebase

class Tutorial {
    
    var uuid: String?
    let tutorialName: String
//    let difficulty: String
    let duration: String
    let description: String
    
    init?(snapshot: DataSnapshot) {
        if let snapshotData = snapshot.value as? [String: Any] {
            uuid = snapshot.key
            tutorialName = snapshotData ["tutorialName"] as! String
       //     difficulty = snapshotData ["difficulty"] as! String
            duration = snapshotData ["duration"] as! String
            description = snapshotData ["description"] as! String
        }
        return nil
    }
    
    init(tutorialName: String, duration: String, description: String) {
        self.tutorialName = tutorialName
        self.duration = duration
      //  self.difficulty = difficulty
        self.description = description
    }
    
}
