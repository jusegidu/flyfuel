import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    getRoute([32.31, 34.35],[31.14, 30.23]);
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
  console.log(start, end)
  const query = await fetch(
    `https://api.mapbox.com/directions/v5/mapbox/driving/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
    { method: 'GET' }
  );
  const json = await query.json();
  const data = json.routes[0];

  const distance = data.distance;
  const time = data.duration;
  console.log(distance, time);
  const durationhtml = document.querySelector(".duration")
  durationhtml.innerHTML = `<li>${time}</li>`;

}
