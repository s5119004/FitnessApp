import UIKit
//whilst building firebase it fuvked up cuz we moved the files causong the app to not know where to locate them

class SecondViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    

    @IBOutlet weak var profileimage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
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
