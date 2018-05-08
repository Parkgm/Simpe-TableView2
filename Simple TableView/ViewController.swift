//
//  ViewController.swift
//  Simple TableView
//
//  Created by 김종현 on 2018. 4. 30..
//  Copyright © 2018년 김종현. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    var animals = ["Cow", "Pig", "Dog", "Rabbit", "Bird"]
    var country = ["KOR", "USA", "Japan", "Africa", "China"]
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // UIViewController와 Delegate 연결
        myTableView.delegate = self
        myTableView.dataSource = self
    
    }
    
    // UITableViewDataSoure
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "\(section) Setction Header"
        } else {
            return "\(section) Section Header"
        }
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "\(section) Section Footer"
        } else {
            return "\(section) Section Footer"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Cell"
        let cell = myTableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if indexPath.section == 0 {
            let myImage = UIImage(named:"cat.png")
            cell.imageView?.image = myImage
        } else {
            let myImage = UIImage(named:"monkey.jpeg")
            cell.imageView?.image = myImage
        }
        
        // cell에 image 넣기
        
        
        // cell에 text 넣기
        cell.textLabel?.text = animals[indexPath.row]
        
        // cell에 detailText 넣기
        cell.detailTextLabel?.text = String(indexPath.row)
        
        return cell
    }
    
    // cell을 selcet 했을때
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mySection = indexPath.section
        let myRow = indexPath.row
        
        let myAnimal = animals[indexPath.row]
        
        print("I selected \(mySection) Section \(myRow) Row")
        print(myAnimal)
        
        let alert = UIAlertController(title: "동물농장", message: myAnimal, preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "확인", style: .default) {
            (action:UIAlertAction) -> Void in
            //alertController 생성
            let myAlert2 = UIAlertController(title: "선택한것", message: "", preferredStyle: .alert)
            
            let okAction2 = UIAlertAction(title: "Section \(mySection) Row \(myRow)", style: .default , handler: nil)
            
            let cancelAction2 = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            
            
            myAlert2.addAction(okAction2)
            myAlert2.addAction(cancelAction2)
//            myAlert2.addAction(deleteAction2)
            
            self.present(myAlert2, animated: true, completion: nil)
            
            
        }
            
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    //cell 의 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        count = count + 1
        print(count)
        return 100.0
    }
}


