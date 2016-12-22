//
//  ViewController.swift
//  TableViewDemo
//
//  Created by TranTPhuong on 12/21/16.
//  Copyright © 2016 Trunky Foundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let wordArr:Array<Array<String>> = [["Saigon","Hanoi"],["Danang","Haiphong"], ["Nhatrang", "Cantho"]]
    let imgArr:Array<Array<String>> = [["1","2"],["3","4"],["5","6"]]
    let sectionArr:Array<String> = ["1", "2", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // nhuoc diem, neu la dung du lieu tai ve, thi moi lan scroll man hinh, giai phong cell, ton du lieu tai
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lblName.text = wordArr[indexPath.section][indexPath.row]
        cell.imgView.image = UIImage(named: imgArr[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(wordArr[indexPath.row])
        let manhinh2:ManHinh2VC = storyboard?.instantiateViewController(withIdentifier: "manhinh2") as! ManHinh2VC
        manhinh2.name = wordArr[indexPath.section][indexPath.row]
        manhinh2.imageName = imgArr[indexPath.section][indexPath.row]
        self.navigationController?.pushViewController(manhinh2, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return wordArr.count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section"
//    }
    


}


