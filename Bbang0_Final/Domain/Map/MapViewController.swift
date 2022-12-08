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
    
    private var backeryCollectionViewOpened : Bool = false
    
    
    
    
    //MARK: - UI Property
    let mapView = MKMapView()
    
    private lazy var searchButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("내 위치 탐색", for: .normal)
        btn.layer.cornerRadius = 16
        btn.setBackgroundImage(UIImage(named: "mapSearchButton"), for: .normal)
        btn.addAction(UIAction(handler: { _ in
            
            // search Button 눌렀을 때
            print("search button tapped!")
            self.backeryCollectionViewOpened = true
            
            // -- 1 constraint 변경
            self.updatesearchButtonConstraints()
            
            
            // -- 2 주변 탐색 / collection view 띄우기
            
            
        }), for: .touchUpInside)

        
        return btn
    }()
    
    
    private lazy var backeryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
        
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.allowsMultipleSelection = false
        
        return cv
    }()
    
    
    //MARK: - LifeCycle/Initializer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setConstraints()
        
        setDelegate()
        
        //locationManager 처리
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        backeryCollectionView.register(BakeryCollectionViewCell.self, forCellWithReuseIdentifier: BakeryCollectionViewCell.identifier)
    }
    
    //MARK: - Custom Method
    
    func setUpView(){
        
        self.view.addSubview(mapView)
        self.view.addSubview(searchButton)
        self.view.addSubview(backeryCollectionView)
    
    }
    
    func setConstraints() {
        
        mapView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-82)
            
        }
        
        backeryCollectionView.snp.makeConstraints { make in
            
            make.leading.trailing.equalTo(0)
            
            make.height.equalTo(229)
            make.bottom.equalTo(1000)
            
        }
        
        
    }
    
    private func setDelegate(){
        backeryCollectionView.dataSource = self
        backeryCollectionView.delegate = self
    }
    
    
    
    func updatesearchButtonConstraints(){
        
        searchButton.snp.updateConstraints { make in
            make.bottom.equalToSuperview().offset(-299)
        }
        
        backeryCollectionView.snp.updateConstraints { make in
            make.bottom.equalTo(-48)
            
        }
        
        
    }
    
    
    
}
// MARK: - CollectionView Delegate

extension MapViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing :CGFloat = 10
        let myWidth :CGFloat = (collectionView.bounds.width - itemSpacing * 2 )
        
        return CGSize(width: myWidth, height: collectionView.bounds.height)
    }
}

extension MapViewController : UICollectionViewDelegate {

    
}

extension MapViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BakeryCollectionViewCell.identifier, for: indexPath) as? BakeryCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .white
        
        return cell
        
    }
    
    
    
}
