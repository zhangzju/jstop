## js-top

C++ native addons aimed at get the information of the node application process runtime stats.

Warning: Only support *nix enviroment as we use /proc to get the stats now.

## Add to your project

Download the code:

```javascript
git clone <RepoURL>
```

Compile the addons:

```shell
cd ./addons && node-gyp configure build
```

Add the addons to your module path and require it:

```javascript
const jstop = require("./jstop.node")
```


