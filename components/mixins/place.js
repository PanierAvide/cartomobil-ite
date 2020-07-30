import PhoneNumber from 'awesome-phonenumber';

export default {
  computed: {
    title() {
      return this.place.properties.name;
    },

    category() {
      if(this.place.properties.cat3 !== 'other') { return this.place.properties.cat3; }
      else if(this.place.properties.cat2 !== 'other') { return this.place.properties.cat2; }
      else { return this.place.properties.cat1; }
    },

    type() {
      if(this.$te(`categories.${this.place.properties.cat3}`)) { return this.$t(`categories.${this.place.properties.cat3}`); }
      else if(this.$te(`categories.${this.place.properties.cat2}`)) { return this.$t(`categories.${this.place.properties.cat2}`); }
      else { return this.$t('categories.other'); }
    },

    link() {
      const phoneText = (p) => {
        return new PhoneNumber(p).getNumber('national');
      };
      const phone = (p) => { return { text: phoneText(p), href: `tel:${p}` }; };
      const urlText = (u) => {
        return u.replace(/^https?\:\/\//, "").replace(/\/$/, "");
      };
      const fbText = (u) => {
        if (!u.startsWith("http")) {
          return u;
        }
        const pageName = u.replace(/^https?\:\/\/.*facebook\.com\//, "")
              .replace(/\/$/, "")
              .replace(/-\d+$/, "")
              .replace(/-/g, " ");
        return decodeURIComponent(pageName);
      };
      const transform = {
        phone,
        mobile: phone,
        email(email) {
          return { text: email, href: `mailto:${email}` };
        },
        facebook(url) {
          const href = url.startsWith('http') ? url : `https://facebook.com/${url}`;
          return { text: fbText(href), href };
        },
        website(url) {
          const href = url.startsWith('http') ? url : `http://${url}`;
          return { text: urlText(href), href };
        },
        fax(f) {
          return { text: phoneText(f), href: `fax:${f}` };
        }
      };
      const tags = Object.assign({ website: this.place.properties.brand_hours || undefined }, this.place.properties.tags);
      return (name, type = null) => {
        const value = tags[name] || tags[`contact:${name}`];
        if (!value) return;
        return value.split(';').map(transform[name] || transform[type] || (v => { return { text: v, href: v }; }));
      };
    },

    status() {
      return this.place.properties.status;
    }
  }
}
