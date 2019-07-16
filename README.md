# api-documentation
AdStage Data API Documentation for our external customers using [API Blueprint](https://apiblueprint.org/).

## Developer Setup
1. Install the correct node version with `asdf install`.
1. Install the dev packages with `yarn install`.

## Modular Blueprints
We use [Hercule](https://github.com/jamesramsay/hercule/) as recommended by the API Blueprint crew to transclude resources into an ultimate blueprint file from modular sources. The downside is that we can not edit the blueprint in the native UI with this setup. Instead, edit this in your favorite local editor, run the blueprint generation process below, and push the output file to github.

### Blueprint generation
Generate the full `apiary.apib` file from the modules:
```
hercule src/root.apib -o apiary.apib
```

## API Blueprint Tips and Tricks
- View a file's output in the [live editor](https://app.apiary.io/adstageapi/editor) for proofreading.
- Especially when describing JSON, the `apib` parser struggles to understand that underscores are valid. Escape underscores with backticks to allow correct parsing
- The formatter does not expect enums with a single option and inconsistently formats their option values. Instead, describe a single option enum's type and required value and wait until additional values become available before officially changing its typing to enum.
- Parsing response definitions containing with nested parameters is pretty finicky. The main trick is to get all of the description onto the same line; the line-break documentation approach won't work in this case.
- When adding a Markdown `h1` header (`#`), APIary will not render it if the previous `h1` block included an API definition. Use `# Group Foo` instead of `# Foo` to [create a new `apib` grouping instead](https://help.apiary.io/api_101/api_blueprint_tutorial/#resource-groups).

```
+ sources: (object, required) - All of this is inline only
    + metrics (object, required) - Again, only inline documentation
        + targets: - Another nested layer, so only inline docs again...
```

## Documentation Review Process:
- Push a development branch.
- Ask a reviewer to look at https://app.apiary.io/adstageapi/editor
  - Note that anchor links within the document may be broken and actually link to the live version's anchors.
- Reviewer can merge to master and APIary should detect the changes in the branch.
- Double check any changed anchor links are not broken and roll back / hotfix if so.
