//
//  ViewController.swift
//  TimeRange
//
//  Created by Nurlan on 2024/04/08.
//

import UIKit

struct TimeScreenLayout {
    struct Paddings {
        static let left: CGFloat = 50
        static let right: CGFloat = 50
        static let shiftTop: CGFloat = 100
        static let shiftBottom: CGFloat = 50
    }
}

class TimeRangeViewController: UIViewController {
    typealias Padding = TimeScreenLayout.Paddings
    
    // Elements initialization
    private lazy var startTimeView: TimeView = {
        let view = TimeView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setCaption(with: "Start Time")
        return view
    }()
    
    private lazy var endTimeView: TimeView = {
        let view = TimeView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setCaption(with: "End Time")
        return view
    }()
    
    private lazy var checkTimeView: TimeView = {
        let view = TimeView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setCaption(with: "Check Range")
        return view
    }()
    
    private lazy var runButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Run", for: .normal)
        
        // Event
        button.addTarget(self, action: #selector(onClickRun), for: .touchUpInside)
        
        // layer
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    // Properties
    private var startTime = ""
    private var endTime = ""
    private var checkTime = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setDelegates()
    }

    private func setupView() {
        view.backgroundColor = .white
        
        // Add elements
        view.addSubview(startTimeView)
        view.addSubview(endTimeView)
        view.addSubview(checkTimeView)
        view.addSubview(runButton)
        
        // Set constraints
        NSLayoutConstraint.activate([
            // Start time view
            startTimeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Padding.left),
            startTimeView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -Padding.shiftTop),
            
            // End time view
            endTimeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Padding.right),
            endTimeView.topAnchor.constraint(equalTo: startTimeView.topAnchor),
            
            // Check time view
            checkTimeView.topAnchor.constraint(equalTo: startTimeView.bottomAnchor, constant: Padding.shiftBottom),
            checkTimeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Run button
            runButton.topAnchor.constraint(equalTo: checkTimeView.bottomAnchor, constant: Padding.shiftBottom),
            runButton.widthAnchor.constraint(equalTo: checkTimeView.widthAnchor),
            runButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setDelegates() {
        startTimeView.delegate = self
        endTimeView.delegate = self
        checkTimeView.delegate = self
    }
}

// MARK: - Events
extension TimeRangeViewController {
    @objc private func onClickRun() {
        var isIncluded = false
        
        // Case 1: Start > End
        if startTime > endTime {
            // 14:00 - 12:00
            isIncluded = checkTime >= startTime && checkTime < "24:00" || checkTime < endTime
        }
        // Case 2: Start < End
        // 12:00 - 14:00
        if startTime < endTime {
            isIncluded = checkTime >= startTime && checkTime < endTime
        }
        
        // Case 3: Start = End
        if startTime == endTime {
            isIncluded = true
        }
        
//        print(isIncluded)
    }
}

// MARK: - TimeViewDelegate
extension TimeRangeViewController: TimeViewDelegate {
    func onTextChanged(_ text: String, sender: TimeView) {
        if sender == startTimeView {
            startTime = text
        }
        if sender == endTimeView {
            endTime = text
        }
        if sender == checkTimeView {
            checkTime = text
        }
    }
}
