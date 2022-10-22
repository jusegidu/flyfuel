import { Controller } from "@hotwired/stimulus";
import { stringifyEventTarget } from "@hotwired/stimulus/dist/types/core/action_descriptor";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    latitud: String,
    longitud: String,
    coordenatex: String,
    coordenatey: String
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    getRoute([this.latitudValue, this.longitudValue],[this.coordenatexValue, this.coordenateyValue]);
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
          const popup = new mapboxgl.Popup().setHTML(marker.info_window) // Add this
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup) // Add this
        .addTo(this.map);
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}

async function getRoute(start, end) {
  // make a directions request using cycling profile
  // an arbitrary start will always be the same
  // only the end or destination will change
  // console.log(start, end);
  const query = await fetch(
    `https://api.mapbox.com/directions/v5/mapbox/driving/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
    { method: 'GET' }
  );
  const json = await query.json();
  console.log(json);
  const data = json.routes[0];

  const distance = data.distance;
  const time = data.duration;
  console.log(distance, time);
  const durationhtml = document.querySelectorAll(".duration")
  console.log(durationhtml);
  durationhtml.forEach((marker) => {
    marker.innerHTML = `<li>${time}</li>`;
  })
  // durationhtml.innerHTML = `<li>${time}</li>`;

}

// console.log(document.querySelectorAll(".card-trip"));
// document.querySelectorAll(".card-trip").forEach((marker) => {
//   console.log(marker);
//   console.log(marker.querySelector(".duration"));
//   console.log(marker.querySelector(".coordenates"));
//   const query = await fetch(
//     `https://api.mapbox.com/directions/v5/mapbox/driving/"${".latitud"}",${".longitud"};${".coordenates.innerText[0]"},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
//     { method: 'GET' }
//   );

  // marker.innerHTML = `<li>${time}</li>`;
//});
