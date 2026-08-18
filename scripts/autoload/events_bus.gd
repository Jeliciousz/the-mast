extends Node
## Global EventsBus that anything can broadcast on and subscribe to

var subscriptions: Dictionary = {}  # Typed nested collections are not allowed... I guess... but this is a Dictionary[StringName, Array[Callable]]


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


func subscribe(id: StringName, callback: Callable) -> void:
	if not subscriptions.has(id):
		subscriptions.set(id, [callback])
	else:
		var callbacks: Array = subscriptions.get(id)
		if not callbacks.has(callback):
			callbacks.push_back(callback)
			subscriptions.set(id, callbacks)


func broadcast(event: Event) -> void:
	var id: StringName = event.event_id

	if not subscriptions.has(id):
		return

	var callbacks: Array = subscriptions.get(id)
	var i := 0

	while i < callbacks.size():
		var callback: Callable = callbacks[i]
		if not callback.is_valid():
			callbacks.remove_at(i)
		else:
			i += 1

	subscriptions.set(id, callbacks)

	for callback: Callable in callbacks:
		callback.call(event)
