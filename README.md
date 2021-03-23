# CartoMobil'ite
![CartoMobil'ite](static/favicon.png)
[CartoMobil'ite](https://carto.mobilite.xyz/) est LA carte collaborative pour une mobilité durable, active et inclusive, à Tahiti et Moorea.

🎯 **Notre premier objectif :** ♿ la mobil'ite pour les fauteuils roulants.

Elle te permet de :
* partager les lieux accessibles, obstacles au déplacement, toilettes et places PMR. Pas besoin d’être en fauteuil roulant pour participer!
* t'informer sur l'accessibilité en fauteuil roulant des lieux et cheminement


## Architecture

To deploy a complete instance of "Cartomobil'ité", you need:

- this map (see the Developement section)
- [postgres with postgis and data loaded](db/)
- [pg_tileserv](https://access.crunchydata.com/documentation/pg_tileserv/latest/)
- [pg_featureserv](https://access.crunchydata.com/documentation/pg_featureserv/latest/)
- [Cartomobil'ité backend](https://github.com/Cartomobil-ite/cartomobil-ite_backend) (complementary API)


## Development

The easiest way to contribute to the map is to use Docker:

```bash
./script/server
```

Otherwise, you can use use yarn:

```bash
yarn install
yarn run sprites
yarn run icons
yarn run dev
```

And go to http://localhost:1234/.

## Data

Data used on our map comes from [OpenStreetMap](https://openstreetmap.org/), the free, worldwide geographic database.


## License

Copyright (c) "CartoMobil'ite" 2021.

## Thanks
CartoMobil'ite is what it is because of some crazy people and free and open source projects. Let's name a few:

* Violaine Doutreleau ([À Vos Cartes](https://avoscartes.pf/), GIS in French Polynesia): Project's mummy
* Adrien Pavie (OpenLevelUp, YoHours): developper
* OpenStreetMap (OSM)
* Team [Ça reste ouvert](https://caresteouvert.fr) : CartoMobil'ite is a fork of this project.
* Mapbox (Website)

Projet réalisé avec le concours de la Polynésie française.

Released under the AGPL v3 terms, see the [LICENSE](LICENSE.txt) file to read the full text.
