// Copyright © 2023 Elasticsearch BV
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.

import Foundation


struct CentralConfigData : Decodable {
    
    public private(set) var recording : Bool = true
    
    enum CodingKeys : String, CodingKey {
        case recording
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            recording = (try values.decode(String.self, forKey: .recording) as NSString).boolValue
        } catch DecodingError.valueNotFound(_, _)  {
            recording = true
        } catch DecodingError.keyNotFound(_, _) {
            recording = true
        }
    }
    
    init() {}
}