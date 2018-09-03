//
//  MainContainerViewController.swift
//  BottomSheet
//
//  Created by Felix Weiss on 27.08.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

class MainContainerViewController: BottomSheetContainerViewController, BottomSheetConfig {
    
    let bottomSheetHeight: CGFloat = 100
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        mainViewController = MainViewController()
        sheetViewController = SheetViewController()
        sheetViewController.configDelegate = self
    }
}
