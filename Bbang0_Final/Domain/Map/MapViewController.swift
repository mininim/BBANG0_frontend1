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

    //오늘 이거 완성이 목표~!~!
    
    //MARK: - Property
    let locationManager = CLLocationManager()
    
    //testing for forking
    
    //MARK: - UI Property
    let mapView = MKMapView()
    
    private lazy var searchButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("내 위치 탐색", for: .normal)
        btn.layer.cornerRadius = 16
        btn.setBackgroundImage(UIImage(named: "mapSearchButton"), for: .normal)
        
        return btn
    }()
    
    
    //MARK: - LifeCycle/Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setConstraints()
        
        //locationManager 처리
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    //MARK: - Custom Method
    
    func setUpView(){
        
        self.view.addSubview(mapView)
        self.view.addSubview(searchButton)
    
    }
    
    func setConstraints() {
        
        mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            
            make.center.equalToSuperview()
            
            
        }
        
        
    }
    
}
