//
//  ContentCollectionViewRankCell.swift
//  14_NetflixStyleSampleApp
//
//  Created by Peter on 2022/03/24.
//

import UIKit

class ContentCollectionViewRankCell: UICollectionViewCell {
    let imageview = UIImageView()
    let rankLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // contentView
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        
        // imageView
        imageview.contentMode = .scaleToFill
        contentView.addSubview(imageview)
        imageview.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        
        
        // rankLabel
        rankLabel.font = .systemFont(ofSize: 100, weight: .black)
        rankLabel.textColor = .white
        contentView.addSubview(rankLabel)
        rankLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().offset(25)
        }
        
        
        
    }
}
