var Map = function(target, baseLayer) {

  var options = {
      minZoom: 2,
      maxZoom: 8,
      zoom: 3,
      center: new L.latLng(0, 0),
      scrollWheelZoom: false,
      zoomControl: false
  },
  layers = {};

  var backgroundOpacity = 0.3;

  var accessToken = "pk.eyJ1IjoidW5lcHdjbWMiLCJhIjoiRXg1RERWRSJ9.taTsSWwtAfFX_HMVGo2Cug";

  var mapLabels = L.tileLayer('https://api.mapbox.com/v4/unepwcmc.o308nbjb/{z}/{x}/{y}.png?access_token=' + accessToken, {
    attribution: '<a href="http://www.mapbox.com/about/maps/" target="_blank">Terms &amp; Feedback</a>'
  });

  this.map = null;

  this.plot = function() {
    var southWest = L.latLng(-180, -3600),
      northEast = L.latLng(180, 3600),
      bounds = L.latLngBounds(southWest, northEast);

    this.map = new L.map(target, options);
    this.map.setMaxBounds(bounds);

    L.tileLayer.wms("http://www.gebco.net/data_and_products/gebco_web_services/web_map_service/mapserv?", {
      layers: 'GEBCO_LATEST',
      format: 'image/png',
      opacity: backgroundOpacity
    }).addTo(this.map);

    mapLabels.addTo(this.map);
  };

  this.zoomIn = function() {
    this.map.zoomIn();
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
          mapLabels.bringToFront();
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
