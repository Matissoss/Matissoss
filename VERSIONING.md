# Version names explained and which one to choose

General versioning name pattern goes like this:
```
v<Main Version>.<Sub Version>.<Minor Version>-<Variant 1>-<Codename>
```
Explaination:
- `<Main Version>`  : Major changes, non-compatible with previous one,
- `<Sub Version>`   : Minor changes, often not-compatibility breaking,
- `<Minor Version>` : Small changes, not-compatibility breaking, bugfixes/hotfixes
- `<Variant 1>`     : Dev, Stable -> Dev contains features that might not be in stable releases, Stable contains only features that were tested
- `<Codename>`      : Like some projects do, naming their versions after f.e.: chemistry elements.

## Example of Versions

- `v1.7.5-dev-hydrogen`,
- `v0.6.10-dev-tree`,
- `v2.8.8-stable-cat`
