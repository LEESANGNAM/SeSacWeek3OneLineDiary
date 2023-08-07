//
//  TimeLineViewController.swift
//  SeSacWeek3OneLineDiary
//
//  Created by 이상남 on 2023/08/02.
//

import UIKit

class TimeLineViewController: UIViewController {

    @IBOutlet weak var todayCollectionView: UICollectionView!
    
    @IBOutlet weak var bestCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todayCollectionView.dataSource = self
        todayCollectionView.delegate = self
        
        bestCollectionView.dataSource = self
        bestCollectionView.delegate = self
        
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        todayCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        bestCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        configureCollectionViewLayout()
        configureBestCollectionViewLayout()
    }



}
/*
 1. 프로토콜 (ex. 부하직원)
 2. 컬렉션뷰와 부하직원을 연결 : delegate = self (타입으로서 프로토콜 사용)
 3. 컬렉션뷰 아웃렛
 */
extension TimeLineViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionView == todayCollectionView ? 3 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        if collectionView == todayCollectionView {
            cell.contentsLabel.text = "Today : \(indexPath.item)"
            cell.backgroundColor = .gray
        }else {
            cell.contentsLabel.text = "best : \(indexPath.item)"
            cell.backgroundColor = [.blue,.red,.yellow,.orange].randomElement()
        }
        
        return cell
    }
    
    func configureCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        todayCollectionView.collectionViewLayout = layout
    }
    
    func configureBestCollectionViewLayout(){
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        bestCollectionView.isPagingEnabled = true // 페이지효과 devicewidth
        bestCollectionView.collectionViewLayout = layout
        
    }
    
}
