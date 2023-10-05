## Testing

To test the formula locally run

```bash
ruby script/render.rb > Formula/snyk.rb && brew install --build-from-source Formula/snyk.rb
```