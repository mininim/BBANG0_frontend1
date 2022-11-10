//
//  ViewController.swift
//  Bbang0_Final
//
//  Created by 김사랑 on 2022/10/08.
//

import UIKit
import Then
import SnapKit

//class ViewController: UIViewController {
//    
//    lazy var loginBtn = UIButton().then {
//        $0.setTitle("Login", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.addTarget(self, action: #selector(goToGroupZBtnDidTap), for: .touchUpInside)
//    }
//    
//    lazy var registerBtn = UIButton().then {
//        $0.setTitle("Register", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.addTarget(self, action: #selector(goToGroupZBtnDidTap), for: .touchUpInside)
//    }
//    
//    lazy var ericBtn = UIButton().then {
//        $0.setTitle("Eric", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.addTarget(self, action: #selector(goToGroupZBtnDidTap), for: .touchUpInside)
//    }
//    
//    lazy var leahBtn = UIButton().then {
//        $0.setTitle("Leah", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.addTarget(self, action: #selector(goToGroupZBtnDidTap), for: .touchUpInside)
//    }
//    
//    lazy var hwiBtn = UIButton().then {
//        $0.setTitle("Hwi", for: .normal)
//        $0.setTitleColor(.black, for: .normal)
//        $0.addTarget(self, action: #selector(goToGroupZBtnDidTap), for: .touchUpInside)
//    }
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = .systemYellow
//        self.navigationItem.title = "Navi"
//        
//        setUpView()
//        setUpConstraints()
//    }
//    
//    func setUpView() {
//        self.view.addSubview(loginBtn)
//        self.view.addSubview(registerBtn)
//        self.view.addSubview(ericBtn)
//        self.view.addSubview(leahBtn)
//        self.view.addSubview(hwiBtn)
//    }
//    
//    func setUpConstraints() {
//        loginBtn.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(100)
//            make.centerX.equalToSuperview()
//        }
//        
//        registerBtn.snp.makeConstraints { make in
//            make.top.equalTo(loginBtn).offset(70)
//            make.centerX.equalToSuperview()
//        }
//        
//        ericBtn.snp.makeConstraints { make in
//            make.top.equalTo(registerBtn).offset(70)
//            make.centerX.equalToSuperview()
//        }
//        
//        leahBtn.snp.makeConstraints { make in
//            make.top.equalTo(ericBtn).offset(70)
//            make.centerX.equalToSuperview()
//        }
//        
//        hwiBtn.snp.makeConstraints { make in
//            make.top.equalTo(leahBtn).offset(70)
//            make.centerX.equalToSuperview()
//        }
//    }
//    
//    @objc func goToGroupZBtnDidTap(_ sender: UIButton) {
//        let storyboardFile = UIStoryboard(name: "BookProject", bundle: nil)
//                
//        //2. 스토리보드 안에 뷰컨트롤러로 가져옴
//        let viewControllerPick = storyboardFile.instantiateViewController(withIdentifier: "GlassesViewController") as! GlassesViewController
//            
//        //2.5 네비게이션 임베디드
//        let navigationControllerPick = UINavigationController(rootViewController: viewControllerPick)
//                
//        //2.5 present시  화면 전환 방식 설정 (옵션)
//        navigationControllerPick.modalPresentationStyle = .fullScreen
//                
//        //3. 어떤 방식으로 띄워줄건가
//        self.present(, animated: true)
//    }
//
//
//}

