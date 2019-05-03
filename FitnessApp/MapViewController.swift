import UIKit
import MapKit
import Firebase

class MapViewController: UIViewController {
    
    let locationManager = CLLocationManager()

    var hasPutPoints = false
    
<<<<<<< HEAD
    //@IBAction func BackButton(_ sender: UIBarButtonItem){
      // dismiss(animated:true, completion: nil)
       // func setCustomBackImage(){
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
      //  }
   // }

    @IBOutlet weak var MKMapView: MKMapView!
=======
    @IBOutlet weak var MapView: MKMapView!
>>>>>>> ed64b95a9c546d71b61df7bf749741c5facc2761
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        MKMapView.userTrackingMode = .follow
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
    }
   

        
    
    
    
    func generatePoints(from location: CLLocation) {
        
    let coordinates = getRandomCoordinates(from: location, itemCount: 3)
    
    for coordinates in coordinates {
        let title = "Distance: \(getDistance(from: location, to: coordinates))k"
        let annotationOne = CustomAnnotation(coordinate: coordinates, title: title)
        MKMapView.addAnnotation(annotationOne)
        MKMapView.showAnnotations(MKMapView.annotations, animated: false)
    }
 }
    func getDistance(from: CLLocation, to: CLLocationCoordinate2D) -> CLLocationDistance {
     let coordinateLocation = CLLocation(latitude: to.latitude, longitude: to.longitude)
     return from.distance(from: coordinateLocation)/1000
    }


    func getRandomCoordinates(from location: CLLocation, itemCount: Int) -> [CLLocationCoordinate2D] {
    
        func getBase(number: Double) -> Double {
             return round(number * 1000)/1000
        }
           
    func randomCoordinate() -> Double{
        return Double(arc4random_uniform(140)) * 0.0001
        
    }
        let baseLatitude = getBase(number: location.coordinate.latitude - 0.007)
        // longitude is a little higher since I am not on equator, you can adjust or make dynamic
        let baseLongitude = getBase(number: location.coordinate.longitude - 0.008)
        
        var items = [CLLocationCoordinate2D]()
        for _ in 0..<itemCount{
    
            let randomLat = baseLatitude + randomCoordinate()
            let randomLong = baseLongitude + randomCoordinate()
            let location = CLLocationCoordinate2D(latitude: randomLat, longitude: randomLong)
            
            items.append(location)
            
        }
        
        return items
 }

}

extension MapViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !hasPutPoints {
          generatePoints(from: locations.last!)
            hasPutPoints = true
        }
    }
}

