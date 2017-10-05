import Foundation

struct Colegio {
    
    let nombre: String
    let departamento: String
    let zona: String
    let direccion: String
    let distrito: String
    let latitud: Double
    let longitud: Double
    
    init(dictionary: [String: Any]) {
        self.nombre = dictionary["unidad_educativa"] as? String ?? ""
        self.departamento = dictionary["departamento"] as? String ?? ""
        self.zona = dictionary["zona"] as? String ?? ""
        self.direccion = dictionary["direccion"] as? String ?? ""
        self.distrito = dictionary["distrito"] as? String ?? ""
        self.latitud = dictionary["latitud"] as? Double ?? 0
        self.longitud = dictionary["longitud"] as? Double ?? 0
    }

}
