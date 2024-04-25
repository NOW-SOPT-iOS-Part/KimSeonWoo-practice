//
//  LoginViewController_SnapKit.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 4/6/24.
//


import UIKit
import SnapKit

final class LoginViewController_SnapKit: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton, datePickerTextField].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
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
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
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
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primaryOrange
        button.layer.cornerRadius = 6
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    
    private let datePickerTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "날짜 선택"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = .gray200
        textField.layer.cornerRadius = 3
        textField.tintColor = .clear
        
        let paddingView = UIView()
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        textField.inputView = datePicker
        
        return textField
    }()
    
    @objc
    private func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일 좋은 아침 입니다"
        datePickerTextField.text = dateFormatter.string(from: sender.date)
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text
        welcomeViewController.modalPresentationStyle = .fullScreen
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text
        welcomeViewController.date = datePickerTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
        guard let id = idTextField.text, !id.isEmpty else {
            showAlert(message: "아이디를 입력해주세요.")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "비밀번호를 입력해주세요.")
            return
        }
        //        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}


