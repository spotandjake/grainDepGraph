# Format and generate docs
grain doc ./dependencyGraph.gr -o ./dependencyGraph.md --current-version=v0.1.0
grain format ./ -o ./
# Tests
grain ./dependencyGraph.test.gr
# Clean
rm *.gr.wasm