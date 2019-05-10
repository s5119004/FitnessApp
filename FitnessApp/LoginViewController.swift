import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil{
            self.presentLoggedInScreen()
        }
    }
        
    @IBAction func login(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let _ = user {
                self.dismiss(animated: true, completion: nil)
                // if hes hit log in and everything okay it dissmisses the login view controller
                
            }
            self.presentLoggedInScreen()
        }
    }
    
    func presentLoggedInScreen() {
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginViewController:LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(LoginViewController, animated: true, completion: nil)
    }
    
}
