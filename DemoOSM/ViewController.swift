//
//  ViewController.swift
//  DemoOSM
//
//  Created by Арсений Дорогин on 20/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    var tileRenderer: MKTileOverlayRenderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupTileRenderer()
        
        let initialRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.774669555422349, longitude: -73.964170794293238),
                                               span: MKCoordinateSpan(latitudeDelta: 0.16405544070813249, longitudeDelta: 0.1232528799585566))
        mapView.region = initialRegion
        mapView.showsUserLocation = true
        mapView.showsCompass = true
        mapView.setUserTrackingMode(.followWithHeading, animated: true)
        mapView.delegate = self
    }

    func setupTileRenderer() {
        // 1
        let template = "https://tile.openstreetmap.org/{z}/{x}/{y}.png"
        
        // 2
        let overlay = MKTileOverlay(urlTemplate: template)
        
        // 3
        overlay.canReplaceMapContent = true
        
        // 4
        mapView.addOverlay(overlay, level: .aboveLabels)
        
        //5
        tileRenderer = MKTileOverlayRenderer(tileOverlay: overlay)
    }
    
}
extension ViewController:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return tileRenderer
    }
}

