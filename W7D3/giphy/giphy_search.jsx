import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

// Test
import {fetchSearchGiphys} from './util/api_util.js';

window.fetchSearchGiphys = fetchSearchGiphys;
