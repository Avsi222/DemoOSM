//
//  CartoMobileViewController.swift
//  DemoOSM
//
//  Created by Арсений Дорогин on 20/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import UIKit

class CartoMobileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // MapView initialization in code: initialize and set it as view
        let mapView = NTMapView()
        view = mapView
        
        let baseLayer = NTCartoOnlineVectorTileLayer(style: NTCartoBaseMapStyle.CARTO_BASEMAP_STYLE_VOYAGER)
        mapView?.getLayers().add(baseLayer)
        
        
        // Get base projection from mapView
        let projection = mapView?.getOptions().getBaseProjection();
        
        // Create a vector data source, bucket where we'll put objects
        let source = NTLocalVectorDataSource(projection: projection);
        
        
        // define marker location. Make sure to use projection fromWgs84 to have proper coordinate system
        let tallinn = projection?.fromWgs84(NTMapPos(x: 24.646469, y: 59.426939));
        // zoom map view focus to the marker
        mapView?.setFocus(tallinn, durationSeconds: 0);
        mapView?.setZoom(15, durationSeconds: 0);
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
