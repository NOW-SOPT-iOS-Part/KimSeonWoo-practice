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
    private var tealView = UIView()
    private var grayView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setLayout()
        setStyle()
    }
    
    private func setStyle() {
        self.navigationController?.isNavigationBarHidden = true
        
        scrollView.do {
            $0.backgroundColor = .green
            $0.contentInsetAdjustmentBehavior = .never
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
        
        tealView.do {
            $0.backgroundColor = .systemTeal
        }
        
        grayView.do {
            $0.backgroundColor = .gray
        }
    }
    
    private func setLayout() {
        let screenSize = UIScreen.main.bounds.size
        let centerHalf = screenSize.width / 2
        let contentSize = screenSize.height / 1.5
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [greenView, blueView, yellowView, purpleView, grayView, tealView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
            $0.height.equalTo(contentSize * 3)
        }
        
        greenView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(contentSize)
            make.width.equalTo(centerHalf)
        }
        
        blueView.snp.makeConstraints { make in
            make.top.trailing.equalTo(contentView)
            make.height.equalTo(contentSize)
            make.width.equalTo(centerHalf)
        }
        
        yellowView.snp.makeConstraints { make in
            make.leading.equalTo(greenView)
            make.top.equalTo(greenView.snp.bottom)
            make.height.equalTo(contentSize)
            make.width.equalTo(centerHalf)
        }
        
        purpleView.snp.makeConstraints { make in
            make.trailing.equalTo(blueView)
            make.top.equalTo(blueView.snp.bottom)
            make.height.equalTo(contentSize)
            make.width.equalTo(centerHalf)
        }
        
        tealView.snp.makeConstraints { make in
            make.trailing.equalTo(yellowView)
            make.top.equalTo(yellowView.snp.bottom)
            make.height.equalTo(contentSize)
            make.width.equalTo(centerHalf)
        }
        
        grayView.snp.makeConstraints { make in
            make.trailing.equalTo(purpleView)
            make.top.equalTo(purpleView.snp.bottom)
            make.height.equalTo(contentSize)
            make.width.equalTo(centerHalf)
        }
    }
}

