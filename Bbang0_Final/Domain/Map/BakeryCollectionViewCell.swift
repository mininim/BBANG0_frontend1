//
//  BakeryCollectionViewCell.swift
//  Bbang0_Final
//
//  Created by 이민섭 on 2022/10/08.
//

import UIKit

class BakeryCollectionViewCell: UICollectionViewCell {
    
    // Only For testing - viewCell
    
    var bakeryImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var bakeryName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    var bakeryAddress : UILabel = {
        let address = UILabel()
        address.translatesAutoresizingMaskIntoConstraints = false
        return address
    }()

 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        handleConstraints()
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        self.layer.cornerRadius = 15.0
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize(width: 5, height: 10)
        self.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    
    func handleConstraints() {
        
        self.addSubview(bakeryImage)
        bakeryImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bakeryImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bakeryImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bakeryImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        self.addSubview(bakeryName)
        bakeryName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        bakeryName.topAnchor.constraint(equalTo: bakeryImage.bottomAnchor, constant: 10).isActive = true
        
        self.addSubview(bakeryAddress)
        bakeryAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        bakeryAddress.topAnchor.constraint(equalTo: bakeryName.bottomAnchor, constant: 10).isActive = true
        
    }
    
}
