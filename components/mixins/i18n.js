import { mapState } from 'vuex';
import config from '../../config.json';
import logo from '../../assets/logo.png';
import brand from '../../assets/logo-FR-laptop.svg';
import brandMobile from '../../assets/logo-FR-mobile.svg';
import brandOg from '../../assets/logo-og.jpg';

function bestLocale(obj, locale) {
  Object.entries(obj).forEach(e => {
    if(typeof e[1] === "object") {
      obj[e[0]] = e[1][locale] || e[1].DEFAULT;
    }
  });

  return obj;
}

export default {
  computed: {
    ...mapState(['country', 'brandId']),

    links() {
      // Priority to domain, then locales
      return bestLocale(Object.assign(
        {},
        config.locales.DEFAULT,
        config.locales[this.$i18n.locale],
        this.brandId && config.brands[this.brandId] ? config.brands[this.brandId] : {}
      ), this.$i18n.locale);
    },

    countryConfig() {
      return bestLocale(Object.assign({}, config.countries.DEFAULT, config.countries[this.country]), this.$i18n.locale);
    },

    logo() {
      return logo;
//       return {}[this.brandId] || brand;
    },

    logoMobile() {
      return logo;
//       return {}[this.brandId] || brandMobile;
    },

    logoOg() {
      return {}[this.brandId] || brandOg;
    },

    brand() {
      return this.brandId ? config.brands[this.brandId].brand_text : config.brands.DEFAULT.brand_text;
    },

    appsInfo() {
      return config.brands[this.brandId].appsInfo || false;
    }
  }
}
