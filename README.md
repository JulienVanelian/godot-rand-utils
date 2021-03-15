# Godot RandUtils
A collection of RNG (Random Number Generator) utilities for the Godot Engine.

## Why?
I felt like I was missing RNG utilities while working on my game, so I started working on this addon, and kept adding methods others might need!

## Features
This addon provides:

- Random string generation
- Random boolean with ability to specify probability
- Random normalized Vec2 and Vec3
- Random Color with customizable HSV ranges
- Random item(s) from array
- Random byte(s)

## Installation
1. Clone this repository into your project or, alternatively, use git submodule.
2. Enable the addon in the project settings.

## Usage
This addon provides a `RandUtils` class, which contains static methods used to generate data.
As the methods are static, you don't have to instantiate the class.

```gdscript
## Returns a boolean based on a probability
static func bool(probability: float = .5) -> bool:
```

```gdscript
## Returns a normalized Vector2
static func vec2() -> Vector2:
```

```gdscript
## Returns a normalized Vector3
static func vec3() -> Vector3:
```

```gdscript
## Returns a random string containing letters with a given length
static func letters(length: int = 1, unique: bool = false) -> String:
```

```gdscript
## Returns a random string containing alphanumeric characters with a given length
static func alphanumeric(length: int = 1, unique: bool = false) -> String:
```

```gdscript
## Returns a random string containing alphanumeric characters with a given length. Letters are lowercase
static func alphanumeric_simple(length: int = 1, unique: bool = false) -> String:
```

```gdscript
## Returns a random string containing ASCII characters with a given length.
static func string(length: int = 1, unique: bool = false) -> String:
```

```gdscript
## Returns a random string from a given length and string characters
static func from_string(string, length: int = 1, unique: bool = false) -> String:
```

```gdscript
## Returns a Color instance with randomized properties
static func color(hueMin: float = 0, hueMax: float = 1, saturationMin: float = 0, saturationMax: float = 1, valueMin: float = 0, valueMax: float = 1, alphaMin: float = 1, alphaMax: float = 1) -> Color:
```

```gdscript
## Returns a random byte (int)
static func byte() -> int:
```

```gdscript
## Returns a PoolByteArray filled with n random bytes
static func byte_array(size: int = 1) -> PoolByteArray:
```

```gdscript
## Returns one or multiple random elements from an array
static func from_array(array: Array, num: int = 1, unique: bool = false) -> Array:
```

## Examples

### 70% probability of having a boolean of value `true`
```gdscript
RandUtils.bool(.7)
```

### Getting n elements from an array
```gdscript
var array = ["banana", "apple", "cherry", "cat"]
print(RandUtils.from_array(array, 2))
```
Output: `["apple", "cat"]`


## Licence
This addon is published under the MIT licence.