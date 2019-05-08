import UIKit
import Firebase

class AppManager {
    
    static let shared = AppManager()
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var appContainer: AppContainerViewController!
    
    
    
    
    
    private init() {}
    
    func showApp() {
        
        var SecondViewController: UIViewController
        
        if Auth.auth().currentUser == nil {
        //firebase way getting the cashed of the users detieleds
            SecondViewController = storyboard.instantiateViewController(withIdentifier: "loginViewController")
        } else {
            SecondViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
            
        }
        
            
        appContainer.present(SecondViewController, animated: true, completion: nil)
        }
    func logout() {
        try!Auth.auth().signOut()
        appContainer.presentedViewController?.dismiss(animated: true, completion: nil)
    }
    }
    

