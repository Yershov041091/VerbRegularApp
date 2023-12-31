//
//  TraineViewController.swift
//  VerbRegularApp
//
//  Created by Artem Yershov on 29.07.2023.
//

import UIKit
import SnapKit

final class TraineViewController: UIViewController {
    //MARK: - GUI Properties
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    private lazy var contentView: UIView = UIView()
    
    private lazy var infinitiveLabel: UILabel = {
        let label = UILabel()
        
        label.text = currnetVerb?.infinitive.uppercased()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .black
        label.textAlignment = .center
        
        return label
    }()
    private lazy var pastSimpleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Past Simple"
        
        return label
    }()
    private lazy var participleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Past Participle"
        
        return label
    }()
    
    private lazy var pastTextField: UITextField = {
        let field = UITextField()
        
        field.borderStyle = .roundedRect
        field.delegate = self
        
        return field
    }()
    private lazy var participleTextField: UITextField = {
        let field = UITextField()
        
        field.borderStyle = .roundedRect
        field.delegate = self
        
        return field
    }()
    private lazy var checkButton: UIButton = {
       let button = UIButton()
        
        button.setTitle("Check".localized, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray5
        button.addTarget(self, action: #selector(checkAction), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Properties
    
    private let edgeInsets = 30
    private let dataSource = IrregularVerbs.shared.selectedVerbs
    private var currnetVerb: Verb? {
        guard dataSource.count > count else { return nil }
        return dataSource[count]
    }
    private var count = 0 {
        didSet {
            infinitiveLabel.text = currnetVerb?.infinitive
            pastTextField.text = ""
            participleTextField.text = ""
        }
    }//
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Train verbs".localized // добавляем название экрана

        setupUI()
        hideKeyboardWhenTappedAround()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        registerForNotification()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        unregisterForKeyboardNotification()
    }
    //MARK: - Private methods
    @objc private func checkAction() {
        if checkAnswer() {
            count += 1
        } else {
            checkButton.backgroundColor = .red
            checkButton.setTitle("Try againe", for: .normal)
        }
    }
    private func checkAnswer() -> Bool {
        pastTextField.text?.lowercased() == currnetVerb?.pastSimple.lowercased() &&
        participleTextField.text?.lowercased() == currnetVerb?.participle.lowercased()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(views: [infinitiveLabel, pastSimpleLabel, participleLabel, pastTextField, participleTextField, checkButton])
        
        setupConstraints()
    }
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview() //привязали все края к супервью
        }
        contentView.snp.makeConstraints { make in
            make.size.edges.equalToSuperview() //размер всех сторон равен супервью (scroll view)
        }
        infinitiveLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(130)
            make.leading.trailing.equalToSuperview().inset(edgeInsets)
        }
        pastSimpleLabel.snp.makeConstraints { make in
            make.top.equalTo(infinitiveLabel.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(edgeInsets)
        }
        pastTextField.snp.makeConstraints { make in
            make.top.equalTo(pastSimpleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(edgeInsets)
        }
        participleLabel.snp.makeConstraints { make in
            make.top.equalTo(pastTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(edgeInsets)
        }
        participleTextField.snp.makeConstraints { make in
            make.top.equalTo(participleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(edgeInsets)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(participleTextField.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(edgeInsets)
        }
    }
}
extension TraineViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if pastTextField.isFirstResponder {
            participleTextField.becomeFirstResponder()
        } else {
            scrollView.endEditing(true)
        }
        return true
    }
}

//MARK: - Keyboard events

extension TraineViewController {
    func registerForNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWiilShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func unregisterForKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
   @objc private func keyboardWiilShow(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
       
       scrollView.contentInset.bottom = frame.height + 30
    }
    @objc private func keyboardWillHide() {
        scrollView.contentInset.bottom = .zero - 30
    }
    func hideKeyboardWhenTappedAround() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        
        scrollView.addGestureRecognizer(recognizer)
    }
    @objc private func hideKeyboard() {
        scrollView.endEditing(true)
    }
}
