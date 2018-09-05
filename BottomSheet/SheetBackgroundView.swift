//
//  SheetBackgroundView.swift
//  BottomSheet
//
//  Created by Felix Weiss on 05.09.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

class SheetBackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
