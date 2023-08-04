//
//  SelectViewController.swift
//  VerbRegularApp
//
//  Created by Artem Yershov on 29.07.2023.
//

import UIKit
import SnapKit

final class SelectViewController: UITableViewController {
    //MARK: - Properties
    private var dataSource = IrregularVerbs.shared
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select verbs".localized // добавляем название экрана
        view.backgroundColor = .white
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    
    }
    //MARK: - Private methods
    private func isSelectedVerb(verb: Verb) -> Bool {
        dataSource.selectedVerbs.contains { $0.infinitive == verb.infinitive }
    }
}

//MARK: - UITableViewDataSource
extension SelectViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.verbs.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        let verb = dataSource.verbs[indexPath.row]
        cell.configureVerbs(with: verb, isSelected: isSelectedVerb(verb: verb))
        
        return cell
    }
}
//MARK: - UITableViewDelegat
extension SelectViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let verb = dataSource.verbs[indexPath.row] //достаем из массива выбраный глагол
        
        if isSelectedVerb(verb: verb) {
            dataSource.selectedVerbs.removeAll { $0.infinitive == verb.infinitive }
        } else {
            dataSource.selectedVerbs.append(verb)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic) //обновляем информацию о нашей ячейке
    }
}
