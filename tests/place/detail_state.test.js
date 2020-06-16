import Vue from 'vue';
import { shallowMount, createLocalVue } from '@vue/test-utils';
import DetailState from '../../components/place/detail_state';
import ContributeForm from '../../components/contribute_form';

describe('DetailState', () => {
  let localVue;
  const stubs = ['v-alert', 'v-divider', 'v-btn'];

  beforeEach(() => {
    localVue = createLocalVue();
    localVue.prototype.$t = () => {};
  });

  function createWrapper(props) {
    return shallowMount(DetailState, {
      localVue,
      stubs,
      propsData: props
    });
  }

  it('returns the state when yes', () => {
    const detail = createWrapper({ status: 'yes', place: {} });
    expect(detail.vm.type).toEqual('success');
  });

  it('returns the state when limited', () => {
    const detail = createWrapper({ status: 'limited', place: {} });
    expect(detail.vm.type).toEqual('success');
  });

  it('returns the state when unknown', () => {
    const detail = createWrapper({ status: 'unknown', place: {} });
    expect(detail.vm.type).toEqual('warning');
  });

  it('returns the state when no', () => {
    const detail = createWrapper({ status: 'no', place: {} });
    expect(detail.vm.type).toEqual('error');
  });

  it('open the contribute form', async () => {
    const detail = createWrapper({ status: 'unknown', place: {} });
    expect(detail.findComponent(ContributeForm).exists()).toBe(false);
    detail.vm.contribute = true;
    await Vue.nextTick();
    expect(detail.findComponent(ContributeForm).exists()).toBe(true);
  });
});
