var Map = function(target, baseLayer) {
  var options = {
      minZoom: 3,
      maxZoom: 18,
      zoom: 3,
      center: new L.latLng(0, 0),
      scrollWheelZoom: false,
      zoomControl: false
    };

  this.map = null;

  this.plot = function() {
    var southWest = L.latLng(-180, -3600),
      northEast = L.latLng(180, 3600),
      bounds = L.latLngBounds(southWest, northEast);

    this.map = new L.map(target, options);
    this.map.setMaxBounds(bounds);

    L.esri.basemapLayer(baseLayer).addTo(this.map);
  };

  this.zoomIn = function() {
    this.map.zoomIn();
  };

  this.zoomOut = function() {
    this.map.zoomOut();
  };
};
