$(document).ready(function(){
    var locations = [ "Accra, Ghana", "A Coruna, Spain", "Albany, NY", "Albuquerque, NM", "Alexandria, LA", "Alexandria, VA", "Algiers, Algeria", "Allentown, PA", "Almaty, Kazakhstan", "Amherst, MA", "Amsterdam, Netherlands", "Ankara, Turkey", "Ann Arbor, MI", "Asheville, NC", "Astana, Kazakhstan", "Athens, Greece", "Atlanta, GA", "Atlantic City, NJ", "Atyrau, Kazakhstan", "Auckland, New Zealand", "Augusta, GA", "Austin, TX", "Bakersfield, CA", "Baltimore, MD", "Bangalore, India", "Bangkok, Thailand", "Barcelona, Spain", "Basking Ridge, NJ", "Baton Rouge, LA", "Beaver Creek, CO", "Beaverton, MI", "Bedminster, NJ", "Beijing, China", "Bellingham, WA", "Belo Horizonte, Brazil", "Bend, OR", "Berlin, Germany", "Billings, MT", "Biloxi, MS", "Binghamton, NY", "Birmingham, AL", "Birmingham, MI", "Bismarck, ND", "Bloomington, IL", "Bogota, Colombia", "Boise, ID", "Bologna, Italy", "Bonita Springs, FL", "Bordeaux, France", "Bossier City, LA", "Boston Metro Area", "Boulder, CO", "Bozeman, MT", "Branchburg, NJ", "Branson, MO", "Brewer, ME", "Bridgeport, CT", "Bridgewater, NJ", "Brighton, United Kingdom", "Brisbane, Australia", "Bristol, TN", "Bristol, United Kingdom", "Brussels, Belgium", "Bucharest, Romania", "Budapest, Hungary", "Buenos Aires, Argentina", "Buffalo, NY", "Burlington, MA", "Burlington, VT", "Bursa, Turkey", "Busan, South Korea", "Calgary, Canada", "Calhoun, GA", "Canberra, Australia", "Cape Town, South Africa", "Center Valley, PA", "Chandigarh, India", "Charleston, SC", "Charleston, WV", "Charlotte, NC", "Charlottesville, VA", "Chattanooga, TN", "Chengdu, China", "Chennai, India", "Cherry Hill, NJ", "Chevy Chase, MD", "Chicago, IL", "Chongqing, China", "Cincinnati, OH", "Clarksburg, WV", "Cleveland, OH", "Coffeyville, KS", "College Station, TX", "Colorado Springs, CO", "Columbia, MO", "Columbia, SC", "Columbus, GA", "Columbus, OH", "Copenhagen, Denmark", "Cork, Ireland Corpus", "Christi, TX", "Dallas/Ft. Worth, TX", "Dalton, GA", "Daytona Beach, FL", "Delray Beach, FL", "Denver, CO", "Des Moines, IA", "Detroit, MI", "Dodge City, KS", "Dreieich, Germany", "Dubai, United Arab Emirates", "Dublin, Ireland", "Duluth, MN", "Durango, CO", "Durham, NC", "Dusseldorf, Germany", "East Stroudsburg, PA", "Eau Claire, WI", "Edinburgh, United Kingdom", "Edmonton, Canada", "El Paso, TX", "Eugene, OR", "Evansville, IN", "Fayetteville, AR", "Flexible / Remote", "Florence, Italy", "Fort Collins, CO", "Fort Wayne, IN", "Fort Worth, TX", "Frankfurt, Germany", "Fresno, CA", "Ft. Myers, FL", "Fukuoka, Japan", "Galway, Ireland", "Glasgow, United Kingdom", "Golden, CO", "Grand Rapids, MI", "Green Bay, WI", "Greenville, SC", "Guadalajara, Mexico", "Guangzhou, China", "Guragon, India", "Hagatna, Guam", "Halifax, Canada", "Hamburg, Germany", "Hamilton, Bermuda", "Hamilton, NJ", "Hangzhou, China", "Hanoi, Vietnam", "Hanover, NH", "Harker Heights, TX", "Harrisburg, PA", "Hartford, CT", "Helena, MT", "Helsinki, Finland", "Hermosillo, Mexico", "Hingham, MA", "Ho Chi Minh City, Vietnam", "Hong Kong Honolulu, HI", "Houston, TX", "Huntington, WV", "Huntsville, AL", "Hunt Valley, MD", "Hyderabad, India", "Indianapolis, IN", "International Istanbul, Turkey", "Jackson, MS", "Jacksonville, FL", "Jakarta, Indonesia", "Johannesburg, South Africa", "Johnstown, PA", "Joplin, MO", "Kampala, Uganda", "Kansas City, KS", "Kansas City, MO", "Kazan, Russia", "Kiev, Ukraine", "Kigali, Rwanda", "Kitchener, Canada", "Knoxville, TN", "Krakow, Poland", "Kyoto, Japan", "Lafayette, LA", "Lagos, Nigeria", "Lake Tahoe, CA", "Lancaster, PA", "Landover, MD", "Las Vegas, NV", "Lausanne, Switzerland", "Lebanon, NH", "Lexington, KY", "Lille, France", "Lilongwe, Malawi", "Lima, OH", "Lima, Peru", "Lincoln, NE", "Lisbon, Portugal", "Little Rock, AR", "London, United Kingdom", "Long Island, NY", "Los Angeles, CA", "Louisville, KY", "Luxembourg City,", "Luxembourg Lyon,", "France Macau, Macau", "Macon, GA", "Madison, WI", "Madrid, Spain", "Malaga, Spain", "Malibu, CA", "Malvern, PA", "Manchester, NH", "Manchester, United Kingdom", "Manhattan, NY", "Manila, Philippines", "Marseille, France", "McAllen, TX", "Medford, OR", "Melbourne, Australia", "Memphis,TN", "Mendoza, Argentina", "Menlo Park, CA", "Mesa, AZ", "Mexico City, Mexico", "Miami, FL", "Midland, MI", "Milan, Italy", "Milton, DE", "Milwaukee, WI", "Minneapolis, MN", "Mobile, AL", "Monterrey, Mexico", "Montevideo, Uruguay", "Montgomery, AL", "Montreal, Canada", "Moscow, Russia", "Mountain Home, AR", "Mountainside, NJ", "Mountain View, CA", "Mt. Vernon, WA", "Multiple Mumbai, India", "Munich, Germany", "Myrtle Beach, SC", "Nagoya, Japan", "Nairobi, Kenya", "Nanjing, China", "Naples, Italy", "Nashua, NH", "Nashville, TN", "Netanya, Israel", "Newark, DE", "New Berlin, WI", "Newcastle, Australia", "New Delhi, India", "New Haven, CT", "New Orleans, LA", "New York City Metro Area", "Nogales, Mexico", "Norwalk, CT", "Norwich, VT", "Novosibirsk, Russia", "Oaxaca, Mexico", "Odessa, Ukraine", "Oklahoma City, OK", "Olympia, WA", "Omaha, NE", "Orange County, CA", "Orlando, FL", "Osaka, Japan", "Oslo, Norway", "Ostrava, Czech Republic", "Ottawa, Canada", "Oxford, United Kingdom", "Oxnard, CA", "Padua, Italy", "Palm Bay, FL", "Palm Beach, FL", "Palm Springs, CA", "Palo Alto, CA", "Panama City, FL", "Paris, France", "Parkersburg, WV", "Pasadena, CA", "Pensacola, FL", "Peoria, IL", "Perth, Australia", "Philadelphia, PA", "Phoenix, AZ", "Piscataway, NJ", "Pittsburgh, PA", "Plano, TX", "Plattsburgh, NY", "Portland, ME", "Portland, OR", "Porto Alegre, Brazil", "Prague, Czech Republic", "Princeton, NJ", "Providence, RI", "Provo, UT", "Quebec City, Canada", "Queens, NY", "Quito, Ecuador", "Ra'anana, Israel", "Raleigh, NC", "Reading, United Kingdom", "Recife, Brazil", "Regina, Canada", "Rehoboth Beach, DE", "Reno, NV", "Richmond, VA", "Riga, Latvia", "Rio de Janeiro, Brazil", "Riyadh, Saudi Arabia", "Roanoke, VA", "Rochester, NY", "Rock Island, IL", "Rome, Italy", "Rubengera, Rwanda", "Sacramento Metro Area Saguenay, Canada", "Saint John, Canada", "Saint Louis, MO", "Salt Lake City, UT", "San Antonio Metro Area", "San Diego, CA", "San Francisco Bay Area", "San Jose, CA", "Santa Barbara, CA", "Santa Cruz, CA", "Santiago, Chile", "Sao Paolo, Brazil", "Sapporo, Japan", "Savannah, GA", "Scottsdale, AZ", "Scranton, PA", "Seattle, WA", "Secaucus, NJ", "Seoul, South Korea", "Seville, Spain", "Shanghai, China", "Shenzhen, China", "Short Hills, NJ", "Shreveport, LA", "Silicon Valley, CA", "Singapore Spokane, WA", "Springfield, IL", "Springfield, MO", "Stockholm, Sweden", "St. Petersburg, Russia", "Sugar Valley, GA", "Sunnyvale, CA", "Surabaya, Indonesia", "Swainsboro, GA", "Sydney, Australia", "Syracuse, NY", "Tahoe City, CA", "Taipei, Taiwan", "Taizhou, China", "Tallahassee, FL", "Tallinn, Estonia", "Tamarindo, Costa Rica", "Tampa, FL", "Tel Aviv, Israel", "Tempe, AZ", "Tijuana, Mexico", "Tokyo, Japan", "Toledo, OH", "Topeka, KS", "Toronto, Canada", "Traverse City, MI", "Trujillo, Peru", "Tucson, AZ", "Tulsa, OK", "Valencia, Spain", "Valletta, Malta", "Vancouver, Canada", "Venice, Italy", "Vienna, Austria", "Villahermosa, Mexico", "Virginia Beach, VA", "Volcano, HI", "Warsaw, Poland", "Washington DC Metro Area", "Waterloo, Canada", "Wellington, New Zealand", "Westlake Village, CA", "Westport, CT", "Wilmington, DE", "Winnipeg, Canada", "Woodcliff Lake, NJ", "Wuhan, China", "Wuxi, China", "Wyomissing, PA", "Xi'an, China", "Zurich, Switzerlan"];
    $("#location-search-form").on("click", function(e){
      $('#location-search-form').autocomplete({
        source: locations
    });
  })
});