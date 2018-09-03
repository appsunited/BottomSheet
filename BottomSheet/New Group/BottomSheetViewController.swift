//
//  BottomSheetViewController.swift
//  BottomSheet
//
//  Created by Felix Weiss on 27.08.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

protocol BottomSheetConfig {
    var bottomSheetHeight: CGFloat { get }
}

class BottomSheetViewController: UITableViewController, BottomSheet {

    var configDelegate: BottomSheetConfig?
    var bottomSheetHeight: CGFloat = 200
    var reuseIdentifier = "bottomSheetCell" // TODO: Extract this to MySheetViewController.
    var bottomSheetDelegate: BottomSheetDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sheetHeight = configDelegate?.bottomSheetHeight {
            bottomSheetHeight = sheetHeight
        }
        
        tableView.register(UINib(nibName: "BottomSheetCell", bundle: Bundle.main), forCellReuseIdentifier: reuseIdentifier)
        tableView.contentInset.top = (UIScreen.main.bounds.height - 20) - bottomSheetHeight
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.decelerationRate = UIScrollViewDecelerationRateFast
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        bottomSheetDelegate?.bottomSheet(self, didScrollTo: tableView.contentOffset)
    }

    // MARK: - Scroll view delegate

    private var scrollViewContentOffsetY: CGFloat = 0

    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollViewContentOffsetY = scrollView.contentOffset.y
    }

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pulledUpOffset: CGFloat = 0
        let pulledDownOffset: CGFloat = -((UIScreen.main.bounds.height - 20) - bottomSheetHeight)

        if (pulledDownOffset...pulledUpOffset).contains(targetContentOffset.pointee.y) {
            if scrollViewContentOffsetY < scrollView.contentOffset.y {
                targetContentOffset.pointee.y = pulledUpOffset
            } else {
                targetContentOffset.pointee.y = pulledDownOffset
            }
        }
    }
}
