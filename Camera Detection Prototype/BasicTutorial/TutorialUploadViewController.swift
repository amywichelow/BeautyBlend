import UIKit
import FirebaseStorage
import Firebase

class TutorialUploadViewController: UIViewController, UITextFieldDelegate {
    
    let storage = Storage.storage()
    
    let ref = Database.database().reference().child("tutorials").childByAutoId()
    
    var tutorial: Tutorial!
    
    @IBOutlet weak var tutorialNameTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var difficultyTextField: UITextField!
    @IBOutlet weak var mainTutorialImage: UIImageView!
    
    //var textView: UITextView?
    //let test = Texter()
    
    // Start Editing The Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -250, up: true)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -250, up: false)
    }
    
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //test.viewController = self
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomepageViewControllerContainer")
        self.present(vc!, animated: true, completion: nil)
        
    }
    
    
    @IBAction func nextStepButton(_ sender: Any) {
        
        let data: [String: Any] = [
            "tutorialName": self.tutorialNameTextField.text!,
            "duration": Int(self.durationTextField.text!)!,
            "difficulty": Int(self.difficultyTextField.text!)!
        ]
        
        ref.updateChildValues(data)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTutorialStep
        vc.tutorial = tutorial
    }
  
    
}

//extension TutorialUploadViewController: UITextFieldDelegate, UITextViewDelegate {
//
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        test.forTextView = textView
//    }
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        test.forTextField = textField
//    }
//
//}
