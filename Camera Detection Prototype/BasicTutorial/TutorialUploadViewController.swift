import UIKit
import FirebaseStorage
import Firebase

class TutorialUploadViewController: UIViewController {
//    
//    let tutorialRef = Database.database().reference().child("tutorials")
//    
    @IBAction func nextStepButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddTutorialStep")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    let tutorialRef = Database.database().reference().child("tutorials")

    var tutorials = [Tutorial]()
    
    @IBOutlet weak var tutorialNameTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var mainTutorialImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
