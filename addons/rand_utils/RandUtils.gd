tool
extends Node

func get_rand_bool() -> bool:
	randomize()

	return bool(randi() % 2)

func get_rand_from_array(array: Array, num: int = 1, unique: bool = false):
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
