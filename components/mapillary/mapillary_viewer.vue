<template>
  <div :id="`mapillary-${uuid}`" />
</template>

<script>
import { Viewer, MarkerComponent } from 'mapillary-js/dist/mapillary.min';
import { mapillaryClientId } from '../../config';
import { mapillaryViewerFilter } from './mapillary';

export default {
  props: {
    bearing: {
      type: String,
      required: false,
      default: null
    },
    cover: {
      type: Boolean,
      required: false,
      default: false
    },
    mKey: {
      type: String,
      required: true
    },
    marker: {
      type: Object,
      required: false
    }
  },

  data() {
    return {
      uuid: Math.random(),
      mapMarker: null,
      node: null
    };
  },

  mounted() {
    this.viewer = new Viewer(
      `mapillary-${this.uuid}`,
      mapillaryClientId,
      this.mKey,
      {
        component: {
          cover: this.cover,
          marker: true
        }
      }
    );

    /**
     * Convert a desired bearing to a basic X image coordinate for
     * a specific node bearing.
     *
     * Works only for a full 360 panorama.
     */
    function bearingToBasic(desiredBearing, nodeBearing) {
      // 1. Take difference of desired bearing and node bearing in degrees.
      // 2. Scale to basic coordinates.
      // 3. Add 0.5 because node bearing corresponds to the center
      //    of the image. See
      //    https://mapillary.github.io/mapillary-js/classes/viewer.html
      //    for explanation of the basic coordinate system of an image.
      const basic = (desiredBearing - nodeBearing) / 360 + 0.5;

      // Wrap to a valid basic coordinate (on the [0, 1] interval).
      // Needed when difference between desired bearing and node
      // bearing is more than 180 degrees.
      return wrap(basic, 0, 1);
    }

    const setBearing = (node, desiredBearing) => {
      if (!node.fullPano) {
        // We are only interested in setting the bearing for full 360 panoramas.
        return;
      }

      const nodeBearing = node.computedCA; // Computed node compass angle (equivalent
                                        // to bearing) is used by mjs when placing
                                        // the node in 3D space.

      const basicX = bearingToBasic(desiredBearing, nodeBearing);
      const basicY = 0.5; // Vertical center

      const center = [basicX, basicY];

      this.viewer.setCenter(center);
   }

    /**
     * Wrap a value on the interval [min, max].
     */
    function wrap(value, min, max) {
      const interval = (max - min);

      while (value > max || value < min) {
        if (value > max) {
          value = value - interval;
        } else if (value < min) {
          value = value + interval;
        }
      }

      return value;
    }

    this.viewer.setFilter(mapillaryViewerFilter(null, true));
    this.viewer.on(Viewer.bearingchanged, (bearing) => {
      this.$emit('updateBearing', bearing.toFixed());
    });

    this.viewer.on(Viewer.nodechanged, (node) => {
      this.node = node;
      if (this.bearing) setBearing(node, this.bearing);
      this.$emit('keychange', node.key);
    });

    this.viewer.on(Viewer.navigablechanged, navigable => {
      if(navigable && this.marker) {
        const markerLatLng = { lat: this.marker.coordinates[1], lon: this.marker.coordinates[0] };

        // Compute bearing to show marker directly
        this.viewer.getPosition().then(viewerLatLng => {
          const toRad = function(deg) { return deg * Math.PI / 180; };
          const toDeg = function(rad) { return rad * 180 / Math.PI; };
          var dLon = (markerLatLng.lon-viewerLatLng.lon);
          var y = Math.sin(dLon) * Math.cos(markerLatLng.lat);
          var x = Math.cos(viewerLatLng.lat)*Math.sin(markerLatLng.lat) - Math.sin(viewerLatLng.lat)*Math.cos(markerLatLng.lat)*Math.cos(dLon);
          var brng = toDeg(Math.atan2(y, x));
          setBearing(this.node, brng);
        })
        .catch(e => console.error(e));
      }
    });

    this.updateMapMarker(this.marker);
  },

  methods: {
    updateMapMarker(marker) {
      const markerComponent = this.viewer.getComponent('marker');
      if(marker) {
        const markerLatLng = { lat: marker.coordinates[1], lon: marker.coordinates[0] };
        this.mapMarker = new MarkerComponent.SimpleMarker(
          'place-marker',
          markerLatLng
        );
        markerComponent.add([this.mapMarker]);
      }
      else {
        if(this.mapMarker) {
          markerComponent.removeAll();
          this.mapMarker = null;
        }
      }
    }
  },

  watch: {
    mKey(mKey) {
      this.viewer.moveToKey(mKey);
    },

    marker(marker) {
      this.updateMapMarker(marker);
    }
  }
};
</script>
