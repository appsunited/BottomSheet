//
//  MainViewController.swift
//  BottomSheet
//
//  Created by Felix Weiss on 27.08.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

class MainViewController: BottomSheetContainerViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        mainViewController = SecondViewController()
        sheetViewController = MySheetViewController()
    }
}
