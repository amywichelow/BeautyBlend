import Foundation
import Firebase

extension Tutorial {
    
    func toDict() -> [String: Any] {
        return [
            "tutorialName": tutorialName,
            "duration": duration,
            //"difficulty": difficulty,
            "description": description,
            "user": CustomUser.shared.username!,
            "usser_uid": Auth.auth().currentUser!.uid
        ]
    }
    
}
