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

If you need a Markdown format output for text exitor previews, just use `cp apiary.apib apiary.md`; the `.md` file will be ignored for other developers.

## API Blueprint Tips and Tricks
- View a file's output in the [live editor](https://app.apiary.io/adstageapi/editor) for proofreading.
- Especially when describing JSON, the `apib` parser struggles to understand that underscores are valid. Escape underscores with backticks to allow correct parsing
- The formatter does not expect enums with a single option and inconsistently formats their option values. Instead, describe a single option enum's type and required value and wait until additional values become available before officially changing its typing to enum.
- APIary _really_ wants you to group together endpoints by resource. Try to group resources in the same URL namespace together; if they interact across namespaces, leave links between the resources instead of putting them in the same group.
- When adding a Markdown `h1` header (`#`), APIary will not render it if the previous `h1` block included an API definition. Use `# Group Foo` instead of `# Foo` to [create a new `apib` grouping instead](https://help.apiary.io/api_101/api_blueprint_tutorial/#resource-groups).
- If a JSON body is an array rather than an object, the top-level array must be named as a parameter (e.g. `+ mylist (array)`). Prefer rendering object responses with the list representer to avoid this problem, but it is acceptable to give a descriptive "name" to the outer array to force attributes to render.
- Parsing response definitions containing with nested parameters is pretty finicky. The main trick is to get all of the description onto the same line; the line-break documentation approach won't work in this case.
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
