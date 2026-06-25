# Brand images (use your files — do not auto-generate)

| File | Use |
|------|-----|
| `app_logo.png` | Gold mark on black — dark splash, app chrome, landing |
| `app_logo_light.png` | **Black mark on white** — light splash only (the image you provided in chat) |

Save your black-on-white logo as `app_logo_light.png` in this folder.

Then run from project root:

```bash
dart run tool/copy_brand_logos.dart
dart run flutter_native_splash:create
```
