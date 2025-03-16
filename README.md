# Alfred configuration

## How to use this repo

download the repo and run the `collect.sh` script in order to generate a workflows.zip

## Workflows that I have made

- [Alfred Kaomoji](https://github.com/stephansama/alfred-kaomoji)

## Workflows that I use

### Misc

- [Visual Studio Code](https://github.com/alexchantastic/alfred-open-with-vscode-workflow)

### [Vitor Galvao](https://github.com/vitorgalvao/alfred-workflows)

- [Alfred Gallery](https://alfred.app/workflows/alfredapp/alfred-gallery/)
- [Banner Be Gone](https://alfred.app/workflows/alfredapp/banner-be-gone/)
- [Dente azul](https://alfred.app/workflows/vitor/dente-azul/)
- [Download Media](https://alfred.app/workflows/vitor/download-media/)
- [Google Suggest](https://alfred.app/workflows/alfredapp/google-suggest/)
- [HEIC to JPEG](https://alfred.app/workflows/alfredapp/heic-to-jpeg/)
- [Rename Action](https://alfred.app/workflows/vitor/rename-action/)
- [Switch Appearance](https://alfred.app/workflows/alfredapp/switch-appearance/)
- [System Settings](https://alfred.app/workflows/alfredapp/system-settings/)

### Collect workflow title script

```js
import { parseStringPromise } from "npm:xml2js";
import fs from "node:fs";

const titleKey = "bundleid";
const workflow_dir = "./workflows/";
const workflows = fs.readdirSync(workflow_dir);

const promises = workflows.map(async (workflow) => {
 const filename = `${workflow_dir}${workflow}/info.plist`;
 const file = fs.readFileSync(filename, { encoding: "utf8" });
 return await parseStringPromise(file);
});

const data = await Promise.all(promises);

const title = data.map((d) => {
 const dict = d.plist.dict.shift();
 return dict.string[dict.key.indexOf(titleKey)];
});

console.log(title.join("\n"));
```
