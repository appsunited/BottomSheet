//
//  BottomSheetContentViewController.swift
//  BottomSheet
//
//  Created by Felix Weiss on 27.08.18.
//  Copyright © 2018 appsunited. All rights reserved.
//

import UIKit

class BottomSheetContentViewController: UITableViewController, BottomSheet {

    var bottomSheetDelegate: BottomSheetDelegate?
    var height: CGFloat!
    var cellId: String!
    var background: UIView!
    var isSnapping: Bool!
    
    init(height: CGFloat = 200, cellId: String = "BottomSheetCell", background: UIView = BottomSheetBackgroundView(), isSnapping: Bool = true) {
        super.init(style: UITableViewStyle.plain)
        self.height = height
        self.cellId = cellId
        self.background = background
        self.isSnapping = isSnapping
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "BottomSheetCell", bundle: Bundle.main), forCellReuseIdentifier: cellId)
        tableView.contentInset.top = (UIScreen.main.bounds.height - 20) - height
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
        let pulledDownOffset: CGFloat = -((UIScreen.main.bounds.height - 20) - height)

        if isSnapping && (pulledDownOffset...pulledUpOffset).contains(targetContentOffset.pointee.y) {
            if scrollViewContentOffsetY < scrollView.contentOffset.y {
                targetContentOffset.pointee.y = pulledUpOffset
            } else {
                targetContentOffset.pointee.y = pulledDownOffset
            }
        }
    }
}
