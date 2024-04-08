//
//  ScrollViewController.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 4/6/24.
//

import UIKit
import SnapKit
import Then


final class ScrollViewController: UIViewController {
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private var greenView = UIView()
    private var blueView = UIView()
    private var yellowView = UIView()
    private var purpleView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setLayout()
        setStyle()
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setStyle() {
        scrollView.do {
            $0.backgroundColor = .gray400
        }
        
        greenView.do {
            $0.backgroundColor = .red
        }
        
        blueView.do {
            $0.backgroundColor = .blue
        }
        
        yellowView.do {
            $0.backgroundColor = .yellow
        }
        
        purpleView.do {
            $0.backgroundColor = .purple
        }
    }
    
    private func setLayout() {
        let screenSize = UIScreen.main.bounds.size
        let centerHalf = screenSize.width / 2
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [greenView, blueView, yellowView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.trailing.leading.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.greaterThanOrEqualToSuperview().priority(.low) //
        }
        
        greenView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(337)
            make.width.equalTo(centerHalf)
        }
        
        blueView.snp.makeConstraints { make in
            make.top.trailing.equalTo(contentView)
            make.height.equalTo(337)
            make.width.equalTo(centerHalf)
        }
        
        yellowView.snp.makeConstraints { make in
            make.leading.equalTo(greenView)
            make.top.equalTo(greenView.snp.bottom)
            make.height.equalTo(337)
            make.width.equalTo(centerHalf)
        }
        
        purpleView.snp.makeConstraints { make in
            make.trailing.equalTo(blueView)
            make.top.equalTo(blueView.snp.bottom)
            make.height.equalTo(337)
            make.width.equalTo(centerHalf)
        }
    }
}

