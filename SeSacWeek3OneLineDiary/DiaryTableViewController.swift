//
//  DiaryTableViewController.swift
//  SeSacWeek3OneLineDiary
//
//  Created by 이상남 on 2023/07/31.
//

import UIKit

class DiaryTableViewController: UITableViewController {

    var list = ["테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1","고래밥2","테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3","테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // xib 로 테이블뷰 셀을 생성할 경우, 테이블뷰에 사용할 셀을 등록해주는 과정이 필요!
        let nib = UINib(nibName: DiaryTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DiaryTableViewCell.identifier)
        
        
        tableView.backgroundColor = .clear
        setBackgroundColor()
        // 자동 높이 설정
        // dynamic Height: 1. automaticDimension, 2. label numberOfLines 3. AutoLayout(여백)
        tableView.rowHeight = UITableView.automaticDimension
        

    }
    
    @IBAction func searchBarButtonItemTapped(_ sender: UIBarButtonItem) {
        
//        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SearchCollectionViewController") as?    SearchCollectionViewController else {  return }
        
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func addBarButtonItemTapped(_ sender: UIBarButtonItem) {
        
        //1. 스토리보드 파일찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. 스토리보드 파일 내 뷰 컨트롤러 찾기
        guard let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as?    AddViewController else {  return }
        //2-1( 옵션) . 네비게이션 컨트롤러가 있는 형태( 제목바) 로 present 하고 싶은 경우
        //nav를 사용한다면, present와 화면 전환 방식도 nav로 수정 해주어야 함!!!
        let nav = UINavigationController(rootViewController: vc)
        //3. 화면 전환 방식 설정
//        vc.modalTransitionStyle = .crossDissolve
        nav.modalPresentationStyle = .fullScreen
        
        //4. 화면 띄우기
        present(nav, animated: true) // modal
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.identifier) as? DiaryTableViewCell else { return UITableViewCell() }
        
        cell.contentLabel.text = list[indexPath.row]
        cell.contentLabel.numberOfLines = 0
        cell.backgroundColor = .clear
        return cell
        
    }
    
    
    //1. system delete
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //2. commit
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        list.remove(at: indexPath.row)
        
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //1. 스토리보드 파일찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. 스토리보드 파일 내 뷰 컨트롤러 찾기
        guard let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {  return }
        //3. 화면 전환 방식 설정
        // 값 넘기기 2. vc가 가지고 있는 프로퍼티에 데이터 추가
        vc.labelString = list[indexPath.row]
        vc.modalTransitionStyle = .crossDissolve
        //4. 화면 띄우기
//        present(vc, animated: true) // modal
        // 네비게이션 컨트롤러 푸쉬
        // 인터페이스 빌더에 네비게이션 컨트롤러가 임베드 되어 있어야만 push 가 동작합니다.!
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
   
    // 커스텀
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        
        let pin = UIContextualAction(style: .normal, title: "") { _,_,_ in
            print("pin")
            //UIContextualAction  사용법 더 알아보기
            //init(style: UIContextualAction.Style, title: String?, handler: @escaping UIContextualAction.Handler)
            //typealias Handler = (UIContextualAction, UIView, @escaping (Bool) -> Void) -> Void
        }
        pin.image = UIImage(systemName: "pin.fill")
        pin.backgroundColor = .systemGray2
        
        let bell = UIContextualAction(style: .normal, title: "") { _,_,_ in
            print("bell")
        }
        bell.image = UIImage(systemName: "bell.fill")
        bell.backgroundColor = .systemGray3
        
        let star = UIContextualAction(style: .normal, title: "") { _,_,_ in
            print("star")
        }
        star.image = UIImage(systemName: "star.fill")
        star.backgroundColor = .systemGray4
        
        return UISwipeActionsConfiguration(actions: [star,bell,pin])
    }
    
   

}
