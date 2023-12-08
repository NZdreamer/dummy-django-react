import logo from './logo.svg';
import './App.css';
import {useState, useEffect} from 'react';

function App() {

  const [data, setData] = useState(null);

  useEffect(() => {
    fetch('${process.env.REACT_APP_BACKEND_URL}/test/')
      .then(res => res.json())
      // .then(data => setData(data.data));
      .then(data => console.log(data));
  })

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <div>qqqqqqqqqqqqqqqqqqqqqqqqqqqq</div>
        <div>{data}</div>
      </header>
    </div>
  );
}

export default App;
