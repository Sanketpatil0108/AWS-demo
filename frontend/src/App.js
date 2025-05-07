import React, { useEffect, useState } from 'react';

function App() {
  const [backendMessage, setBackendMessage] = useState('');

  useEffect(() => {
    // Update the URL to point to the backend container in the Docker network
    const backendUrl = '/api/message';
    
    fetch(backendUrl)
      .then(res => res.text())
      .then(data => setBackendMessage(data))
      .catch(error => {
        console.error('Error fetching message:', error);
      });
  }, []);

  return (
    <div>
      <h2>Hii Sanket 123 from frontend !</h2>
      <h3>{backendMessage}</h3>
    </div>
  );
}

export default App;

