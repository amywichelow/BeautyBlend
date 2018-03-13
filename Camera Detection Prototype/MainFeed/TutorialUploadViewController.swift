import UIKit
import FirebaseStorage
import Firebase

class TutorialUploadViewController: UIViewController {
    
    let ref = Database.database().reference().child("users").child(Auth.auth().currentUser!.uid).child("Tutorial").childByAutoId()
    
    let refTutorials = Database.database().reference().child("Tutorials").childByAutoId()
    
    @IBOutlet weak var TutorialNameTextField: UITextField!
    @IBOutlet weak var DurationTextField: UITextField!
    @IBOutlet weak var DifficultyTextField: UITextField!
    @IBOutlet weak var DescriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func UploadButton(_ sender: UIButton) {
        
        ref.updateChildValues(["TutorialName": self.TutorialNameTextField.text!, "Duration": self.DurationTextField.text!, "Difficulty": self.DifficultyTextField.text!])
        
        refTutorials.updateChildValues(["TutorialName": self.TutorialNameTextField.text!, "Duration": self.DurationTextField.text!, "Difficulty": self.DifficultyTextField.text!])
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TutorialUploadViewController")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
