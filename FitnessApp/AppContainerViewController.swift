import UIKit

class AppContainerViewController: UIInputViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         AppManager.shared.appContainer = self
        AppManager.shared.showApp()
        }
    
}

