import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Indigo from './Indigo';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        {/* Your links should go here */}
        <Link to='/red' >Red</Link>
        <NavLink exact to='/blue' >Blue only</NavLink>
        <Link to='/blue/indigo' >Add Indigo</Link>
        <div id="rainbow">
          <Route path="/red" component={Red} />
          <Route path="/blue" component={Blue} />
          <Route path="/blue/indigo" component={Indigo} />\
        </div>
      </div>
    );
  }
};

export default Rainbow;
