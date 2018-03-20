//
//  BasicTutorialInfo.swift
//  Camera Detection Prototype
//
//  Created by Amy Wichelow on 13/03/2018.
//  Copyright © 2018 Amy Wichelow. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AddTutorialStep: UIViewController {
    
    let tutorialRef = Database.database().reference().child("tutorials")
    
    var tutorials = [Tutorial]()
    
    @IBOutlet weak var stepLabel: UILabel!
    
    @IBOutlet weak var decriptionLabel: UITextField!
    
    @IBAction func addStepButton(_ sender: Any) {
    }
    
    @IBAction func finishUploadButton(_ sender: Any) {
        
        let tutorial = Tutorial(tutorialName: "Makeup", duration: 10, difficulty: 3, tutorialDescription: "Tutorial")
        tutorials.append(tutorial)
        
        upload { success in
            print("All steps uploaded")
        }
    }
    
    func upload(completion: @escaping (_ success: Bool) -> Void) {
        
        //        tutorialRef.childByAutoId().setValue([
        //            "tutorialName": self.tutorialNameTextField.text!,
        //            "duration": self.durationTextField.text!,
        //            "difficulty": self.difficultyTextField.text!,
        //            "tutorialDescription": self.descriptionTextField.text!,
        //            "user": CustomUser.shared.username!,
        //            "usser_uid": Auth.auth().currentUser!.uid
        //            ])
        
        let newTutorialRef = tutorialRef.childByAutoId()
        var count = 0
        
        for tutorial in tutorials {
            newTutorialRef.childByAutoId().setValue(tutorial.toDict(), withCompletionBlock: { error, ref in
                count += 1
                if count == self.tutorials.count {
                    completion(true)
                }
            })
        }
    }
        
}
    
func viewDidLoad() {
        
}

