//
//  SecondViewController.swift
//  BottomSheet
//
//  Created by Felix Weiss on 02.09.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

class SecondViewController: BottomSheetContainerViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        mainViewController = MainViewController()
        sheetViewController = MySheetViewController()
    }
}
