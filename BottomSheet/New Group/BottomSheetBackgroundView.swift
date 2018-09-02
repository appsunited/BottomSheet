//
//  BottomSheetBackgroundView.swift
//  BottomSheet
//
//  Created by Felix Weiss on 27.08.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

class BottomSheetBackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
//        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
