import json
  
inden = input('Enter a identifier:')
NameA = input('Enter research name: ')
NameB = input('Enter Name object: ')
RA = input('Enter RA (00:00:00.00): ')
Dec = input('Enter Dec (+00:00:00.00): ')
comm = input('Enter command (gridvisit 1 5 1 60 {g r i z} false): ')

# Data to be written
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
        "estimatedduration": "10m"
      }
    ],
    "constraints": {
      "maxskybrightness": "bright",
      "maxairmass": "1.5",
      "minmoondistance": "15d"
    },
    "persistent": "false"
}
  
# Serializing json
json_object = json.dumps(dictionary, indent = 4)
  
# Writing to sample.json
with open("sample.json", "w") as outfile:
    outfile.write(json_object)
