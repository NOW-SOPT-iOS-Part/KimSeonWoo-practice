//
//  WelcomeViewController_SnapKit.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 4/6/24.
//

import UIKit
import SnapKit

final class WelcomeViewController_SnapKit: UIViewController {
    var id: String?
    var date: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setLayout()
        bindData()
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton, dateLabel].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        logoImageView.snp.makeConstraints { make in
               make.centerX.equalToSuperview()
               make.top.equalToSuperview().offset(87)
               make.width.height.equalTo(150)
           }
           
           welcomeLabel.snp.makeConstraints { make in
               make.centerX.equalToSuperview()
               make.top.equalTo(logoImageView.snp.bottom).offset(58)
           }
           
           goHomeButton.snp.makeConstraints { make in
               make.left.right.equalToSuperview().inset(20)
               make.top.equalTo(welcomeLabel.snp.bottom).offset(61)
               make.height.equalTo(58)
           }
           
           backToLoginButton.snp.makeConstraints { make in
               make.left.right.equalToSuperview().inset(20)
               make.top.equalTo(goHomeButton.snp.bottom).offset(14)
               make.height.equalTo(58)
           }
    }
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo2")
        
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Pretendard-Medium", size: 18)
        label.textAlignment = .center
        label.text = "hi"
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var goHomeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Pretendard-Normal", size: 18)
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray200
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.gray500, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Normal", size: 18)
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    @objc
    private func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func bindData() {
        if let idText = id {
            self.welcomeLabel.text = "\(idText)님 \n반가워요!"
        } else {
            print("Error: ID가 존재하지 않습니다.")
        }
        
        if let dateText = date {
            self.dateLabel.text = dateText
        } else {
            print("Error: 날짜가 존재하지 않습니다.")
        }
    }
}

