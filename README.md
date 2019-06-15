# api-documentation
AdStage Data API Documentation for our external customers using [API Blueprint](https://apiblueprint.org/).

## Developer Setup
1. Install the correct node version with `asdf install`.
1. Install the dev packages with `yarn install`.

## Modular Blueprints
We use [Hercule](https://github.com/jamesramsay/hercule/) as recommended by the API Blueprint crew to transclude resources into an ultimate blueprint file from modular sources. The downside is that we can not edit the blueprint in the native UI with this setup. Instead, edit this in your favorite local editor, run the blueprint generation process below, and push the output file to github.

### Blueprint generation:
```
hercule src/root.apib -o apiary.apib
```
