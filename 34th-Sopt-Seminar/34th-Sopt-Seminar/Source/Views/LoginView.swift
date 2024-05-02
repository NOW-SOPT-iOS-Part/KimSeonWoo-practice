//
//  LoginView.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 4/20/24.
//

import UIKit
import SnapKit

final class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton, datePickerTextField].forEach {
            self.addSubview($0)
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = .gray200
        textField.layer.cornerRadius = 3
        textField.tintColor = .gray
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.layer.cornerRadius = 3
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.tintColor = .gray
        textField.backgroundColor = .gray200
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 482, width: 332, height: 58))
        button.backgroundColor = .primaryOrange
        button.layer.cornerRadius = 6
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        return button
    }()
    
    let datePickerTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 395, width: 335, height: 52))
        textField.placeholder = "날짜 선택"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = .gray200
        textField.layer.cornerRadius = 3
        textField.tintColor = .clear
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        textField.inputView = datePicker
        
        return textField
    }()
}
