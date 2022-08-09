import Foundation
import SwiftUI

class LiftStore: ObservableObject {
    @Published var lifts: [Lift] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("lifts.data")
    }
    
    static func load(completion: @escaping(Result<[Lift], Error>)->Void){
        DispatchQueue.global(qos: .background).async {
            do{
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else{
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let lift = try JSONDecoder().decode([Lift].self,from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(lift))
                }
            }catch{
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    static func save(lifts: [Lift], completion: @escaping (Result<Int, Error>)->Void){
        DispatchQueue.global(qos: .background).async {
            do{
                let data = try JSONEncoder().encode(lifts)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(lifts.count))
                }
            }catch{
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
