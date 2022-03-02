import json

inden = input('Enter a identifier (2002):')
NameA = input('Enter research name: ')
NameB = input('Enter object name: ')
RA = input('Enter RA (00:00:00.00): ')
Dec = input('Enter Dec (+00:00:00.00): ')
comm = input('Enter command (gridvisit 1 5 1 60 {g r i z} false): ')
c = int(input('Enter count number (1 or 2): '))

count = c

if count < 2:
    dictionary ={
        "project": {
          "identifier": inden,
          "name": NameA
        },
        "identifier": "0",
        "name": NameB,
        "visits": [
          {
            "identifier": "1000",
            "name": "pointing correction",
            "targetcoordinates": {
              "type"   : "equatorial",
              "alpha"  : RA,
              "delta"  : Dec,
              "equinox": "2000"
            },
            "command": "pointingcorrectionvisit",
            "estimatedduration": "1m"
          },
          {
            "identifier": "0",
            "name": "science",
            "targetcoordinates": {
              "type"   : "equatorial",
              "alpha"  : RA,
              "delta"  : Dec,
              "equinox": "2000"
            },
            "command": comm,
            "estimatedduration": "20m"
          }
        ],
        "constraints": {
          "maxskybrightness": "bright",
          "maxairmass": "1.5",
          "minmoondistance": "15d"
        },
        "persistent": "false"
    }
elif count == 2:
    dictionary ={
        "project": {
          "identifier": inden,
          "name": NameA
        },
        "identifier": "0",
        "name": NameB,
        "visits": [
          {
            "identifier": "1000",
            "name": "pointing correction",
            "targetcoordinates": {
              "type"   : "equatorial",
              "alpha"  : RA,
              "delta"  : Dec,
              "equinox": "2000"
            },
            "command": "pointingcorrectionvisit",
            "estimatedduration": "1m"
          },
          {
            "identifier": "1001",
            "name": "focus",
            "targetcoordinates": {
              "type"   : "equatorial",
              "alpha"  : RA,
              "delta"  : Dec,
              "equinox": "2000"
            },
            "command": "focusvisit",
            "estimatedduration": "2m"
          },
          {
            "identifier": "0",
            "name": "science",
            "targetcoordinates": {
              "type"   : "equatorial",
              "alpha"  : RA,
              "delta"  : Dec,
              "equinox": "2000"
            },
            "command": comm,
            "estimatedduration": "20m"
          }
        ],
        "constraints": {
          "maxskybrightness": "bright",
          "maxairmass": "1.5",
          "minmoondistance": "15d"
        },
        "persistent": "false"
    },
#else:
#    print("Your number is very big")
#    with open('data.json', 'w') as outfile:
#        json.dump(dictionary, outfile)
#    count = count -1;

# Serializing json
    json_object = json.dumps(dictionary, indent = 1)
  
# Writing to sample.json
    with open("sample.json", "w") as outfile:
        outfile.write(json_object)
        count = count -1;

