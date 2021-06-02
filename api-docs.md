---
title: SehatQ v1
language_tabs:
  - python: Python
  - ruby: Ruby
  - curl: cURL
toc_footers: []
includes: []
search: true
highlight_theme: darkula
headingLevel: 2

---

<!-- Generator: Widdershins v4.0.1 -->

<h1 id="sehatq">SehatQ v1</h1>

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

Base URLs:

* <a href="http://localhost:3000">http://localhost:3000</a>

 License: 

# Authentication

- HTTP Authentication, scheme: bearer 

<h1 id="sehatq-default">Default</h1>

## Register

<a id="opIdRegister"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'text/plain',
  'Accept': 'application/json; charset=utf-8',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('http://localhost:3000/api/register', headers = headers)

print(r.json())

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'text/plain',
  'Accept' => 'application/json; charset=utf-8',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'http://localhost:3000/api/register',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /api/register`

*Register*

> Body parameter

```
username: dummy.user1
password: password
email: dummy.user1@mail.com
fullname: Dummy User Satu

```

<h3 id="register-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|string|true|none|

> Example responses

> 200 Response

```json
{
  "user": {
    "id": 2,
    "username": "dummy.user1",
    "email": "dummy.user1@mail.com",
    "fullname": "Dummy User Satu",
    "role": {
      "id": 2,
      "code": "customer",
      "name": "Customer"
    }
  },
  "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2MjI3NDU4MTh9.8AHAEQ_zhdwer5kJIMM8_dYCJ_3GJTX8hoInfdOslBw"
}
```

<h3 id="register-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Register Success|[200](#schema200)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
bearer, bearer, bearer, bearer, bearer, bearer, bearer
</aside>

## Login

<a id="opIdLogin"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'text/plain',
  'Accept': 'application/json; charset=utf-8',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('http://localhost:3000/api/login', headers = headers)

print(r.json())

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'text/plain',
  'Accept' => 'application/json; charset=utf-8',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'http://localhost:3000/api/login',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /api/login`

*Login*

> Body parameter

```
username: dummy.admin
password: password

```

<h3 id="login-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|string|true|none|

> Example responses

> 200 Response

```json
{
  "user": {
    "id": 1,
    "username": "dummy.admin",
    "email": "dummy.admin@mail.com",
    "fullname": "Dummy Admin",
    "role": {
      "id": 1,
      "code": "admin",
      "name": "Admin"
    }
  },
  "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJyb2xlIjoiYWRtaW4iLCJleHAiOjE2MjI3MjQ0OTl9.qZg-wuCvh104bXGmXI6H9lfM4Cx1HTTntUxd75HhlTs"
}
```

<h3 id="login-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Login Success|[200](#schema200)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
bearer, bearer, bearer, bearer, bearer, bearer, bearer
</aside>

## Profile

<a id="opIdProfile"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json; charset=utf-8',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('http://localhost:3000/api/me', headers = headers)

print(r.json())

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json; charset=utf-8',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'http://localhost:3000/api/me',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /api/me`

*Profile*

> Example responses

> 200 Response

```json
{
  "me": {
    "id": 1,
    "username": "dummy.admin",
    "email": "dummy.admin@mail.com",
    "fullname": "Dummy Admin",
    "role": {
      "id": 1,
      "code": "admin",
      "name": "Admin"
    }
  }
}
```

<h3 id="profile-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Profile Success|[200](#schema200)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
bearer, bearer, bearer, bearer, bearer, bearer, bearer
</aside>

## HospitalsList

<a id="opIdHospitalsList"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json; charset=utf-8',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('http://localhost:3000/api/v1/hospitals', headers = headers)

print(r.json())

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json; charset=utf-8',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'http://localhost:3000/api/v1/hospitals',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /api/v1/hospitals`

*Hospitals List*

> Example responses

> 200 Response

```json
[
  {
    "id": 1,
    "name": "RS ABC Jakarta",
    "address": "Jalan A",
    "phone_number": "021-1234-567",
    "created_at": "2021-06-02T13:02:31.760Z",
    "updated_at": "2021-06-02T13:02:31.760Z"
  },
  {
    "id": 2,
    "name": "RS ABC Bekasi",
    "address": "Jalan B",
    "phone_number": "021-2233-445",
    "created_at": "2021-06-02T13:02:31.769Z",
    "updated_at": "2021-06-02T13:02:31.769Z"
  }
]
```

<h3 id="hospitalslist-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Hospitals List|Inline|

<h3 id="hospitalslist-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[200](#schema200)]|false|none|none|
|» user|object|false|none|none|
|»» id|integer|false|none|none|
|»» username|string|false|none|none|
|»» email|string|false|none|none|
|»» fullname|string|false|none|none|
|»» role|object|false|none|none|
|»»» id|integer|false|none|none|
|»»» code|string|false|none|none|
|»»» name|string|false|none|none|
|» token|string|false|none|none|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
bearer, bearer, bearer, bearer, bearer, bearer, bearer
</aside>

## SpecialtiesList

<a id="opIdSpecialtiesList"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json; charset=utf-8',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('http://localhost:3000/api/v1/specialties', headers = headers)

print(r.json())

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json; charset=utf-8',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'http://localhost:3000/api/v1/specialties',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /api/v1/specialties`

*Specialties List*

> Example responses

> 200 Response

```json
[
  {
    "id": 1,
    "name": "Kesehatan Anak"
  }
]
```

<h3 id="specialtieslist-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Specialties List|Inline|

<h3 id="specialtieslist-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[200](#schema200)]|false|none|none|
|» user|object|false|none|none|
|»» id|integer|false|none|none|
|»» username|string|false|none|none|
|»» email|string|false|none|none|
|»» fullname|string|false|none|none|
|»» role|object|false|none|none|
|»»» id|integer|false|none|none|
|»»» code|string|false|none|none|
|»»» name|string|false|none|none|
|» token|string|false|none|none|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
bearer, bearer, bearer, bearer, bearer, bearer, bearer
</aside>

## DoctorsList

<a id="opIdDoctorsList"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json; charset=utf-8',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('http://localhost:3000/api/v1/doctors', params={
  'specialty_id': '0',  'hospital_id': '0'
}, headers = headers)

print(r.json())

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json; charset=utf-8',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'http://localhost:3000/api/v1/doctors',
  params: {
  'specialty_id' => 'number',
'hospital_id' => 'number'
}, headers: headers

p JSON.parse(result)

```

`GET /api/v1/doctors`

*Doctors List*

<h3 id="doctorslist-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|specialty_id|query|number|true|(optional) filter by speciality id|
|hospital_id|query|number|true|(optional) filter by hospital id|

> Example responses

> 200 Response

```json
[
  {
    "id": 3,
    "code": "SPJK0001",
    "name": "ANGGORO BUDI HARTOPO, M.Sc. Ph.D. Sp.PD. Sp.JP., dr.",
    "specialty": {
      "id": 2,
      "name": "Jantung (Kardiologi)"
    }
  }
]
```

<h3 id="doctorslist-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Doctors List|Inline|

<h3 id="doctorslist-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[200](#schema200)]|false|none|none|
|» user|object|false|none|none|
|»» id|integer|false|none|none|
|»» username|string|false|none|none|
|»» email|string|false|none|none|
|»» fullname|string|false|none|none|
|»» role|object|false|none|none|
|»»» id|integer|false|none|none|
|»»» code|string|false|none|none|
|»»» name|string|false|none|none|
|» token|string|false|none|none|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
bearer, bearer, bearer, bearer, bearer, bearer, bearer
</aside>

## SchedulesList

<a id="opIdSchedulesList"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json; charset=utf-8',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('http://localhost:3000/api/v1/schedules', params={
  'group': 'date',  'page': '0',  'hospital_id': '0'
}, headers = headers)

print(r.json())

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json; charset=utf-8',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'http://localhost:3000/api/v1/schedules',
  params: {
  'group' => 'string',
'page' => 'number',
'hospital_id' => 'number'
}, headers: headers

p JSON.parse(result)

```

`GET /api/v1/schedules`

*Schedules List*

<h3 id="scheduleslist-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|group|query|string|true|option: 'date'|'day'|
|page|query|number|true|change page to the next week|
|hospital_id|query|number|true|selected hospital|

> Example responses

> 200 Response

```json
[
  {
    "date": "2021-06-07",
    "day": "Monday",
    "schedules": [
      {
        "id": 1,
        "day_name": "Monday",
        "start_time": "10:00",
        "end_time": "12:00",
        "doctor": {
          "id": 1,
          "code": "SPAK0001",
          "name": "AGUNG TRIONO, Sp.A(K), dr.",
          "specialty": {
            "id": 1,
            "name": "Kesehatan Anak"
          }
        }
      },
      {
        "id": 3,
        "day_name": "Monday",
        "start_time": "13:00",
        "end_time": "14:00",
        "doctor": {
          "id": 2,
          "code": "SPAK0002",
          "name": "AMALIA SETYATI, Sp.A (K), dr.",
          "specialty": {
            "id": 1,
            "name": "Kesehatan Anak"
          }
        }
      },
      {
        "id": 5,
        "day_name": "Monday",
        "start_time": "09:00",
        "end_time": "11:00",
        "doctor": {
          "id": 3,
          "code": "SPJK0001",
          "name": "ANGGORO BUDI HARTOPO, M.Sc. Ph.D. Sp.PD. Sp.JP., dr.",
          "specialty": {
            "id": 2,
            "name": "Jantung (Kardiologi)"
          }
        }
      }
    ]
  },
  {
    "date": "2021-06-08",
    "day": "Tuesday",
    "schedules": [
      {
        "id": 2,
        "day_name": "Tuesday",
        "start_time": "10:00",
        "end_time": "12:00",
        "doctor": {
          "id": 1,
          "code": "SPAK0001",
          "name": "AGUNG TRIONO, Sp.A(K), dr.",
          "specialty": {
            "id": 1,
            "name": "Kesehatan Anak"
          }
        }
      },
      {
        "id": 4,
        "day_name": "Tuesday",
        "start_time": "13:00",
        "end_time": "14:00",
        "doctor": {
          "id": 2,
          "code": "SPAK0002",
          "name": "AMALIA SETYATI, Sp.A (K), dr.",
          "specialty": {
            "id": 1,
            "name": "Kesehatan Anak"
          }
        }
      },
      {
        "id": 6,
        "day_name": "Tuesday",
        "start_time": "09:00",
        "end_time": "11:00",
        "doctor": {
          "id": 3,
          "code": "SPJK0001",
          "name": "ANGGORO BUDI HARTOPO, M.Sc. Ph.D. Sp.PD. Sp.JP., dr.",
          "specialty": {
            "id": 2,
            "name": "Jantung (Kardiologi)"
          }
        }
      }
    ]
  },
  {
    "date": "2021-06-09",
    "day": "Wednesday",
    "schedules": []
  },
  {
    "date": "2021-06-10",
    "day": "Thursday",
    "schedules": [
      {
        "id": 9,
        "day_name": "Thursday",
        "start_time": "09:00",
        "end_time": "11:00",
        "doctor": {
          "id": 5,
          "code": "SPOT0001",
          "name": "ADITYA FUAD ROBBY TRIANGGA, Sp.OT., dr.",
          "specialty": {
            "id": 3,
            "name": "Bedah Orthopedi & Traumatologi"
          }
        }
      }
    ]
  },
  {
    "date": "2021-06-11",
    "day": "Friday",
    "schedules": []
  },
  {
    "date": "2021-06-12",
    "day": "Saturday",
    "schedules": [
      {
        "id": 10,
        "day_name": "Saturday",
        "start_time": "09:00",
        "end_time": "11:00",
        "doctor": {
          "id": 5,
          "code": "SPOT0001",
          "name": "ADITYA FUAD ROBBY TRIANGGA, Sp.OT., dr.",
          "specialty": {
            "id": 3,
            "name": "Bedah Orthopedi & Traumatologi"
          }
        }
      }
    ]
  },
  {
    "date": "2021-06-13",
    "day": "Sunday",
    "schedules": []
  }
]
```

<h3 id="scheduleslist-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Schedules List|Inline|

<h3 id="scheduleslist-responseschema">Response Schema</h3>

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[200](#schema200)]|false|none|none|
|» user|object|false|none|none|
|»» id|integer|false|none|none|
|»» username|string|false|none|none|
|»» email|string|false|none|none|
|»» fullname|string|false|none|none|
|»» role|object|false|none|none|
|»»» id|integer|false|none|none|
|»»» code|string|false|none|none|
|»»» name|string|false|none|none|
|» token|string|false|none|none|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
bearer, bearer, bearer, bearer, bearer, bearer, bearer
</aside>

## BookingAppointment

<a id="opIdBookingAppointment"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'text/plain',
  'Accept': 'application/json; charset=utf-8',
  'Authorization': 'Bearer {access-token}'
}

r = requests.post('http://localhost:3000/api/v1/orders', headers = headers)

print(r.json())

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'text/plain',
  'Accept' => 'application/json; charset=utf-8',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.post 'http://localhost:3000/api/v1/orders',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /api/v1/orders`

*Booking Appointment*

> Body parameter

```
hospital_id: 1
schedule_id: 3
date: 2021-06-07

```

<h3 id="bookingappointment-parameters">Parameters</h3>

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|string|true|none|

> Example responses

> 201 Response

```json
{
  "order": {
    "id": 3,
    "code": "APT123202106071",
    "queue_number": 1,
    "queue_date": "2021-06-07",
    "schedule": {
      "id": 3,
      "day_name": "Monday",
      "start_time": "13:00",
      "end_time": "14:00",
      "doctor": {
        "id": 2,
        "code": "SPAK0002",
        "name": "AMALIA SETYATI, Sp.A (K), dr.",
        "specialty": {
          "id": 1,
          "name": "Kesehatan Anak"
        }
      }
    }
  },
  "hospital": {
    "id": 1,
    "name": "RS ABC Jakarta",
    "address": "Jalan A",
    "phone_number": "021-1234-567",
    "created_at": "2021-06-02T13:02:31.760Z",
    "updated_at": "2021-06-02T13:02:31.760Z"
  },
  "patient": {
    "id": 1,
    "username": "dummy.admin",
    "email": "dummy.admin@mail.com",
    "fullname": "Dummy Admin",
    "role": {
      "id": 1,
      "code": "admin",
      "name": "Admin"
    }
  }
}
```

<h3 id="bookingappointment-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|None|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Booking Success|[201](#schema201)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
bearer, bearer, bearer, bearer, bearer, bearer, bearer
</aside>

## Doctorwithschedules&patients

<a id="opIdDoctorwithschedules&patients"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json; charset=utf-8',
  'Authorization': 'Bearer {access-token}'
}

r = requests.get('http://localhost:3000/api/v1/doctors/2', headers = headers)

print(r.json())

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json; charset=utf-8',
  'Authorization' => 'Bearer {access-token}'
}

result = RestClient.get 'http://localhost:3000/api/v1/doctors/2',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /api/v1/doctors/2`

*Doctor with schedules & patients*

> Example responses

> 200 Response

```json
{
  "doctor": {
    "id": 2,
    "code": "SPAK0002",
    "name": "AMALIA SETYATI, Sp.A (K), dr.",
    "specialty": {
      "id": 1,
      "name": "Kesehatan Anak"
    }
  },
  "reservation": [
    {
      "id": 3,
      "day_name": "Monday",
      "start_time": "13:00",
      "end_time": "14:00",
      "orders": []
    },
    {
      "id": 4,
      "day_name": "Tuesday",
      "start_time": "13:00",
      "end_time": "14:00",
      "orders": [
        {
          "id": 2,
          "code": "APT124202106081",
          "queue_date": "2021-06-08",
          "queue_number": 1,
          "patient": {
            "id": 1,
            "username": "dummy.admin",
            "email": "dummy.admin@mail.com",
            "fullname": "Dummy Admin",
            "role_id": 1,
            "created_at": "2021-06-02T02:22:29.455Z",
            "updated_at": "2021-06-02T02:22:29.455Z"
          }
        }
      ]
    }
  ]
}
```

<h3 id="doctorwithschedules&patients-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Doctor with schedules & patients|[200](#schema200)|

<aside class="warning">
To perform this operation, you must be authenticated by means of one of the following methods:
bearer, bearer, bearer, bearer, bearer, bearer, bearer
</aside>

# Schemas

<h2 id="tocS_200">200</h2>
<!-- backwards compatibility -->
<a id="schema200"></a>
<a id="schema_200"></a>
<a id="tocS200"></a>
<a id="tocs200"></a>

```json
{
  "user": {
    "id": 2,
    "username": "dummy.user1",
    "email": "dummy.user1@mail.com",
    "fullname": "Dummy User Satu",
    "role": {
      "id": 2,
      "code": "customer",
      "name": "Customer"
    }
  },
  "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2MjI3NDU4MTh9.8AHAEQ_zhdwer5kJIMM8_dYCJ_3GJTX8hoInfdOslBw"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|user|object|false|none|none|
|» id|integer|false|none|none|
|» username|string|false|none|none|
|» email|string|false|none|none|
|» fullname|string|false|none|none|
|» role|object|false|none|none|
|»» id|integer|false|none|none|
|»» code|string|false|none|none|
|»» name|string|false|none|none|
|token|string|false|none|none|

<h2 id="tocS_201">201</h2>
<!-- backwards compatibility -->
<a id="schema201"></a>
<a id="schema_201"></a>
<a id="tocS201"></a>
<a id="tocs201"></a>

```json
{
  "order": {
    "id": 3,
    "code": "APT123202106071",
    "queue_number": 1,
    "queue_date": "2021-06-07",
    "schedule": {
      "id": 3,
      "day_name": "Monday",
      "start_time": "13:00",
      "end_time": "14:00",
      "doctor": {
        "id": 2,
        "code": "SPAK0002",
        "name": "AMALIA SETYATI, Sp.A (K), dr.",
        "specialty": {
          "id": 1,
          "name": "Kesehatan Anak"
        }
      }
    }
  },
  "hospital": {
    "id": 1,
    "name": "RS ABC Jakarta",
    "address": "Jalan A",
    "phone_number": "021-1234-567",
    "created_at": "2021-06-02T13:02:31.760Z",
    "updated_at": "2021-06-02T13:02:31.760Z"
  },
  "patient": {
    "id": 1,
    "username": "dummy.admin",
    "email": "dummy.admin@mail.com",
    "fullname": "Dummy Admin",
    "role": {
      "id": 1,
      "code": "admin",
      "name": "Admin"
    }
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|order|object|false|none|none|
|» id|integer|false|none|none|
|» code|string|false|none|none|
|» queue_number|integer|false|none|none|
|» queue_date|string|false|none|none|
|» schedule|object|false|none|none|
|»» id|integer|false|none|none|
|»» day_name|string|false|none|none|
|»» start_time|string|false|none|none|
|»» end_time|string|false|none|none|
|»» doctor|object|false|none|none|
|»»» id|integer|false|none|none|
|»»» code|string|false|none|none|
|»»» name|string|false|none|none|
|»»» specialty|object|false|none|none|
|»»»» id|integer|false|none|none|
|»»»» name|string|false|none|none|
|hospital|object|false|none|none|
|» id|integer|false|none|none|
|» name|string|false|none|none|
|» address|string|false|none|none|
|» phone_number|string|false|none|none|
|» created_at|string|false|none|none|
|» updated_at|string|false|none|none|
|patient|object|false|none|none|
|» id|integer|false|none|none|
|» username|string|false|none|none|
|» email|string|false|none|none|
|» fullname|string|false|none|none|
|» role|object|false|none|none|
|»» id|integer|false|none|none|
|»» code|string|false|none|none|
|»» name|string|false|none|none|

