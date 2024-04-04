import React, { useEffect, useState } from 'react';
import axios from 'axios';

interface Hit {
  _source: {
    [key: string]: any;
  };
}

function App(): JSX.Element {
  const [data, setData] = useState<Hit[]>([]);

  useEffect(() => {
    async function fetchData() {
      try {
        const response = await axios.post('http://localhost:9200/we_are_happy/_search', {
          // Your Elasticsearch search query goes here
          query: {
            match_all: {} // Example match_all query to fetch all documents
          }
        });
        setData(response.data.hits.hits);
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    }

    fetchData();
  }, []);

  return (
    <div>
      <h1>Data from Elasticsearch:</h1>
      <ul>
        {data.map((item, index) => (
          <li key={index}>{JSON.stringify(item._source)}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;