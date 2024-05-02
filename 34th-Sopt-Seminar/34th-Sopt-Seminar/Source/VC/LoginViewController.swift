
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 3/30/24.

import UIKit

final class LoginViewController: UIViewController {
    
    private let rootView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
    }
    
    private func setAddTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        rootView.datePickerTextField.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    
    
    @objc
    private func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일 좋은 아침 입니다"
        rootView.datePickerTextField.text = dateFormatter.string(from: sender.date)
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = rootView.idTextField.text
        welcomeViewController.modalPresentationStyle = .fullScreen
        self.present(welcomeViewController, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = rootView.idTextField.text
        welcomeViewController.date = rootView.datePickerTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc
    private func loginButtonDidTap() {
        guard let id = rootView.idTextField.text, !id.isEmpty else {
            showAlert(message: "아이디를 입력해주세요.")
            return
        }
        
        guard let password = rootView.passwordTextField.text, !password.isEmpty else {
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

