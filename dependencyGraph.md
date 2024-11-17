---
title: DependencyGraph
---

A module for working with dependency graphs.

Based on [jriecken/dependency-graph](https://github.com/jriecken/dependency-graph/blob/master)

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

## Types

Type declarations included in the DependencyGraph module.

### DependencyGraph.**DependencyGraphError**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
enum DependencyGraphError<a> {
  CircularDependency(List<a>),
  CircularDependencyList(List<List<a>>),
  NodeDoesNotExist(a),
}
```

An error that can occur when working with a dependency graph.

Variants:

```grain
CircularDependency(List<a>)
```

An error that occurs when a circular dependency is detected.

Contains the dependency chain that caused the circular dependency.

```grain
CircularDependencyList(List<List<a>>)
```

An error that occurs when at least one circular dependency is detected.

Contains a list of circular dependency chains.

```grain
NodeDoesNotExist(a)
```

The node does not exist in the graph.

Contains the key of the node that does not exist.

### DependencyGraph.**Graph**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
type Graph<key, value>
```

A graph data structure that represents dependencies between nodes.

## Values

Functions and constants included in the DependencyGraph module.

### DependencyGraph.**make**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
make : (?circular: Bool) => Graph<a, b>
```

Creates a new dependency graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`?circular`|`Bool`|When true, the graph will allow circular dependencies.|

Returns:

|type|description|
|----|-----------|
|`Graph<a, b>`|A new dependency graph.|

### DependencyGraph.**size**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
size : (graph: Graph<a, b>) => Number
```

Determines the number of nodes in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`graph`|`Graph<a, b>`|The graph to inspect|

Returns:

|type|description|
|----|-----------|
|`Number`|The number of nodes in the graph|

### DependencyGraph.**containsNode**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
containsNode : (key: a, graph: Graph<a, b>) => Bool
```

Determines if the graph contains a node with the given key.

Parameters:

|param|type|description|
|-----|----|-----------|
|`key`|`a`|The key to search for|

Returns:

|type|description|
|----|-----------|
|`Bool`|`true` if the graph contains a node with the given key, `false` otherwise|

### DependencyGraph.**setNode**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
setNode : (key: a, value: b, graph: Graph<a, b>) => Void
```

Adds a new node to the graph. If the node already exists in the graph, the value is replaced.

Parameters:

|param|type|description|
|-----|----|-----------|
|`key`|`a`|The key of the node to add|
|`value`|`b`|The value of the node to add|
|`graph`|`Graph<a, b>`|The graph to modify|

### DependencyGraph.**updateNode**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
updateNode :
  (key: a, fn: (Option<b> => Option<b>), graph: Graph<a, b>) => Void
```

Updates the value of a node in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`key`|`a`|The key of the node to update|
|`fn`|`Option<b> => Option<b>`|The function to apply to the node's value|
|`graph`|`Graph<a, b>`|The graph to modify|

### DependencyGraph.**removeNode**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
removeNode : (key: a, graph: Graph<a, b>) => Bool
```

Removes a node from the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`key`|`a`|The key of the node to remove|
|`graph`|`Graph<a, b>`|The graph to modify|

Returns:

|type|description|
|----|-----------|
|`Bool`|`true` if the node was removed, `false` if the node does not exist|

### DependencyGraph.**getNode**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
getNode : (key: a, graph: Graph<a, b>) => Option<b>
```

Retrieves the value of a node in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`key`|`a`|The key of the node to retrieve|
|`graph`|`Graph<a, b>`|The graph to search|

Returns:

|type|description|
|----|-----------|
|`Option<b>`|`Some(value)` if the node exists, `None` otherwise|

### DependencyGraph.**addDependency**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
addDependency : (fromKey: a, toKey: a, graph: Graph<a, b>) => Bool
```

Adds a dependency between two nodes in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`fromKey`|`a`|The key of the node that depends on the other|
|`toKey`|`a`|The key of the node that is depended on|
|`graph`|`Graph<a, b>`|The graph to modify|

Returns:

|type|description|
|----|-----------|
|`Bool`|`true` if the dependency was added, `false` if either node does not exist|

### DependencyGraph.**removeDependency**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
removeDependency : (fromKey: a, toKey: a, graph: Graph<a, b>) => Bool
```

Removes a dependency between two nodes in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`fromKey`|`a`|The key of the node that depends on the other|
|`toKey`|`a`|The key of the node that is depended on|
|`graph`|`Graph<a, b>`|The graph to modify|

Returns:

|type|description|
|----|-----------|
|`Bool`|`true` if the dependency was removed, `false` if either node does not exist or the dependency does not exist|

### DependencyGraph.**hasDependency**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
hasDependency : (fromKey: a, toKey: a, graph: Graph<a, b>) => Bool
```

Determines if a dependency exists between two nodes in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`fromKey`|`a`|The key of the node that depends on the other|
|`toKey`|`a`|The key of the node that is depended on|

Returns:

|type|description|
|----|-----------|
|`Bool`|`true` if the dependency exists, `false` otherwise|

### DependencyGraph.**entryNodes**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
entryNodes : (graph: Graph<a, b>) => List<a>
```

Gets the nodes in the graph that have no incoming edges.

Parameters:

|param|type|description|
|-----|----|-----------|
|`graph`|`Graph<a, b>`|The graph to search|

Returns:

|type|description|
|----|-----------|
|`List<a>`|The nodes in the graph that have no incoming edges|

### DependencyGraph.**directDependenciesOf**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
directDependenciesOf : (key: a, graph: Graph<a, b>) => List<a>
```

Gets the direct dependencies of a node in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`key`|`a`|The key of the node to get the dependencies of|
|`graph`|`Graph<a, b>`|The graph to search|

Returns:

|type|description|
|----|-----------|
|`List<a>`|An array of the direct dependencies of the node|

### DependencyGraph.**directDependantsOf**

```grain
directDependantsOf : (key: a, graph: Graph<a, b>) => List<a>
```

Gets the direct dependants of a node in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`key`|`a`|The key of the node to get the dependants of|
|`graph`|`Graph<a, b>`|The graph to search|

Returns:

|type|description|
|----|-----------|
|`List<a>`|An array of the direct dependants of the node|

### DependencyGraph.**dependenciesOf**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
dependenciesOf :
  (key: a, graph: Graph<a, b>, ?leavesOnly: Bool) =>
   Result<List<a>, DependencyGraphError<a>>
```

Gets the dependencies of a node in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`key`|`a`|The key of the node to get the dependencies of|
|`graph`|`Graph<a, b>`|The graph to search|
|`?leavesOnly`|`Bool`|When true, only leaf nodes are returned|

Returns:

|type|description|
|----|-----------|
|`Result<List<a>, DependencyGraphError<a>>`|`Ok(dependencies)` if the node exists, `Err(error)` otherwise|

### DependencyGraph.**dependantsOf**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
dependantsOf :
  (key: a, graph: Graph<a, b>, ?leavesOnly: Bool) =>
   Result<List<a>, DependencyGraphError<a>>
```

Gets the dependants of a node in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`key`|`a`|The key of the node to get the dependants of|
|`graph`|`Graph<a, b>`|The graph to search|
|`?leavesOnly`|`Bool`|When true, only leaf nodes are returned|

Returns:

|type|description|
|----|-----------|
|`Result<List<a>, DependencyGraphError<a>>`|`Ok(dependants)` if the node exists, `Err(error)` otherwise|

### DependencyGraph.**getCircularDependencies**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
getCircularDependencies : (graph: Graph<a, b>) => List<List<a>>
```

Gets any circular dependencies in the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`graph`|`Graph<a, b>`|The graph to inspect|

Returns:

|type|description|
|----|-----------|
|`List<List<a>>`|A list of circular dependency chains, or an empty list if there are none|

### DependencyGraph.**overallOrder**

<details disabled>
<summary tabindex="-1">Added in <code>0.1.0</code></summary>
No other changes yet.
</details>

```grain
overallOrder :
  (?leavesOnly: Bool, graph: Graph<a, b>) =>
   Result<List<a>, DependencyGraphError<a>>
```

Performs a topological sort on the graph.

Parameters:

|param|type|description|
|-----|----|-----------|
|`?leavesOnly`|`Bool`|When true, only leaf nodes are returned|
|`graph`|`Graph<a, b>`|The graph to sort|

Returns:

|type|description|
|----|-----------|
|`Result<List<a>, DependencyGraphError<a>>`|`Ok(orderedDependencies)` if the sort was successful, `Err(error)` otherwise|

