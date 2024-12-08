const express = require('express');
const { MongoClient } = require('mongodb');
const app = express();

const mongoUrl = 'mongodb+srv://doadmin:g82e75ZHyKn3406G@group3-db-bab860b8.mongo.ondigitalocean.com/admin?tls=true&authSource=admin&replicaSet=group3-db';
const dbName = 'admin';

app.get('/api/vulnerabilities', async (req, res) => {
    const { category } = req.query;
    
    try {
        const client = await MongoClient.connect(mongoUrl);
        const db = client.db(dbName);
        
        const vulnerabilities = await db.collection('vulnerabilities')
            .find({ severity: category })
            .limit(20)  // Limit results for performance
            .toArray();
            
        await client.close();
        res.json(vulnerabilities);
    } catch (error) {
        res.status(500).json({ error: 'Error fetching vulnerabilities' });
    }
});

app.listen(3000, () => {
    console.log('API server running on port 3000');
});