//
//  TimeViewDelegate.swift
//  TimeRange
//
//  Created by Nurlan on 2024/04/08.
//

import Foundation

// This delegate class sends data from TimeView to TimeViewController
protocol TimeViewDelegate: NSObject {
    func onTextChanged(_ text: String, sender: TimeView)
}
