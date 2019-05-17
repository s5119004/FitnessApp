import UIKit

class AppContainerViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         AppManager.shared.appContainer = self
         AppManager.shared.showApp()
        }
    
}
// The background work, which gets rid of any glitches. 
