//
//  BottomSheetBackgroundView.swift
//  BottomSheet
//
//  Created by Felix Weiss on 27.08.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

class BottomSheetBackgroundView: UIView {
    
    private let borderWidth: CGFloat = 1
    private let cornerRadius: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = cornerRadius
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = borderWidth
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.bounds = CGRect(origin: bounds.origin, size: CGSize(width: bounds.size.width + (2 * borderWidth), height: bounds.size.height))
    }
}
