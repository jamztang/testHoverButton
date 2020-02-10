//
//  ViewController.swift
//  testHoverButton
//
//  Created by James Tang on 6/2/2020.
//  Copyright © 2020 James Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trackView: UIView!
    @IBOutlet weak var redTrackingView: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tooltipButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @available(iOS 13.0, *)
    @objc func handleToolTipGesture(_ recognizer: UIHoverGestureRecognizer) {
        let point = recognizer.location(in: self.view)
        if recognizer.state == .began {
            Swift.print("TTT showTooltip at \(point)")
        } else {
            Swift.print("TTT dismiss Tooltip")
        }
    }

}

extension UIGestureRecognizer.State: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .began: return "began"
        case .cancelled: return "cancelled"
        case .possible: return "possible"
        case .changed: return "changed"
        case .ended: return "ended"
        case .failed: return "failed"
        @unknown default:
            return "unknown"
        }
    }
}
