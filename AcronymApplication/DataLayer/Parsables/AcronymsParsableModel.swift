
import Foundation
struct AcronymsParsableModel {
    let sf : String?
    var lfs : [LongForm] = []
}
extension AcronymsParsableModel : Parsable {
    enum CodingKeys: String, CodingKey {
        case sf
        case lfs
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sf = try values.decodeIfPresent(String.self, forKey: .sf)
        lfs = try values.decode([LongForm].self, forKey: .lfs)
    }
}
struct LongForm {
    let lf : String?
}
extension LongForm : Parsable {
    enum CodingKeys: String, CodingKey {
        case lf = "lf"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lf = try values.decodeIfPresent(String.self, forKey: .lf)
    }
}
