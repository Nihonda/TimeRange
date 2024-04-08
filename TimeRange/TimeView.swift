//
//  TimeView.swift
//  TimeRange
//
//  Created by Nurlan on 2024/04/08.
//

import UIKit

struct TimeViewLayout {
    static let LABEL_WIDTH: CGFloat         = 100
    static let LABEL_HEIGHT: CGFloat        = 25
    static let TEXTFIELD_HEIGHT: CGFloat    = 40
}

class TimeView: UIView {
    lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        if #available(iOS 13.4, *) {
            picker.preferredDatePickerStyle = .wheels
        }
        return picker
    }()
    
    lazy var timeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.inputView = timePicker
        
        textField.textAlignment = .center
        
        // borders
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.darkGray.cgColor
        textField.layer.cornerRadius = 5
        
        // example
//        textField.text = "22:50"
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(captionLabel)
        addSubview(timeTextField)
        setupLayout()
    }
    
    // MARK: - Add constraints
    private func setupLayout() {
        // Set Caption constraints
        NSLayoutConstraint.activate([
            // pin caption to top, left and right
            captionLabel.topAnchor.constraint(equalTo: topAnchor),
            captionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            captionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            captionLabel.widthAnchor.constraint(equalToConstant: TimeViewLayout.LABEL_WIDTH),
            captionLabel.heightAnchor.constraint(equalToConstant: TimeViewLayout.LABEL_HEIGHT)
        ])
        
        // Set TextField constraints
        NSLayoutConstraint.activate([
            // pin top to Caption label bottom
            timeTextField.topAnchor.constraint(equalTo: captionLabel.bottomAnchor),
            timeTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            timeTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            timeTextField.heightAnchor.constraint(equalToConstant: TimeViewLayout.TEXTFIELD_HEIGHT),
            
            // pin text field to bottom
            timeTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
