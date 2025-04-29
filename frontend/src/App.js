import React, { useEffect, useState } from 'react';

function App() {
  const [backendMessage, setBackendMessage] = useState('');

  useEffect(() => {
    fetch('/api/message')
      .then(res => res.text())
      .then(data => setBackendMessage(data));
  }, []);

  return (
    <div>
      <h2>Hii Team from frontend</h2>
      <h3>{backendMessage}</h3>
    </div>
  );
}

export default App;
