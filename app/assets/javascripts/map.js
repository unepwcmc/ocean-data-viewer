var Map = function(target, baseLayer) {
  var options = {
      minZoom: 2,
      maxZoom: 18,
      zoom: 3,
      center: new L.latLng(0, 0),
      scrollWheelZoom: false,
      zoomControl: false
    },
    layers = {};

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
    debugger;
  };

  this.zoomOut = function() {
    this.map.zoomOut();
  };

  this.hasLayer = function(layerName) {
    var found = false;
    $.each(layers, function(name) {
      if (layerName == name) {
        found = true;
      }
    });
    return found;
  };

  this.addLayer = function(layerName, options) {
    if (options.wmsName != '0') {
      layers[layerName] = new L.tileLayer.wms(options.wmsServer, {
        layers: options.wmsName,
        transparent: true,
        format: 'image/png',
        styles: options.styles,
        viewParams: options.viewParams
      });
    } else {
      layers[layerName] = new L.esri.tiledMapLayer(options.wmsServer, {
        opacity : 1
      });
    }
  }

  this.toggleLayer = function(layerName) {
    $.each(layers, function(name, layerObject) {
      if (layerName == name) {
        if (this.map.hasLayer(layerObject)) {
          this.map.removeLayer(layerObject);
        } else {
          this.map.addLayer(layerObject);
        }
      }
    }.bind(this));
  }

  this.removeAllLayers = function() {
    $.each(layers, function(_, layerObject) {
      if (this.map.hasLayer(layerObject)) {
        this.map.removeLayer(layerObject);
      }
    }.bind(this));
  }
};
