require('dotenv').config({
    path: process.env.NODE_ENV !== undefined ? "environments/" + process.env.NODE_ENV : 'environments/common'
});

const express = require('express');
const commandeRoutes = require('./src/resource/commande');
const healthRoutes = require('./src/resource/health');
const app = express();
const db = require('./src/models');


app.use(express.json());
app.use('/api/v1/commande', commandeRoutes);
app.use('/api/v1/health',healthRoutes);



db.sequelize.sync().then((req) => {
    app.listen(process.env.PORT, () => {
        console.log(`Serveur démarré sur http://localhost:${process.env.PORT}`);
    });
}).catch(error => {
    console.error('Erreur lors de l\'initialisation de la base de données:', error);
});