//
//  BottomSheetContainerViewController.swift
//  BottomSheet
//
//  Created by Felix Weiss on 27.08.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

protocol BottomSheetDelegate: AnyObject {
    func bottomSheet(_ bottomSheet: BottomSheet, didScrollTo contentOffset: CGPoint)
}

protocol BottomSheet: AnyObject {
    var bottomSheetDelegate: BottomSheetDelegate? { get set }
}

class BottomSheetContainerViewController: UIViewController, BottomSheetDelegate {
    
    var mainViewController: UIViewController!
    var sheetViewController: BottomSheetViewController!
    private lazy var bottomSheetContainerView = BottomSheetContainerView(mainView: mainViewController.view, sheetView: sheetViewController.view)
    
    override func loadView() {
        view = bottomSheetContainerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(mainViewController)
        addChildViewController(sheetViewController)
        
        sheetViewController.bottomSheetDelegate = self
        
        mainViewController.didMove(toParentViewController: self)
        sheetViewController.didMove(toParentViewController: self)
    }
    
    func bottomSheet(_ bottomSheet: BottomSheet, didScrollTo contentOffset: CGPoint) {
        bottomSheetContainerView.topDistance = max(0, -contentOffset.y)
    }
}
