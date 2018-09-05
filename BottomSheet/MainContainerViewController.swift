//
//  MainContainerViewController.swift
//  BottomSheet
//
//  Created by Felix Weiss on 27.08.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

class MainContainerViewController: BottomSheetViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        mainViewController = MainViewController()
        bottomSheetViewController = SheetContentViewController(height: 150, background: SheetBackgroundView())
    }
}
