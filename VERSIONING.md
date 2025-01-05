# Version names explained and which one to choose

General versioning name pattern goes like this:
```
v<Main Version>.<Sub Version>.<Minor Version>-<Variant 1>-<Variant 2>
```
Explaination:
- `<Main Version>`  : Major changes, non-compatible with previous one,
- `<Sub Version>`   : Minor changes, often not-compatibility breaking,
- `<Minor Version>` : Small changes, not-compatibility breaking, bugfixes/hotfixes
- `<Variant 1>`     : Copper, Silver, Gold -> How deployment-ready it is? (least to most)
- `<Variant 2>`     : Dev, Stable -> Dev contains features that might not be in stable releases, Stable contains only features that were tested

## Example of Versions

- `v1.7.5-gold-stable`,
- `v0.6.10-silver-dev`,
- `v2.8.8-copper-dev`

# Hierarchy (Ascending)

| **Variant 1** | **Variant 2** | **Description**                                                              |
|:-------------:|:-------------:|:----------------------------------------------------------------------------:|
| Copper        | Dev           | Experimental version with bleeding-edge functionality, highly unstable.      |
| Silver        | Dev           | Improved version of Copper Dev, with major bug fixes and patches.            |
| Gold          | Dev           | Polished pre-stable version, containing minor issues to be resolved.         |
| Copper        | Stable        | Early stable version, deployable but not fully tested or patched.            |
| Silver        | Stable        | Stable version under final testing for production readiness.                 |
| Gold          | Stable        | Fully polished, production-ready version, ideal for end-users, bug-free[^1]. |

[^1]: "Bug-free" indicates very few to no bugs remaining, based on extensive testing.
