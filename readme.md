# guide
## setup
```
supebase init # first time only
supabase start -x vector
```
## build
```
dart compile js lib/main.dart -o supabase/functions/build/main.js
```
## run 
```
supabase functions serve
```