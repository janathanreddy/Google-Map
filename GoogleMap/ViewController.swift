//
//  ViewController.swift
//  GoogleMap
//
//  Created by Janarthan Subburaj on 21/12/20.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var Google_Map: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Camera = GMSCameraPosition.camera(withLatitude: 9.5139, longitude: 78.1002, zoom: 10.0)
        Google_Map.camera = Camera
        self.Show_Maker(poition: Google_Map.camera.target)
        self.Google_Map.delegate = self
    }

    func Show_Maker(poition:CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = poition
        marker.title = "Aruppukottai"
        marker.snippet = "Your Location"
        marker.map = Google_Map
        marker.isDraggable = true
    }
}
extension ViewController: GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView,didTapInfoWindowof marker: GMSMarker){
        print("Clicked on Marker")
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 100))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        let title = UILabel(frame: CGRect.init(x: 8, y: 8, width: self.view.frame.width - 16, height: 15))
        title.text = "Your Location"
        view.addSubview(title)
        return view
        
    }
}
