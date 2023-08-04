//
//  TableViewCell.swift
//  VerbRegularApp
//
//  Created by Artem Yershov on 30.07.2023.
//

import UIKit
import SnapKit

final class TableViewCell: UITableViewCell {
    enum State {
        case selected, unselected
        
        var image: UIImage {
            switch self {
            case .selected:
                return UIImage.checkmark
            case .unselected:
                return UIImage(systemName: "circlebadge") ?? UIImage.actions
            }
        }
    }
    
    //MARK: - GUI Variables
    private lazy var checkboxImageView: UIImageView = {
        let view = UIImageView()
        
        view.image = State.unselected.image
        view.contentMode = .center
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .horizontal //horizontal or vertical stack
        view.distribution = .fillEqually //расположение по стэку равномерное
        view.alignment = .center //выравнивание перпендикулярно стэку
        view.spacing = 5 // расстояние между элементами стэка
        
        return view
    }()
    
    private lazy var infinitiveView: UIView = UIView()
    
    private lazy var infinitiveLable: UILabel = {
        let lable = UILabel()
        
        lable.font = .boldSystemFont(ofSize: 16)
        
        return lable
    }()
    
    private lazy var translateLable: UILabel = {
        let lable = UILabel()
        
        lable.font = .systemFont(ofSize: 12)
        lable.textColor = .gray
        
        return lable
    }()
    
    private lazy var pastLable: UILabel = {
        let lable = UILabel()
        
        lable.font = .systemFont(ofSize: 16)
        lable.textAlignment = .center
        
        return lable
    }()
    
    private lazy var participleLable: UILabel = {
        let lable = UILabel()
        
        lable.font = .systemFont(ofSize: 16)
        lable.textAlignment = .center
        
        return lable
    }()
    
    //MARK: - Initializers (метод ниже вызывается что бы вносить туда наши изменения)
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        convigeUI()
    }
    //MARK: - Methods
    func configureVerbs(with verb: Verb, isSelected: Bool) {
        infinitiveLable.text = verb.infinitive
        translateLable.text = verb.translate
        pastLable.text = verb.pastSimple
        participleLable.text = verb.participle
        
        checkboxImageView.image = isSelected ? State.selected.image : State.unselected.image
    }
    
    //MARK: - Private methods
    func convigeUI() {
        selectionStyle = .none // делаем так что бы при нажатии ячейка не подствечивалась никаким цыыетом
        
        infinitiveView.addSubviews(views: [infinitiveLable, translateLable])
        stackView.addArrangedSubviews(views: [infinitiveView, pastLable, participleLable])//тут мы написали extension для UIStackView, что бы иметь возможность сразу же добавлять массив UIView в стэк
        addSubviews(views: [checkboxImageView, stackView])//тут мы написали extension для UIView так что би иметь возможность сразу же добавлять массив UIView
        configeConstraints()
    }
    
    func configeConstraints() {
        checkboxImageView.snp.makeConstraints { make in
            make.height.width.equalTo(20) // задаем высоту и ширину лэйбла
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20) // отступ по левому краю
        }
        infinitiveLable.snp.makeConstraints { make in
            make.center.equalToSuperview() // по центру view
        }
        translateLable.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // по центру view по оси Х
            make.top.equalTo(infinitiveLable.snp.bottom).offset(0) // привязываем верх к низу другого объекта с отступом 0
        }
        infinitiveView.snp.makeConstraints { make in
            make.height.equalTo(69) // высота самого view
        }
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(checkboxImageView.snp.trailing).offset(5) // привязываем левый край стэка к правому краю checkboxImageView с расстоянием 5 пунктов
            make.top.bottom.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
