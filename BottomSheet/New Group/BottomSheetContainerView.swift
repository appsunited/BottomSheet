//
//  BottomSheetContainerView.swift
//  BottomSheet
//
//  Created by Felix Weiss on 27.08.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

class BottomSheetContainerView: UIView {
    
    private let mainView: UIView
    private let sheetView: UIView
    private let sheetBackground = BottomSheetBackgroundView()
    private var sheetBackgroundTopConstraint: NSLayoutConstraint? = nil
    
    init(mainView: UIView, sheetView: UIView) {
        self.mainView = mainView
        self.sheetView = sheetView
        
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    var topDistance: CGFloat = 0 {
        didSet {
            sheetBackgroundTopConstraint?.constant = topDistance
        }
    }
    
    private func setupViews() {
        // The main view fills the view completely
        addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.leftAnchor.constraint(equalTo: leftAnchor),
            mainView.rightAnchor.constraint(equalTo: rightAnchor),
            mainView.topAnchor.constraint(equalTo: topAnchor),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // The sheet background
        addSubview(sheetBackground)
        sheetBackground.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = sheetBackground.topAnchor.constraint(equalTo: topAnchor)
        NSLayoutConstraint.activate([
            topConstraint,
            sheetBackground.heightAnchor.constraint(equalTo: heightAnchor),
            sheetBackground.leftAnchor.constraint(equalTo: leftAnchor),
            sheetBackground.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        sheetBackgroundTopConstraint = topConstraint
        
        // The sheet table view goes all the way up to the status bar
        addSubview(sheetView)
        sheetView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sheetView.leftAnchor.constraint(equalTo: leftAnchor),
            sheetView.rightAnchor.constraint(equalTo: rightAnchor),
            sheetView.topAnchor.constraint(equalTo: topAnchor),
            sheetView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: - UIView overrides
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if sheetBackground.bounds.contains(sheetBackground.convert(point, from: self)) {
            return sheetView.hitTest(sheetView.convert(point, from: self), with: event)
        }
        return mainView.hitTest(mainView.convert(point, from: self), with: event)
    }
}
