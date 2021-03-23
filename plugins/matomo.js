import { decode } from '../lib/url';

export default ({ app }) => {
  app.router.afterEach((to, from) => {
    if (to.name === 'index' && decode(from.path).filter === decode(to.path).filter) {
      return;
    }
    if (to.name === 'place' && to.name === from.name && to.params.id === from.params.id) {
      return;
    }

    const _paq = window._paq || [];
    window._paq = _paq;
    window._paq.push(['setCustomUrl', to.path]);
    window._paq.push(['trackPageView']);
  });
};
