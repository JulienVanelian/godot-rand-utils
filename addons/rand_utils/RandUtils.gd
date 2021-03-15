tool
class_name RandUtils extends Resource

# Partial implementation of python's string constants: https://docs.python.org/3/library/string.html
const ASCII_LETTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
const ASCII_LOWERCASE = "abcdefghijklmnopqrstuvwxyz"
const ASCII_UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
const ASCII_DIGITS = "0123456789"
const ASCII_PUNCTUATION =  "!\"#$%&'()*+, -./:;<=>?@[\\]^_`{|}~"

## Returns a boolean based on a probability
static func bool(probability: float = .5) -> bool:
	randomize()

	return bool(randf() < 1 - probability)

## Returns a normalized Vector2
static func vec2() -> Vector2:
	randomize()

	return Vector2(randf(), randf())

## Returns a normalized Vector3
static func vec3() -> Vector3:
	randomize()

	return Vector3(randf(), randf(), randf())

## Returns a random string containing letters with a given length
static func letters(length: int = 1, unique: bool = false) -> String:
	return from_string(ASCII_LETTERS, length, unique)

## Returns a random string containing alphanumeric characters with a given length
static func alphanumeric(length: int = 1, unique: bool = false) -> String:
	return from_string(ASCII_LETTERS + ASCII_DIGITS, length, unique)

## Returns a random string containing alphanumeric characters with a given length. Letters are lowercase
static func alphanumeric_simple(length: int = 1, unique: bool = false) -> String:
	return from_string(ASCII_LOWERCASE + ASCII_DIGITS, length, unique)

## Returns a random string containing ASCII characters with a given length.
static func string(length: int = 1, unique: bool = false) -> String:
	return from_string(ASCII_LETTERS + ASCII_DIGITS + ASCII_PUNCTUATION, length, unique)

## Returns a random string from a given length and string characters
static func from_string(string, length: int = 1, unique: bool = false) -> String:
	var array: PoolByteArray = from_array(string.to_utf8(), length, unique)
	return array.get_string_from_utf8()


## Returns a Color instance with randomized properties
static func color(hueMin: float = 0, hueMax: float = 1, saturationMin: float = 0, saturationMax: float = 1, valueMin: float = 0, valueMax: float = 1, alphaMin: float = 1, alphaMax: float = 1) -> Color:
	randomize()
	var opaque = alphaMin == alphaMax

	return Color.from_hsv(rand_range(hueMin, hueMax), rand_range(saturationMin, saturationMax), rand_range(valueMin, valueMax), 1.0 if opaque else rand_range(alphaMin, alphaMax))

## Returns a random byte (int)
static func byte() -> int:
	randomize()

	return randi() % 256

## Returns a PoolByteArray filled with n random bytes
static func byte_array(size: int = 1) -> PoolByteArray:
	randomize()
	var array = []

	for i in range(0, size):
		array.append(byte())

	return PoolByteArray(array)

## Returns one or multiple random elements from an array
static func from_array(array: Array, num: int = 1, unique: bool = false) -> Array:
	assert(num >= 1, "RandUtils ERROR: Invalid element count.")

	if unique:
		assert(num <= len(array), "RandUtils ERROR: Ran out of characters.")

	randomize()

	if len(array) == 1:
		return array[0]
	elif num == 1:
		return [array[randi() % len(array)]]
	else:
		var results = []

		while num > 0:
			var index = randi() % len(array)
			results.append(array[index])
			num -= 1

			if unique:
				array.remove(index)

		return results
