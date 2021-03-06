/* eslint global-require: "off"*/
import React from 'react';
import ReactDOM from 'react-dom';
import App from './config';
import { AppContainer } from 'react-hot-loader';
import injectTapEventPlugin from 'react-tap-event-plugin';
import objectAssign from 'object-assign';

window.Object.assign = window.Object.assign || objectAssign;

injectTapEventPlugin();

const rootEl = document.getElementById('root');
ReactDOM.render(
  <AppContainer>
    <App />
  </AppContainer>,
   rootEl
 );

if (module.hot) {
  module.hot.accept('./config', () => {
    // If you use Webpack 2 in ES modules mode, you can
    // use <App /> here rather than require() a <NextApp />.
    const NextApp = require('./config').default;
    ReactDOM.render(
      <AppContainer>
        <NextApp />
      </AppContainer>,
      rootEl
    );
  });
}
