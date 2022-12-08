//
//  BakeryCollectionViewCell.swift
//  Bbang0_Final
//
//  Created by 이민섭 on 2022/10/08.
//

import UIKit
import Then

class BakeryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "bakeryCollectionViewCell"
    
    var bakeryImage = UIImageView().then{
        
        $0.translatesAutoresizingMaskIntoConstraints  = false
        $0.image = UIImage(named: "storeImage_01")
        
        
    }
    
    var bakeryNameLabel = UILabel().then {
        
        $0.translatesAutoresizingMaskIntoConstraints  = false
        $0.text = "하루한빵"
        
    }
    
    var locationSymbol = UIImageView().then{
        
        $0.translatesAutoresizingMaskIntoConstraints  = false
        $0.image = UIImage(named: "marker_btn")
        
    }
    
    var bakeryLocationLabel = UILabel().then{
        $0.translatesAutoresizingMaskIntoConstraints  = false
        $0.text = "서울 노원구 공릉로 324-29, 하루 한빵"
    }
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        
        super.layoutSubviews()
        
        self.layer.cornerRadius = 15
        
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 10, height: 10)
        
        self.clipsToBounds = true
    }
    
    func setConstraint(){
        self.backgroundColor = .white
        
        
        
        self.addSubview(bakeryImage)
        self.addSubview(bakeryNameLabel)
        self.addSubview(locationSymbol)
        self.addSubview(bakeryLocationLabel)
        
        bakeryImage.contentMode = .scaleAspectFill
        
        bakeryImage.snp.makeConstraints { make in
            
            make.leading.top.trailing.equalTo(0)
            make.bottom.equalTo(-77)
            
        }
        
        bakeryNameLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(20)
            make.top.equalTo(162)
            
        }
        
        locationSymbol.snp.makeConstraints { make in
            
            make.leading.equalTo(20)
            make.top.equalTo(bakeryNameLabel.snp.bottom).offset(10)
            
        }
        
        bakeryLocationLabel.snp.makeConstraints { make in
            
            make.leading.equalTo(locationSymbol.snp.trailing).offset(5)
            make.centerY.equalTo(locationSymbol.snp.centerY)
            
        }
        
        
        
    }
    
}
