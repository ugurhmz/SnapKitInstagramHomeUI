//
//  StoryItemCollectionCell.swift
//  InstagramHomeUISnapkit
//
//  Created by Uğur Hamzaoğlu on 22.02.2024.
//

import UIKit
import SnapKit

class StoryItemCollectionCell: UICollectionViewCell {
    static var identifier = "StoryItemCollectionCell"
    
    
    private let storyImg: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .lightGray
        imgView.layer.cornerRadius = 35
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let userTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem 1"
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private let profileCircleImg: UIImageView = {
        let imgView = UIImageView()
        return imgView
    }()
    
    private let addStoryBtn: UIButton = {
        let button = UIButton(type: .system)
        button.layer.backgroundColor = UIColor.systemBlue.cgColor
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellSettings()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func configure(isImgSet: Bool) {
        if isImgSet {
            self.profileCircleImg.image = UIImage(named: "circle-img")
            self.addStoryBtn.isHidden = true
        }  else {
            
        }
    }
    
    
}

// MARK: -
extension StoryItemCollectionCell {
    private func cellSettings() {
        
        contentView.addSubview(storyImg) // storyImg
        storyImg.snp.makeConstraints { make in
            make.size.equalTo(70)
            make.leading.top.trailing.equalToSuperview().inset(5)
        }
        
        contentView.addSubview(userTitleLabel) // userTitleLabel
        userTitleLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview().inset(5)
            make.top.equalTo(storyImg.snp.bottom).offset(5)
        }
        
        contentView.addSubview(profileCircleImg)
        profileCircleImg.snp.makeConstraints { make in
            make.center.equalTo(storyImg)
            make.size.equalTo(80)
        }
        
        contentView.addSubview(addStoryBtn)
        addStoryBtn.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(storyImg)
            make.size.equalTo(20)
        }
    }
}
