import UIKit
import Firebase

class AppManager {
    
    static let shared = AppManager()
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var appContainer: AppContainerViewController!
    
    private init() {}
    
    
    func showApp() {
        print("show app")
        var viewController: UIViewController
        
        if Auth.auth().currentUser == nil {
        //firebase way getting the cashed of the users detieleds
            viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        } else {
            viewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        }
        //if can't find a user then take to the login page LoginViewController
        //if can find user then skp the login page and go to SecondViewController
        
        appContainer.present(viewController, animated: true, completion: nil)
        }
    
    
    func logout() {
        try!Auth.auth().signOut()
        appContainer.presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
}
    

