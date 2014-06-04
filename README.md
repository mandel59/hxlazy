hxlazy
======

A lazy data structure

```haxe
using hxlazy.Lazy;

class Main {

	public static function main() {
		var sideeffect = function(x) { trace("world"); return x; };
		var v = sideeffect(10 + 20).lazy();
		trace("hello");
		trace(v.value);
		trace(v.value);
	}

}
```
