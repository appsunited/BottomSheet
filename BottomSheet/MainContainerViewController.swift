//
//  MainContainerViewController.swift
//  BottomSheet
//
//  Created by Felix Weiss on 27.08.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

class MainContainerViewController: BottomSheetContainerViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        mainViewController = MainViewController()
        sheetViewController = SheetViewController(height: 100, isSnapping: false)
    }
}
