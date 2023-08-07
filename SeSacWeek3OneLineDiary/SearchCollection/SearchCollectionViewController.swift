//
//  SearchCollectionViewController.swift
//  SeSacWeek3OneLineDiary
//
//  Created by 이상남 on 2023/07/31.
//

import UIKit


class SearchCollectionViewController: UICollectionViewController{
    
    let list = ["iOS","ipad","android","apple","watch","사과","사자","호랑이"]
    var searchList: [String] = []
    
    let searchBar = UISearchBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
        
        self.navigationController?.navigationBar.topItem?.title = ""
        
        
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        setCollectionViewLayout()
        
    }
    
    
    
    
    func setCollectionViewLayout(){
        //cell estimated size non으로 인터페이스 빌더에서 설정 할 것!
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 5)
        let itemSize = width / 4
        
        
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        //컬렉션뷰 inset
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        // 최소 간격
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        collectionView.collectionViewLayout = layout
        
        
    }
    

    // 1. 셀의 갯수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchList.count
    }
    
    //2. 셀의 내용
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        cell.backgroundColor = .blue
        cell.contentsLabel.text = searchList[indexPath.row]
        
        
        return cell
    }
    
}


extension SearchCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("====")
        searchList.removeAll()
        for i in list {
            if i.contains(searchBar.text!){
                searchList.append(i)
            }
        }
        collectionView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        searchBar.text = ""
        collectionView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchList.removeAll()
        for i in list {
            if i.contains(searchBar.text!){
                searchList.append(i)
            }
        }
        collectionView.reloadData()
    }
}
