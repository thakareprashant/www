//
//  ViewController.swift
//  ItuneApiTask
//
//  Created by prashant thakare on 08/04/21.
//

import UIKit
protocol SendData {
    func sendImage(Url:String)
}

class ViewController: UIViewController,UISearchBarDelegate {

    var delegate:SendData?
    var model = [ResultElement]()
    var md:Result?
    //var url:String?
    let instance = Service()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
        // Do any additional setup after loading the view.
       
    }
    @IBOutlet weak var searchBar: UISearchBar!
    func ApiQuery(query:String){
        
        let url = "https://itunes.apple.com/search?term=\(query)"
        
        guard let urlS = URL(string: url) else {return}
        let urlReq = URLRequest(url: urlS)
        
        URLSession.shared.dataTask(with: urlReq) { (data, resp, error) in
            
            guard let jsonData = data else {return}
            do{
                //JSONDecoder().dateDecodingStrategy = .iso8601
                let res = try JSONDecoder().decode(Result.self, from: jsonData)
                print(res.results[0])
                
              
                DispatchQueue.main.async {
                    self.model = res.results
                    self.tableV.reloadData()
                    
                }
                
                
               
                
                
            }
            catch{
                print(error)
            }
        
            
            
        }.resume()
        
    }
    @IBOutlet weak var tableV: UITableView!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        
        if let text = searchBar.text{
            
            ApiQuery(query: text)
        }
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableV.dequeueReusableCell(withIdentifier: "cell") as? ExploreTableViewCell else{
            fatalError("cant create tablev cell")
            
        }
        let md = model[indexPath.row]
        cell.cillectionV.reloadData()
        cell.titleLbl.text = md.artistName
        cell.imageArray = md
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    
    
    
}

