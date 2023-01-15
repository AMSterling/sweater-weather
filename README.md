<div align="center">

## Sweater Weather Final

[![ruby][ruby]][ruby-url] [![ror][ror]][ror-url] [![Postgres][Postgres]][Postgres-url] [![RSpec][RSpec]][RSpec-url] [![Atom][Atom]][Atom-url]

#### Contributors: [Anna Marie Sterling](https://github.com/AMSterling)

</div>

---

## Description

A rails backend API for Sweater Weather Final

---

# <a name="contents"></a> Table of contents

- [Architecture](#architecture)
- [Database setup](#database-setup)
  - [Required API keys](#required-keys)
- [Endpoints](#endpoints)
  - [Create User](#create-user)
  - [Weather Forecast by Location](#location-forecast)
  - [Fetch 5 Books by Location](#location-books)

---

# <a name="architecture"></a>Architecture

[Back to top](#contents)

# <img src="app/assets/images/schema-diagram.png">

Tea Subscription was built with test-driven development, with Rspec used for testing. It is built with Rails conventions over configuration as a guiding principle. A service-facade design pattern is used when calling external API services.

---

# <a name="database-setup"></a>Database Setup

Instructions to set up a local version of Sweater Weather Final:

Fork and clone the project, then install the required gems with `bundle`. A full list of gems that will be installed can be found in the [gemfile](gemfile).

```sh
bundle install
```

Reset the database:

```sh
rake db:{drop,create,migrate}
```

## <a name="required-keys"></a> Required keys

Sweater Weather Final uses <a href="https://developer.mapquest.com/documentation/geocoding-api/" target="_blank" rel="noopener noreferrer">Mapquest Geocoding API</a>, <a href="https://openweathermap.org/api/one-call-api" target="_blank" rel="noopener noreferrer">OpenWeatherMap API</a>, and <a href="https://openlibrary.org/developers/api" target="_blank" rel="noopener noreferrer">OpenLibrary API</a>.

Once you have your key, set up your environment with

```sh
bundle exec figaro install
```

 Then add your keys to `config/application.yml`:

```ruby
map_api_key: <YOUR_MAPQUEST_KEY>
weather_api_key: <YOUR_OPENWEATHERMAP_KEY>
```

Start a rails server, and you're ready to query

```sh
rails s
```

---

# <a name="endpoints"></a>Endpoints

## <a name="create-user"></a>Create User

[Back to top](#contents)

Creates a new user.

<br>

```
POST '/api/v1/users'
```

**Sample body**

 ```
 {
  "email": "alison.rempel@example.org",
  "password": "password",
  "password_confirmation": "password"
 }
 ```

**Sample response (status 200)**

 ```
 {
     "data": {
         "id": "238",
         "type": "users",
         "attributes": {
             "email": "alison.rempel@example.org",
             "api_key": "0ad3c1b8f30bb80fa0006a09ed2e62a3"
         }
     }
 }
 ```

---

## <a name="location-forecast"></a>Weather Forecast by Location

[Back to top](#contents)

Retrieve weather for location.

<br>

```
GET "/api/v1/forecast?location=#{location}"
```

<br>

**Sample body**

 ```
 {
    "location": "lincoln,ne"
 }
 ```

**Sample response (status 200)**

 ```
 {
     "data": {
         "id": "1",
         "type": "forecast",
         "attributes": {
             "current_weather": {
               "datetime":"2023-01-11 15:08:20 -0700",
               "sunrise":"2023-01-11 06:50:19 -0700",
               "sunset":"2023-01-11 16:18:37 -0700",
               "temperature":38.44,
               "feels_like":29.5,
               "humidity":75,
               "uvi":0.19,
               "visibility":10000,
               "conditions":"clear sky",
               "icon":"01d"
             },
             "daily_weather": [{
               "date":"2023-01-11",
               "sunrise:""2023-01-11 06:50:19",
               "sunset":"2023-01-11 16:18:37",
               "max_temp":41.11,
               "min_temp":31.15,
               "conditions":"broken clouds",
               "icon":"04d"
              },
              {
                "date":"2023-01-12",
                "sunrise":"2023-01-12 06:50:03",
                "sunset":"2023-01-12 16:19:41",
                "max_temp":32.88,
                "min_temp":22.23,
                "conditions":"clear sky",
                "icon":"01d"},
              {
                "date":"2023-01-13",
                "sunrise":"2023-01-13 06:49:44",
                "sunset":"2023-01-13 16:20:46",
                "max_temp":36.52,
                "min_temp":18.21,
                "conditions":"clear sky",
                icon":"01d"
              },
              {
                "date":"2023-01-14",
                "sunrise":"2023-01-14 06:49:22",
                "sunset":"2023-01-14 16:21:51",
                "max_temp":47.44,
                "min_temp":28.45,
                "conditions":"overcast clouds",
                "icon":"04d"
              },
              {
                "date":"2023-01-15",
                "sunrise":"2023-01-15 06:48:59",
                "sunset":"2023-01-15 16:22:58",
                "max_temp":53.19,
                "min_temp":37.85,
                "conditions":"broken clouds",
                "icon":"04d"
              }],
             "hourly_weather":[{
                "time":"15:00",
                "temperature":38.44,
                "conditions":"clear sky",
                "icon":"01d"
              },
              {
                "time":"16:00",
                "temperature":38.52,
                "conditions":"few clouds",
                "icon":"02d"
              },
              {
                "time":"17:00",
                "temperature":37.62, "conditions":"scattered clouds", "icon":"03n"
              },
              {
                "time":"18:00",
                "temperature":36.27,
                "conditions":"broken clouds",
                "icon":"04n"
              },
              {
                "time":"19:00",
                "temperature":34.83,
                "conditions":"broken clouds",
                "icon":"04n"
              },
              {
                "time":"20:00",
                "temperature":33.24,
                "conditions":"overcast clouds", "icon":"04n"
              },
              {
                "time":"21:00",
                "temperature":32.32,
                "conditions":"overcast clouds",
                "icon":"04n"
              },
              {
                "time":"22:00",
                "temperature":31.15,
                "conditions":"overcast clouds",
                "icon":"04n"
              }]
          }
      }
  }
 ```

---

## <a name="location-books"></a>Fetch 5 Books by Location

[Back to top](#contents)

Retrieve top 5 books about searched location.

<br>

```
GET '/api/v1/book-search?location=denver,co&quantity=5'
```

<br>

**Sample response (status 200)**

 ```
 {
   "data": {
     "id":nil,
     "type":"books",
     "attributes":{
       "destination":"denver,co",
       "forecast":{
         "summary":"broken clouds",
         "temperature":"54.27 F"
        },
      "total_books_found":39,
      "books":[
       {
         "isbn":["0762507845","9780762507849"],
         "title":"Denver, Co",
         "publisher":["Universal Map Enterprises"]
       },
       {
         "isbn":["9780607620054", "0607620056"],
         "title":"Denver west, CO and Bailey, CO: Denver, CO",
         "publisher":["USGS Branch of Distribution"]
       },
       {
         "isbn":["9780607620047", "0607620048"],
         "title":"Denver East, CO and Castle Rock, CO: Denver, CO",
         "publisher":["USGS Branch of Distribution"]
       },
       {
         "isbn":["0762557362", "9780762557363"],
         "title":"Denver Co Deluxe Flip Map",
         "publisher":["Universal Map Enterprises"]
       },
       {
         "isbn":["9781427401687", "1427401683"],
         "title":"University of Denver Co 2007",
         "publisher":["College Prowler"]
       }
      ]
     }
   }
 }
 ```

---

<!-- BADGE LINKS -->

[Atom]: https://img.shields.io/badge/Atom-66595C?style=for-the-badge&logo=Atom&logoColor=white
[Atom-url]: https://atom.io/

[ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[ruby-url]: https://www.ruby-lang.org/en/

[ror]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[ror-url]: https://rubyonrails.org/

[RSpec]: https://custom-icon-badges.demolab.com/badge/RSpec-fffcf7?style=for-the-badge&logo=rspec
[RSpec-url]: https://rspec.info/

[Postgres]: https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
