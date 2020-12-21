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
    let marker = GMSMarker()

    override func viewDidLoad() {
        super.viewDidLoad()
        let Camera = GMSCameraPosition.camera(withLatitude: 9.5139, longitude: 78.1002, zoom: 20.0)
        Google_Map.camera = Camera
        self.Show_Maker(poition: Google_Map.camera.target)
        self.Google_Map.delegate = self
    }

    func Show_Maker(poition:CLLocationCoordinate2D){
        marker.position = poition
        marker.title = "Aruppukottai"
        marker.snippet = "Your Location"
        marker.map = Google_Map
        marker.isDraggable = true
        DrawCircle()
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
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("Dragging Start")
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("Did Drag")
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("Did End Drag")
        DrawCircle()
    }
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        marker.position = coordinate
    }
    func DrawCircle(){
        let CirclePosition = marker.position
        let Circle = GMSCircle(position: CirclePosition, radius: 10)
        Circle.map = Google_Map
        
    }
}
