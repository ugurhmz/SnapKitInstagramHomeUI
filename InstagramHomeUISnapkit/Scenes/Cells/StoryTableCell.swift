//
//  StoryTableCell.swift
//  InstagramHomeUISnapkit
//
//  Created by Uğur Hamzaoğlu on 22.02.2024.
//

import UIKit
import SnapKit

class StoryTableCell: UITableViewCell {
    
    static var identifier = "StoryTableCell"
    private var storyCollectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellSettings()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        
    }
}

// MARK: -
extension StoryTableCell {
    func cellSettings(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        storyCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        storyCollectionView.register(StoryItemCollectionCell.self, forCellWithReuseIdentifier: StoryItemCollectionCell.identifier)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        storyCollectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(storyCollectionView)
        storyCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(115)
        }
    }
}

// MARK: -
extension StoryTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let storyItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryItemCollectionCell.identifier, for: indexPath) as! StoryItemCollectionCell
        if indexPath.item != 0 {
            storyItemCell.configure(isImgSet: true)
        } else {
            storyItemCell.configure(isImgSet: false)
        }
        return storyItemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
   
}
