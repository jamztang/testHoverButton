//
//  ToolTipGestureRecognizer.swift
//  testHoverButton
//
//  Created by James Tang on 6/2/2020.
//  Copyright © 2020 James Tang. All rights reserved.
//

import UIKit.UIGestureRecognizerSubclass
class ToolTipGestureRecognizer: UIHoverGestureRecognizer {
    private var date: Date?
    private var didBegan: Bool = false
    var delay: TimeInterval = 1

    override var state: UIGestureRecognizer.State {
        set {
            if didBegan == false, date == nil {
                // first touch, mark begin date
                date = Date()
                didBegan = true
                perform(#selector(setBegan), with: self, afterDelay: delay)
            } else if let date = self.date, Date().timeIntervalSince(date) >= delay {
                // after ignore period, always update state
                super.state = newValue
            } else {
                // ignore period, do nothing
            }
        }
        get {
            super.state
        }
    }

    @objc func setBegan() {
        if location(in: view) != .zero {
            // If still within a view, make .began to notify outside
            super.state = .began
        } else {
            // reset if user left the view earlier
            reset()
        }
    }

    override func reset() {
        super.reset()
        date = nil
        didBegan = false
    }
}
