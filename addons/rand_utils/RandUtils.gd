tool
class_name RandUtils extends Resource

# Partial implementation of python's string constants: https://docs.python.org/3/library/string.html
const ASCII_LETTERS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
const ASCII_LOWERCASE = "abcdefghijklmnopqrstuvwxyz"
const ASCII_UPPERCASE = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
const ASCII_DIGITS = "01234567"
const ASCII_PUNCTUATION =  "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"

## Returns a boolean based on a probability
static func get_rand_bool(probability: float = .5) -> bool:
	randomize()

	return bool(randf() < 1 - probability)

## Returns a normalized Vector2
static func get_rand_vec2():
	randomize()

	return Vector2(randf(), randf())

## Returns a normalized Vector3
static func get_rand_vec3():
	randomize()

	return Vector3(randf(), randf(), randf())

## Returns a Color instance with randomized properties
static func get_rand_color(hueMin: float = 0, hueMax: float = 1, saturationMin: float = 0, saturationMax: float = 1, valueMin: float = 0, valueMax: float = 1, alphaMin: float = 1, alphaMax: float = 1):
	randomize()	
	var opaque = alphaMin == alphaMax
	
	return Color.from_hsv(rand_range(hueMin, hueMax), rand_range(saturationMin, saturationMax), rand_range(valueMin, valueMax), 1.0 if opaque else rand_range(alphaMin, alphaMax))

## Returns one or multiple random elements from an array
static func get_rand_from_array(array: Array, num: int = 1, unique: bool = false):
	assert(num >= 1 and num <= len(array), "RandUtils ERROR: Out of bounds.")
	randomize()

	if len(array) == 1:
		return array[0]
	elif num == 1:
		return array[randi() % len(array)]
	else:
		var results = []
		var counter = num

		while counter > 0:
			var index = randi() % len(array)
			results.append(array[index])
			counter -= 1

			if unique:
				array.remove(index)

		return results
