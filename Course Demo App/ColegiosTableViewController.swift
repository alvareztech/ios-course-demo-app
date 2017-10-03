import UIKit

class ColegiosTableViewController: UITableViewController {
    
    var colegios: [Colegio] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let coleEjemplo = Colegio(nombre: "Mi Colegio", departamento: "La Paz", zona: "La Paz", direccion: "z. Sopocachi c. 123", distrito: "ABC", latitud: 0, longitud: 0)
        colegios.append(coleEjemplo)
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
