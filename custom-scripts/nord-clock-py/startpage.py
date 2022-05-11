import os
import time
import requests
import json



#while True:
    # os.system("curl wttr.in/prizren?format=%t | sed 's/+//g' > ~/.wttr.in")
    # os.system("curl wttr.in/prizren?format=%C | sed 's/+//g' > ~/.wttr-stats.in")
    # os.system("""cat ~/.wttr.in > /home/panickk/custom-scripts/nord-clock-py/weather """)
    # os.system("""cat ~/.wttr-stats.in | trans -brief > /home/panickk/custom-scripts/nord-clock-py/stats""")

    # weather=open('/home/panickk/custom-scripts/nord-clock-py/weather','r')
    
api_key = "API_KEY"
lat = "LAT"
lon = "LON"
url = "http://api.openweathermap.org/data/2.5/weather?lat=%s&lon=%s&appid=%s&units=metric" % (lat, lon, api_key)
response = requests.get(url)
data = json.loads(response.text)
current = data["main"]["temp"]
print(data)

html=open('/home/panickk/custom-scripts/nord-clock-py/index.html','w')
html.write("""
    <!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>PanCake - StartPage</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto+Mono" rel="stylesheet"><link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css'><link rel="stylesheet" href="style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class='center-dial'>
  <h1 class='center-preview'>HELLO</h1>
  <div class='head'></div>
  <div class='torso'></div>
  <div class='hand-container' id='minutes'>
    <div class='minute-hand'></div>
  </div>
  <div class='hand-container' id='hours'>
    <div class='hour-hand'></div>
  </div>
  <div class='hand-container' id='seconds'>
    <div class='second-hand'></div>
  </div>
</div>
<div class='day-name-dial'>
  <div class='ring-back'></div>
  <div class='ring' id='r1'>
    <h1 class='day-name-preview'>DAY NAME</h1>
    <h2 class='day-name-text'>MON TUE WED THU FRI SAT SUN</h2>
  </div>
</div>
<div class='month-dial'>
  <div class='ring-back'></div>
  <div class='ring' id='r2'>
    <h1 class='month-preview'>MONTH</h1>
    <h2 class='month-text'>JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC</h2>
  </div>
</div>
<div class='day-dial'>
  <div class='ring-back'></div>
  <div class='ring' id='r3'>
    <h1 class='day-preview'>DAY</h1>
    <h2 class='day-text'>01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31</h2>
  </div>
</div>
<div class='side-ring' id='weather'>
  <div class='fa fa-cloud'></div>
  <p class='temperature'>""" + f"{round(current)}°C" + """</p>
</div>
<div class='side-ring' id='steps'>
  <div class='bars'>
    <div class='bar'>
      <div class='day-letter'>M</div>
      <div class='x' id='x1'></div>
    </div>
    <div class='bar'>
      <div class='day-letter'>T</div>
      <div class='x' id='x2'></div>
    </div>
    <div class='bar'>
      <div class='day-letter'>W</div>
      <div class='x' id='x3'></div>
    </div>
    <div class='bar'>
      <div class='day-letter'>T</div>
      <div class='x' id='x4'></div>
    </div>
    <div class='bar'>
      <div class='day-letter'>F</div>
      <div class='x' id='x5'></div>
    </div>
    <div class='bar'>
      <div class='day-letter'>S</div>
      <div class='x' id='x6'></div>
    </div>
    <div class='bar'>
      <div class='day-letter'>S</div>
      <div class='x' id='x7'></div>
    </div>
  </div>
</div>
<!-- partial -->
  <script src='./jquery.min.js'></script>
<script src='./jquery.lettering.min.js'></script>
<script  src="./script.js"></script>

</body>
</html>
    """)
    
