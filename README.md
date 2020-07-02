# Cartomobil'ité

[Cartomobil'ité](https://carto.mobilite.xyz/), la carte collaborative des mobilités actives à Tahiti.

## Architecture

To deploy a complete instance of "Cartomobil'ité", you needs:

- this map (see the Developement section)
- [postgres with postgis and data loaded](db/)
- [pg_tileserv](https://access.crunchydata.com/documentation/pg_tileserv/latest/)
- [pg_featureserv](https://access.crunchydata.com/documentation/pg_featureserv/latest/)
- [Cartomobil'ité backend](https://github.com/osmontrouge/cartomobil-ite_backend) (complementary API)


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

Copyright (c) "Cartomobil'ité" 2020

Initial work by [Ça reste ouvert](https://caresteouvert.fr) team

Released under the AGPL v3 terms, see the [LICENSE](LICENSE.txt) file to read the full text.
