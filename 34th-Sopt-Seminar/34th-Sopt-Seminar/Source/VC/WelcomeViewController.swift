//
//  WelcomeViewController.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 3/30/24.
//

import UIKit

final class WelcomeViewController: UIViewController {
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
//            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "logo2")
        
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 93, y: 335, width: 190, height: 100))
        label.font = UIFont(name: "Pretendard-Medium", size: 18)
        label.textAlignment = .center
        label.text = "hi"
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "Pretendard-Normal", size: 18)
        button.layer.cornerRadius = 6
        
        return button
    }()
    
    private var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
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
