$(document).ready(function () {

    setInterval(function () {
        getWeather()
    }, 60000 * 5);

    var settings = {
        "async": true,
        "crossDomain": true,
        "url": "https://api.openweathermap.org/data/2.5/weather?lat=[LAT]&lon=[LON]&appid=[APPI_KEY]&units=metric",
        "method": "GET",
    }

    function getWeather() {
        $.ajax(settings).done(function (response) {
            console.log(response);
            $('.temperature').text(Math.round(response['main']['temp']) + "°C")
        });
    }

    getWeather()

});
