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
                date = Date()
                didBegan = true
                perform(#selector(setBegan), with: self, afterDelay: delay)
            } else if let date = self.date, Date().timeIntervalSince(date) >= delay {
                setState(newValue)
            } else if state == .ended {
                setState(newValue)
            }
        }
        get {
            super.state
        }
    }

    @objc func setBegan() {
        super.state = .began
    }

    func setState(_ state: UIGestureRecognizer.State) {
        if state == .ended {
            date = nil
            didBegan = false
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(setBegan), object: nil)
            super.state = state
        } else if didBegan {
            super.state = state
        }
    }
}
