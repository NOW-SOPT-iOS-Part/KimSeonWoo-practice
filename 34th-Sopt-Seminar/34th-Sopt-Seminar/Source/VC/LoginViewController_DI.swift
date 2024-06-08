//
//  LoginViewController_DI.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 5/25/24.
//

import UIKit
import SnapKit


import UIKit

protocol LoginViewModelType {
    var isValid: ObservablePattern<Bool> { get }
    var errMessage: ObservablePattern<String> { get }
    
    func checkValid(id: String?, password: String?)
}

final class LoginViewModel_DI: LoginViewModelType {
    var isValid: ObservablePattern<Bool> = ObservablePattern<Bool>.init(false)
    var errMessage: ObservablePattern<String> = ObservablePattern<String>.init(nil)
    
    func checkValid(id: String?, password: String?) {
        guard let id else {
            errMessage.value = "아이디가 비어있습니다."
            return
        }
        guard let password else {
            errMessage.value = "비밀번호가 비어있습니다."
            return
        }
        
        let idRegEx = "[A-Za-z0-9]{5,13}"
        let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
        
        guard let _ = id.range(of: idRegEx, options: .regularExpression) else {
            errMessage.value = "아이디가 유효하지 않습니다."
            return
        }
        
        guard let _ = password.range(of: pwRegEx, options: .regularExpression) else {
            errMessage.value = "비밀번호가 유효하지 않습니다."
            return
        }
        isValid.value = true
        
    }
}


import UIKit
import SnapKit

final class LoginViewController_DI: UIViewController {
    
    private let rootView = LoginView()
    private let viewModel: LoginViewModelType
    
    override func loadView() {
        self.view = rootView
    }
    
    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setTarget()
        bindViewModel()
    }
    
    private func setTarget() {
        rootView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    private func bindViewModel() {
        viewModel.isValid.bind { [weak self] isValid in
            guard let isValid else { return }
            if isValid { self?.pushToWelcomeVC() }
        }
        
        viewModel.errMessage.bind { [weak self] err in
            guard let err else { return }
            self?.showToast(err)
        }
    }
    
    
    @objc private func loginButtonDidTap() {
        viewModel.checkValid(
            id: rootView.idTextField.text,
            password: rootView.passwordTextField.text
        )
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func showToast(_ message: String,
                   bottomInset: CGFloat = 86
    ) {
        guard let view else { return }
        Toast().show(message: message,
                     view: view,
                     bottomInset: bottomInset
        )
    }
}



import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(from input: Input, disposeBag: RxSwift.DisposeBag) -> Output
}

//
//  LoginViewModel_Rx.swift
//  34th-Sopt-Seminar
//
//  Created by 류희재 on 5/19/24.
//

import RxSwift
import RxRelay

final class LoginViewModel_Rx: ViewModelType {

    private var idText: String?
    private var passwordText: String?
    
    struct Input {
        let idTextFieldDidChangeEvent: Observable<String?>
        let passwordTextFieldDidChangeEvent: Observable<String?>
        let loginButtonDidTapEvent: Observable<Void>
    }
    
    struct Output {
        var isValid = PublishRelay<Void>()
        var errMessage = PublishRelay<String>()
    }
    
    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        
        input.idTextFieldDidChangeEvent.subscribe(onNext: { [weak self] id in
            self?.idText = id
        }).disposed(by: disposeBag)
        
        input.passwordTextFieldDidChangeEvent.subscribe(onNext: { [weak self] password in
            self?.passwordText = password
        }).disposed(by: disposeBag)
        
        input.loginButtonDidTapEvent.subscribe(onNext: { [weak self] _ in
            guard let id = self?.idText else {
                output.errMessage.accept("아이디가 비어있습니다.")
                return
            }
            guard let password = self?.passwordText else {
                output.errMessage.accept("비밀번호가 비어있습니다.")
                return
            }
            
            let idRegEx = "[A-Za-z0-9]{5,13}"
            let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
            
            guard let _ = id.range(of: idRegEx, options: .regularExpression) else {
                output.errMessage.accept("아이디가 유효하지 않습니다.")
                return
            }
            
            guard let _ = password.range(of: pwRegEx, options: .regularExpression) else {
                output.errMessage.accept("비밀번호가 유효하지 않습니다.")
                return
            }
            output.isValid.accept(Void())
        }).disposed(by: disposeBag)
        
        return output
    }
}




//
//  LoginViewModel_Rx.swift
//  34th-Sopt-Seminar
//
//  Created by 류희재 on 5/19/24.
//

//import RxSwift
//import RxRelay
//
//final class LoginViewModel_Rx: ViewModelType {
//
//    private var idText: String?
//    private var passwordText: String?
//    
//    struct Input {
//        let idTextFieldDidChangeEvent: Observable<String?>
//        let passwordTextFieldDidChangeEvent: Observable<String?>
//        let loginButtonDidTapEvent: Observable<Void>
//    }
//    
//    struct Output {
//        var isValid = PublishRelay<Void>()
//        var errMessage = PublishRelay<String>()
//    }
//    
//    func transform(from input: Input, disposeBag: DisposeBag) -> Output {
//        let output = Output()
//        
//        input.idTextFieldDidChangeEvent.subscribe(onNext: { [weak self] id in
//            self?.idText = id
//        }).disposed(by: disposeBag)
//        
//        input.passwordTextFieldDidChangeEvent.subscribe(onNext: { [weak self] password in
//            self?.passwordText = password
//        }).disposed(by: disposeBag)
//        
//        input.loginButtonDidTapEvent.subscribe(onNext: { [weak self] _ in
//            guard let id = self?.idText else {
//                output.errMessage.accept("아이디가 비어있습니다.")
//                return
//            }
//            guard let password = self?.passwordText else {
//                output.errMessage.accept("비밀번호가 비어있습니다.")
//                return
//            }
//            
//            let idRegEx = "[A-Za-z0-9]{5,13}"
//            let pwRegEx = "[A-Za-z0-9!_@$%^&+=]{8,20}"
//            
//            guard let _ = id.range(of: idRegEx, options: .regularExpression) else {
//                output.errMessage.accept("아이디가 유효하지 않습니다.")
//                return
//            }
//            
//            guard let _ = password.range(of: pwRegEx, options: .regularExpression) else {
//                output.errMessage.accept("비밀번호가 유효하지 않습니다.")
//                return
//            }
//            output.isValid.accept(Void())
//        }).disposed(by: disposeBag)
//        
//        return output
//    }
//}

import UIKit
import SnapKit

import RxSwift
import RxCocoa

final class LoginViewController_Rx: UIViewController {
    
    private let rootView = LoginView()
    private let viewModel: LoginViewModel_Rx
    
    private let disposeBag = DisposeBag()
    
    override func loadView() {
        self.view = rootView
    }
    
    init(viewModel: LoginViewModel_Rx) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        bindViewModel()
    }
    
    private func bindViewModel() {
        let input = LoginViewModel_Rx.Input(
            idTextFieldDidChangeEvent: rootView.idTextField.rx.text.asObservable(),
            passwordTextFieldDidChangeEvent: rootView.passwordTextField.rx.text.asObservable(),
            loginButtonDidTapEvent: rootView.loginButton.rx.tap.asObservable()
        )
        
        let output = viewModel.transform(from: input, disposeBag: disposeBag)
        
        output.isValid.subscribe(onNext: { _ in
            print(#function)
            self.pushToWelcomeVC()
        }).disposed(by: disposeBag)
        
        output.errMessage.subscribe(onNext: { errMessage in
            self.showToast(errMessage)
        }).disposed(by: disposeBag)
    }
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func showToast(_ message: String,
                   bottomInset: CGFloat = 86
    ) {
        guard let view else { return }
        Toast().show(message: message,
                     view: view,
                     bottomInset: bottomInset
        )
    }
}
import UIKit

import SnapKit


final class Toast: UIView {
    
    func show(
        message: String,
        view: UIView,
        bottomInset: CGFloat)
    {
        let toastLabel = UILabel()
        
        self.backgroundColor = .black
        self.alpha = 1
        self.isUserInteractionEnabled = false
        
        
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        toastLabel.sizeToFit()
    
        
        view.addSubview(self)
        self.addSubview(toastLabel)
        
        
        self.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
        }
        
        toastLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.verticalEdges.equalToSuperview().inset(12)
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 1.8, options: .curveEaseOut, animations: {
                self.alpha = 0.0
            }, completion: {_ in
                self.removeFromSuperview()
            })
        })
    }
    
    func show(message: String,
              view: UIView,
              topInset: CGFloat) {
        let toastLabel = UILabel()
        
        self.backgroundColor = .black
        self.alpha = 1
        self.isUserInteractionEnabled = false
        
        
        toastLabel.textColor = .white
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.clipsToBounds = true
        toastLabel.numberOfLines = 0
        toastLabel.sizeToFit()
    
        
        view.addSubview(self)
        self.addSubview(toastLabel)
    
        
        self.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
        }
        
        toastLabel.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.verticalEdges.equalToSuperview().inset(12)
        }
        
        
        UIView.animate(withDuration: 0.6, delay: 0.0, options: .curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 1.8, options: .curveEaseOut, animations: {
                self.alpha = 0.0
            }, completion: {_ in
                self.removeFromSuperview()
            })
        })
    }
    


}

class ObservablePattern<T> { // --- a

    var value: T? { // --- b
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
       
    private var listener: ((T?) -> Void)? // --- c
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)    // 생략 가능, 여기선 시작되는 순간부터 초기값을 갖고 동작하기 위해 사용
        self.listener = listener
    }
}
