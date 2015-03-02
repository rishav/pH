window.userLocation = {}
window.userlocationCaptured = false

storePosition  = (position) -> 
  window.userLocation.latitude = position.coords.latitude
  window.userLocation.longitude = position.coords.longitude
  window.userLocationCaptured = true
  console.log(window.userLocation)
  
navigator.geolocation.getCurrentPosition(storePosition)



