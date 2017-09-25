import UIKit
import MapKit

class PuntosViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let punto = CLLocationCoordinate2D(latitude: -16.493257, longitude: -68.167253)
        
        
        let anotacion = MKPointAnnotation()
        anotacion.coordinate = punto
        anotacion.title = "Oficina Central"
        anotacion.subtitle = "Zona Calacoto"
        mapView.addAnnotation(anotacion)
        
        
        let region = MKCoordinateRegionMakeWithDistance(punto, 1000, 1000)
        mapView.setRegion(region, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
