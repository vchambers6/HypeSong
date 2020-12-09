//
//  Genre.swift
//  HypeSong
//
//  Created by Vanessa Chambers on 11/15/20.
//  Copyright © 2020 Vanessa Chambers. All rights reserved.
//

import UIKit

class Genre {
    var title: String
    var featuredImage: UIImage
    var seedArtists: [Int: Set<String>]
    var seedTracks: [Int: Set<String>]
    
    init(title: String,  featuredImage: UIImage, seedArtists: [Int:Set<String>], seedTracks: [Int: Set<String>]) {
        self.title = title
        self.featuredImage = featuredImage
        self.seedArtists = seedArtists
        self.seedTracks = seedTracks
    }
    
    static func fetchGenres() -> [Genre] {
        return [
            Genre(title: "alternative", featuredImage: UIImage(named: "alternative")!,
              seedArtists: [
                1: Set(["1QAJqy2dA3ihHBFIHRphZj", "7MSUfLeTdDEoZiJPDSBXgi"]),
                2: Set(["6nB0iY1cjSY1KyhYyuIIKH", "3ZXXJ9nO1Dn9B0AJ25eAQY"]),
                3: Set(["3VwKSHAfgzV1DOHV0aANCI", "55EarwWraRQY9diMo9Oeul"]),
                4: Set(["4GmataFSHOSQWxuuUX57Bh", "73rPcaYEhBd0UuVZBqqyQJ"]),
                5: Set(["1ZzmTycawZ9YbMeiKcfKLL", "5a2w2tgpLwv26BYJf2qYwu"])],
              seedTracks: [
                1: Set(["7Bq0iyHYCOJ7lzRIC9fCDh", "2cYALQZNXmuFGp2ecgpKMa"]),
                2: Set(["2lL1mdmCo6LsO2JAKoFRw4", "6fMH3gza1IkUlY2lCCo4cQ"]),
                3: Set(["1B3x1uT4WMuFD84IxcOiki", "24a9UsAbEK5jB49zZyae58"]),
                4: Set(["4dMLc8SWH8UGz9W6cUztRq", "2Lho7mxHpPgTmaWLnpK2Vs"]),
                5: Set(["1ZtYQ0Xa0FceWOEYOjshui", "3htJKHlAjUoRmNLheJ8uTV"])
            ]),
            Genre(title: "electronic", featuredImage: UIImage(named: "electronic")!,
                  seedArtists: [
                    1: Set(["5gSlfhS3FhzfAruPQh0Wro", "7yxi31szvlbwvKq9dYOmFI"]),
                    2: Set(["62vbsDRAq0qHdezaCOzB0T", "0gUkHI3e2s55EeG58pYmFu"]),
                    3: Set(["5Q81rlcTFh3k6DQJXPdsot", "4wYk01oPJNfaEssVFL46oQ"]),
                    4: Set(["5fMUXHkw8R8eOP2RNVYEZX", "3hyEbRtp617pNCuuQjyOmc"]),
                    5: Set(["5he5w2lnU9x7JFhnwcekXX", "76M2Ekj8bG8W7X2nbx2CpF"])],
                  seedTracks: [
                    1: Set(["1R8Q2qGxm1YlUgMHCOremR", "4fhiVcZeJWlKVB8xC3Ert8"]),
                    2: Set(["5WI2ltQIdwgzf1SNE76JyR", "4bOr88BuLILM22g8FKQWrG"]),
                    3: Set(["1hovkSJMIpP5hfuyb756G4", "3sTN90bIP2cJ1783ctHykO"]),
                    4: Set(["2Th9BGKvfZG8bKQSACitwG", "5d1fRO6RYAtbPPgbpSHnlA"]),
                    5: Set(["0u695M7KyzXaPIjpEbxOkB", "71hbZpMopE0qWeJEac9TYS"])
                ]),
            Genre(title: "hip-hop", featuredImage: UIImage(named: "hiphop")!,
              seedArtists: [
                1: Set(["6YJ4EgQzDfJnIHRbqIHAdD", "2N79L5eT2Xraec4UJsi2Fz"]),
                2: Set(["7tYKF4w9nC0nq9CsPZTHyP", "4IVAbR2w4JJNJDDRFP3E83"]),
                3: Set(["4V8LLVI7PbaPR0K2TGSxFF", "6l3HvQ5sa6mXTsMTB19rO5"]),
                4: Set(["007DWn799UWvfY1wwZeENR", "007DWn799UWvfY1wwZeENR"]),
                5: Set(["0Y5tJX1MQlPlqiwlOH1tJY", "181bsRPaVXVlUKXrxwZfHK"])],
              seedTracks: [
                1: Set(["0wXuerDYiBnERgIpbb3JBR", "3yhlH8lhTpS03d91kuwjpf"]),
                2: Set(["3ATo60fpicfxwZ0daRatlU", "3ATo60fpicfxwZ0daRatlU"]),
                3: Set(["5NhlpQ6BOIz3S5welptk1W", "0H8XeaJunhvpBdBFIYi6Sh"]),
                4: Set(["55CHeLEfn5iJ0IIkgaa4si", "60xaS8mYBKUW4VQQ666N0T"]),
                5: Set(["6HZILIRieu8S0iqY8kIKhj", "03tqyYWC9Um2ZqU0ZN849H"])
            ]),
            Genre(title: "k-pop", featuredImage: UIImage(named: "kpop")!,
                  seedArtists: [1: Set(["6dhfy4ByARPJdPtMyrUYJK", "7l8rOFwZFQ3G0sgZ7gjGng"]), 2: Set(["2FgZrgTMX6Sk0VNcOsEPmm", "6aLdhHUqgdKE86xbtNmY8g"]), 3: Set(["0siBQaURCli5wn2lqv8WZg", "5dCvSnVduaFleCnyy98JMo"]), 4: Set(["7n2Ycct7Beij7Dj7meI4X0", "3paGCCtX1Xr4Gx53mSeZuQ"]), 5: Set(["4gOc8TsQed9eqnqJct2c5v", "2dIgFjalVxs4ThymZ67YCE"])],
                  seedTracks: [1: Set(["5jrF5VL5izwhJB9xgGR18l", "0D9AvynVM5S1cbNgOl06l8"]), 2: Set(["6z1kLsntE7FuzKZHZWrXYN", "3mKK73NhylzXdHV4qZGxI4"]), 3: Set(["1kqDfjZwReaIeiIU4BXFKy", "4kcX1pwQBQFpXhDc64MTPq"]), 4: Set(["5MwfxCtqMFGYp9Nc1BkTrS", "6FdShjf7nA2cqEnpv1tIia"]), 5: Set(["1M9qmt6EFa0RJJV8C7Y3HO", "60M8FSYZP8MA0Wy2huOADL"])
            ]),
            Genre(title: "pop", featuredImage: UIImage(named: "pop")!,
              seedArtists: [
                1: Set(["4phGZZrJZRo4ElhRtViYdl", "00FQb4jTyendYWaN8pK0wa"]),
                2: Set(["3l0CmX0FuQjFxr8SK7Vqag", "3rWZHrfrsPBxVy692yAIxF"]),
                3: Set(["5JZ7CnR6gTvEMKX4g70Amv", "3WGpXCj9YhhfX11TToZcXP"]),
                4: Set(["66CXWjxzNUsdJxJ2JdwvnR", "6M2wZ9GZgrQXHCFfjv46we"]),
                5: Set(["5cj0lLjcoR7YOSnhnX0Po5", "6LqNN22kT3074XbTVUrhzX"])],
              seedTracks: [
                1: Set(["41zXlQxzTi6cGAjpOXyLYH", "1XpYodsD36XN7ygcdF7mJJ"]),
                2: Set(["6fxVffaTuwjgEk5h9QyRjy", "5Z3GHaZ6ec9bsiI5BenrbY"]),
                3: Set(["6iYMfxznTBlcVOgRHab2W0", "3uc8AGNL0KbvISIrjnfRvN"]),
                4: Set(["0rIAC4PXANcKmitJfoqmVm", "53nWoDpnflfBIUAfzhcZnD"]),
                5: Set(["0QSQSRLBSYgB34WcEpicFP", "78qd8dvwea0Gosb6Fe6j3k"])
            ]),
        ]
    }
}
