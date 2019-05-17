import UIKit
import FirebaseAuth
//whilst building firebase it fuvked up cuz we moved the files causong the app to not know where to locate them

class SecondViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    // This is the logout button, which lets you exit the app.
    @IBAction func logoutTapped(_ sender: Any) {
        AppManager.shared.logout()
    }
    //This is the image itself.
    @IBOutlet weak var profileimage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //This is the button that you press that takes you to your photo gallery.
    @IBAction func UIbutton(_ sender: Any) {
    
    
        let image = UIImagePickerController()
        image.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            image.sourceType = .camera
            self.present(image, animated: true, completion: nil)
        }else{
            print("camera not available")
        }
        
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true) {
    }
    
    }
// This is the start button that segues onto the map view controller. 
    @IBAction func startButton(_ sender: UIButton) {
    }

    

    func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info:
    [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
       profileimage.image = image
    }else{
       print("error")
    }
    self.dismiss(animated: true, completion: nil)
}
}
