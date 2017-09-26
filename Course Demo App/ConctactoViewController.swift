import UIKit
import SafariServices

class ConctactoViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Index path: Section: \(indexPath.section) Row: \(indexPath.row)")
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                
                abrirWebsite()
                
            } else if indexPath.row == 1 {
                
            } else if indexPath.row == 2 {
                
            }
            
        } else if indexPath.section == 1 {
            
            if indexPath.row == 0 {
                
            } else if indexPath.row == 1 {
                
            }
            
        }
    }
    
    func abrirWebsite() {
        if let url = URL(string: "https://alvarez.tech") {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
}
