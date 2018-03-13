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
    
    var uuid: String
//    let username: String
    let tutorialName: String
    let difficulty: String
    let duration: String
//    let description: String
    
    init?(snapshot: DataSnapshot) {
        if let snapshotData = snapshot.value as? [String: Any] {
            uuid = snapshot.key
//            username = snapshotData ["Username"] as! String
            tutorialName = snapshotData ["TutorialName"] as! String
            difficulty = snapshotData ["Difficulty"] as! String
            duration = snapshotData ["Duration"] as! String
//            description = snapshotData ["Description"] as! String
        }
        return nil
    }
    
}
