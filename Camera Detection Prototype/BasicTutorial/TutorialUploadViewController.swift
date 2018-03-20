import UIKit
import FirebaseStorage
import Firebase

class TutorialUploadViewController: UIViewController {
    
    let storage = Storage.storage()

    let tutorial = Tutorial(tutorialName: "Amy's Tutorial", duration: 10, difficulty: 3)
    
    @IBAction func cancelButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomepageViewControllerContainer")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    
    @IBAction func nextStepButton(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTutorialStep
        vc.tutorial = tutorial
    }
    
    
    @IBOutlet weak var tutorialNameTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var mainTutorialImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
