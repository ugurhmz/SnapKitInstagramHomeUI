//
//  LogoView.swift
//  InstagramHomeUISnapkit
//
//  Created by Uğur Hamzaoğlu on 22.02.2024.
//

import UIKit
import SnapKit

class LogoView: UIView {
    
    private let logoImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "insta-logo")
        return imgView
    }()
    
    init() {
        super.init(frame: .zero)
        cellInit()
     }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellInit(){
        addSubview(logoImg)
        logoImg.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(105)
            make.height.equalTo(30)
        }
    }
}

