//
//  TestController.swift
//  VerbRegularApp
//
//  Created by Artem Yershov on 01.08.2023.
//

import UIKit
import SnapKit

final class TestController: UIViewController {
    
    //MARK: - GUI properties
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var maineView: UIView = UIView()
    
    private lazy var titleLable: UILabel = {
        let lable = UILabel()
        
        lable.text = "Hello World!"
        lable.font = .boldSystemFont(ofSize: 30)
        lable.textColor = .black
        lable.textAlignment = .center
        
        return lable
    }()
    private lazy var pastLable: UILabel = {
        let lable = UILabel()
        
        lable.text = "Past Simple"
        lable.textColor = .gray
        lable.font = .systemFont(ofSize: 16)
        lable.textAlignment = .left
        
        return lable
    }()
    private lazy var participleLable: UILabel = {
        let lable = UILabel()
        
        lable.text = "Past Participle"
        lable.textColor = .gray
        lable.font = .systemFont(ofSize: 16)
        lable.textAlignment = .left
        
        return lable
    }()
    private lazy var pastField: UITextField = {
        let field = UITextField()
        
        field.borderStyle = .roundedRect
        field.placeholder = "enter second form"
        field.delegate = self
        
        return field
    }()
    private lazy var participleField: UITextField = {
        let field = UITextField()
        
        field.borderStyle = .roundedRect
        field.placeholder = "enter third form"
        field.delegate = self
        
        return field
    }()
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        
        button.layer.cornerRadius = 10
        button.setTitle("Check", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemGray5
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Private methods
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubviews(views: [titleLable, pastLable, pastField, participleLable, participleField, checkButton])
        
        setupConstraints()
    }
    private func setupConstraints() {
        titleLable.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        pastLable.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        pastField.snp.makeConstraints { make in
            make.top.equalTo(pastLable.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        participleLable.snp.makeConstraints { make in
            make.top.equalTo(pastField.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        participleField.snp.makeConstraints { make in
            make.top.equalTo(participleLable.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(participleField.snp.bottom).offset(100)
            make.leading.trailing.equalToSuperview().inset(50)
        }
    }
}
extension TestController: UITextFieldDelegate {
    
}
