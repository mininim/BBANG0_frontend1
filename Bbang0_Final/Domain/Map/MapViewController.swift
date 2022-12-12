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
    
    var isOneStepPaging = true
    var currentIndex: CGFloat = 0
    
    
    //MARK: - UI Property
    let mapView = MKMapView()
    
    private lazy var searchButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("내 위치 탐색", for: .normal)
        btn.titleLabel?.font = btn.titleLabel?.font.withSize(14.0)
        btn.layer.cornerRadius = 16
        btn.setBackgroundImage(UIImage(named: "mapSearchButton"), for: .normal)
        
        btn.addAction(UIAction(handler: { _ in
            
            // search Button 눌렀을 때
            print("search button tapped!")
            self.backeryCollectionViewOpened = true
            
            // -- CollectionView & searchButton & delet 버튼 띄우기
            self.popUpSearchButton()
            self.showBakeryCollectionView()
            
            
            
        }), for: .touchUpInside)

        
        return btn
    }()
    
    
    private lazy var backeryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        
        cv.decelerationRate = .fast
        cv.isPagingEnabled = true

        return cv
        
    }()
    
    private lazy var hideButton: UIButton = {
       
 
        let btn = UIButton()
        btn.setImage(UIImage(named: "up_arrow_btn"), for: .normal)
        btn.setImage(UIImage(named: "down_arrow_btn"), for: .selected)
        btn.translatesAutoresizingMaskIntoConstraints = false

        btn.addAction(UIAction(handler: { action in
            
            
            print("hideButton button tapped!")
            
            
            if self.backeryCollectionViewOpened{
                
                self.backeryCollectionViewOpened = false
                self.popDownSearchButton()
                self.hideBakeryCollectionView()
                
            }else{
                
                self.backeryCollectionViewOpened = true
                self.popUpSearchButton()
                self.showBakeryCollectionView()
                
            }
            
        }), for: .touchUpInside)
        
        return btn
        
    }()
    
    
    private lazy var locationButton: UIButton = {
       
 
        let btn = UIButton()
        btn.setImage(UIImage(named: "myLocation_btn"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false

        btn.addAction(UIAction(handler: { action in
            
            // 내 주변 위치로 이동 기능
            
            
            
        }), for: .touchUpInside)
        
        return btn
        
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
    private func setDelegate(){
        backeryCollectionView.dataSource = self
        backeryCollectionView.delegate = self
    }
    
    
    func setUpView(){
        
        self.view.addSubview(mapView)
        self.view.addSubview(searchButton)
        self.view.addSubview(backeryCollectionView)
        self.view.addSubview(hideButton)
        self.view.addSubview(locationButton)
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
        
        hideButton.snp.makeConstraints { make in
            
            make.centerY.equalTo(searchButton.snp.centerY)
            make.leading.equalTo(searchButton.snp.trailing).offset(76)
            
        }
        
        locationButton.snp.makeConstraints { make in
            
            make.centerY.equalTo(searchButton.snp.centerY)
            make.trailing.equalTo(searchButton.snp.leading).offset(-76)
            
        }
        
    }
    
    func hideBakeryCollectionView(){
        backeryCollectionView.snp.updateConstraints { make in
            make.bottom.equalTo(1000)
            
        }
    }
    
    func showBakeryCollectionView(){
        backeryCollectionView.snp.updateConstraints { make in
            make.bottom.equalTo(-48)
            
        }
    }
    
    func popUpSearchButton(){
        
        hideButton.isSelected = true
        
        searchButton.snp.updateConstraints { make in
            make.bottom.equalToSuperview().offset(-299)
        }
        
        
    }
    
    func popDownSearchButton(){
        
        hideButton.isSelected = false
        
        searchButton.snp.updateConstraints { make in
            make.bottom.equalToSuperview().offset(-82)
        }
        
        
    }
    
    
    
}
// MARK: - CollectionView Delegate

extension MapViewController : UICollectionViewDelegateFlowLayout{
    
    //paging
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing :CGFloat = 12
        let myWidth :CGFloat = (collectionView.frame.size.width - itemSpacing)
        
        return CGSize(width: myWidth, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let itemSpacing :CGFloat = 12
        return itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let itemSpacing :CGFloat = 12
        return UIEdgeInsets(top: 0, left: itemSpacing/2, bottom: 0, right: itemSpacing/2);
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



