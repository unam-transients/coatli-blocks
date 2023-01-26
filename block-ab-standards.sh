#!/bin/sh

rm -f 0005-ab-standard-*

if test "$1" = "clean"
then
  exit
fi

i=0
while read blockid hip alpha delta name
do

  cat <<EOF >0005-ab-standard-$blockid.json
{
  "project": {
    "identifier": "0005",
    "name": "AB Standards"
  },
  "identifier": "$blockid",
  "name": "$name",
  "visits": [
    {
      "identifier": "1000",
      "name": "pointing correction",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "pointingcorrectionvisit",
      "estimatedduration": "1m"
    },
    {
      "identifier": "0",
      "name": "g",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 g true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "1",
      "name": "r",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 r true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "2",
      "name": "i",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 i true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "3",
      "name": "z",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 z true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "4",
      "name": "y",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 y true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "5",
      "name": "w",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 w true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "10",
      "name": "B",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 B true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "11",
      "name": "V",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 V true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "12",
      "name": "R",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 R true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "13",
      "name": "I",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 I true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "14",
      "name": "Is",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 Is true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "20",
      "name": "470/10",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 470/10 true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "22",
      "name": "501/3",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 501/3 true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "23",
      "name": "501/8",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 501/8 true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "24",
      "name": "515/10",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 515/10 true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "25",
      "name": "640/10",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 640/10 true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "26",
      "name": "656/3",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 656/3 true conventionaldefault",
      "estimatedduration": "2m"
    },
    {
      "identifier": "27",
      "name": "656/8",
      "targetcoordinates": {
        "type"   : "equatorial",
        "alpha"  : "$alpha",
        "delta"  : "$delta",
        "equinox": "2000"
      },
      "command": "gridvisit 1 5 1 10 656/8 true conventionaldefault",
      "estimatedduration": "2m"
    }
  ],
  "constraints": {
    "maxskybrightness": "nauticaltwilight",
    "maxairmass": "1.1",
    "minmoondistance": "15d",
    "maxfocusdelay": "1200"
  },
  "persistent": "false"
}
EOF

done <<EOF
0 HIP-014594 03:08:25.58 +26:19:51.4 HD 19445 
1 HIP-048152 09:48:56.09 +13:44:39.3 HD 84937 
2 HIP-072461 14:49:02.36 +25:42:09.2 BD +26 2606
3 HIP-109558 22:11:31.38 +18:05:34.2 BD +17 4708
4 HIP-076976 15:43:03.10 -10:56:00.6 HD 140283
EOF

exit
