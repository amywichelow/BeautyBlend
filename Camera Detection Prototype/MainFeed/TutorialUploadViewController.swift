import UIKit
import FirebaseStorage
import Firebase

class TutorialUploadViewController: UIViewController {
    
    let tutorialRef = Database.database().reference().child("tutorials")

    var tutorials = [Tutorial]()
    
    @IBOutlet weak var tutorialNameTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var difficultySlider: UISlider!
    @IBOutlet weak var mainTutorialImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var difficultySliderLabel: UILabel!
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        difficultySliderLabel.text = String(Int(sender.value))
    
    }
    
    @IBAction func UploadButton(_ sender: UIButton) {
        
        let tutorial = Tutorial(tutorialName: "Makeup", duration: "10", description: "Tutorial")
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
//            "description": self.descriptionTextField.text!,
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
        
        //let vc = self.storyboard?.instantiateViewController(withIdentifier: "TutorialUploadViewController")
        //self.present(vc!, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
