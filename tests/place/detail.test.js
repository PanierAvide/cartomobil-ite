import Vue from 'vue';
import Vuex from 'vuex';
import { shallowMount, createLocalVue } from '@vue/test-utils';
import Detail from '../../components/place/detail';

describe('Detail', () => {
  let localVue;
  let place;
  let store;
  const stubs = ['v-alert', 'v-toolbar', 'v-toolbar-title', 'v-card', 'v-list', 'v-sheet',
                 'v-subheader', 'v-list-item', 'v-list-item-content', 'v-list-item-icon',
                 'v-icon', 'v-btn', 'v-spacer', 'v-footer', 'v-slide-x-reverse-transition'];

  beforeEach(() => {
    localVue = createLocalVue();
    localVue.prototype.$te = () => false;
    localVue.prototype.$t = (key) => key;
    localVue.prototype.$vuetify = { breakpoint: {} };
    localVue.use(Vuex);
    localVue.directive('resize', {});
    localVue.directive('linkified', {});
    localVue.directive('touch', {});
    store = new Vuex.Store({});
  });

  function createWrapper(props) {
    return shallowMount(Detail, {
      localVue,
      stubs,
      store,
      propsData: props
    });
  }

  describe('link', () => {
    let detail;
    beforeEach(() => {
      detail = createWrapper({ id: '' });
    });

    it('add the facebook url if not present', () => {
      detail.vm.place = { properties: { status: 'yes', cat: '', tags: { facebook: 'test' } } };
      expect(detail.vm.link('facebook')).toEqual([{ text: 'test', href: 'https://facebook.com/test' }]);

      detail.vm.place.properties.tags.facebook = 'https://facebook.com/test2';
      expect(detail.vm.link('facebook')).toEqual([{ text: 'test2', href: 'https://facebook.com/test2' }]);
    });

    it('format the facebook text', () => {
      detail.vm.place = { properties: { status: 'yes', cat: '', tags: { facebook: 'https://www.facebook.com/Nature-de-Ch%C3%AAne-2359679770917186/' } } };
      expect(detail.vm.link('facebook')[0].text).toEqual('Nature de Chêne');
    });

    it('returns website', () => {
      detail.vm.place = { properties: { status: 'yes', cat: '', tags: { website: 'example.com' } } };
      expect(detail.vm.link('website')).toEqual([{ text: 'example.com', href: 'http://example.com' }]);

      detail.vm.place.properties.tags.website = 'http://example.com';
      expect(detail.vm.link('website')).toEqual([{ text: 'example.com', href: 'http://example.com' }]);
    });

    it('returns email', () => {
      detail.vm.place = { properties: { status: 'yes', cat: '', tags: { email: 'test@example.net' } } };
      expect(detail.vm.link('email')).toEqual([{ text: 'test@example.net', href: 'mailto:test@example.net' }]);
    });

    it('returns multiple emails', () => {
      detail.vm.place = { properties: { status: 'yes', cat: '', tags: { email: 'test@example.net;test2@example.net' } } };
      expect(detail.vm.link('email')).toEqual([{ text: 'test@example.net', href: 'mailto:test@example.net' },
                                                  { text: 'test2@example.net', href: 'mailto:test2@example.net' }]);
    });

    it('returns phone', () => {
      detail.vm.place = { properties: { status: 'yes', cat: '', tags: { phone: '+33123456789' } } };
      expect(detail.vm.link('phone')).toEqual([{ text: '01 23 45 67 89', href: 'tel:+33123456789' }]);
    });

    it('returns mobile', () => {
      detail.vm.place = { properties: { status: 'yes', cat: '', tags: { mobile: '+33123456789' } } };
      expect(detail.vm.link('mobile')).toEqual([{ text: '01 23 45 67 89', href: 'tel:+33123456789' }]);
    });

    it('returns fax', () => {
      detail.vm.place = { properties: { status: 'yes', cat: '', tags: { fax: '+33123456789' } } };
      expect(detail.vm.link('fax')).toEqual([{ text: '01 23 45 67 89', href: 'fax:+33123456789' }]);
    });

    it('returns nothing', () => {
      detail.vm.place = { properties: { status: 'yes', cat: '', tags: { } } };
      expect(detail.vm.link('fax')).toBe(undefined);
    });
  });
});
