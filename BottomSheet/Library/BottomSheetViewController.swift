//
//  BottomSheetViewController.swift
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

class BottomSheetViewController: UIViewController, BottomSheetDelegate {
    
    var mainViewController: UIViewController!
    var bottomSheetViewController: BottomSheetContentViewController!
    private lazy var bottomSheetContainerView = BottomSheetContainerView(mainView: mainViewController.view, sheetView: bottomSheetViewController.view, backgroundView: bottomSheetViewController.background)
    
    override func loadView() {
        view = bottomSheetContainerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(mainViewController)
        addChild(bottomSheetViewController)
        
        bottomSheetViewController.bottomSheetDelegate = self
        
        mainViewController.didMove(toParent: self)
        bottomSheetViewController.didMove(toParent: self)
    }
    
    func bottomSheet(_ bottomSheet: BottomSheet, didScrollTo contentOffset: CGPoint) {
        bottomSheetContainerView.topDistance = max(0, -contentOffset.y)
    }
}
