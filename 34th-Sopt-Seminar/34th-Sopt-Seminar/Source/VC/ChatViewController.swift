//
//  ChatViewController.swift
//  34th-Sopt-Seminar
//
//  Created by Seonwoo Kim on 4/20/24.
//

import UIKit
import SnapKit
import Then

final class ChatViewController: UIViewController { // -- 1번
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var chatList = ChatModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        register()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func register() {
        tableView.register(
            ChatTableViewCell.self,
            forCellReuseIdentifier: ChatTableViewCell.identifier
        )
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

extension ChatViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count // chatList 배열의 크기를 반환하도록 수정합니다.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            chatList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
}
