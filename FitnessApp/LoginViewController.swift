import UIKit
import Firebase

class LoginViewController: UIViewController {
    // This is a button where you can type in your user email and password, which sends you to the main page.
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    @IBAction func login(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let _ = user {
                self.dismiss(animated: true, completion: nil)
                // if hes hit log in and everything okay it dissmisses the login view controller
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
