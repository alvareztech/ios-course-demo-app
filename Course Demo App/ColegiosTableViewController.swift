import UIKit

class ColegiosTableViewController: UITableViewController {
    
    var colegios: [Colegio] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        GobService.obtenerColegios(resourceId: "b5da4242-1c90-47d9-b98f-bde1f35a0764", limit: 20) { (colegios: [Colegio]) in
            print("colegios: \(colegios)")
            self.colegios = colegios
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colegios.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colegioCell", for: indexPath)

        let nombreLabel: UILabel = cell.viewWithTag(1) as! UILabel
        let direccionLabel: UILabel = cell.viewWithTag(2) as! UILabel
        let distritoLabel: UILabel = cell.viewWithTag(3) as! UILabel
        
        let cole = colegios[indexPath.row]
        
        nombreLabel.text = cole.nombre
        direccionLabel.text = cole.direccion
        distritoLabel.text = cole.distrito

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
