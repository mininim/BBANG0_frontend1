//
//  MapViewController.swift
//  Bbang0_Final
//
//  Created by 이민섭 on 2022/10/08.
//

import UIKit
import MapKit
import SnapKit


class MapViewController: UIViewController, CLLocationManagerDelegate {

    let mapView = MKMapView()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setConstraints()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    

    func setUpView(){
        
        self.view.addSubview(mapView)
    
    }
    
    func setConstraints() {
        
        mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
    }
    
}
