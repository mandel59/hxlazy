package hxlazy;

import haxe.macro.Expr;

private enum LazyValue<T> {
	Thunk(t : Void -> T);
	Value(v : T);
}

class Lazy<T> {
	public var value(get,null) : T;

	var v : LazyValue<T>;

	macro public static function lazy(e : Expr) : Expr {
		return macro new Lazy(function() { return $e; });
	}

	public function new(t : Void -> T) {
		this.v = Thunk(t);
	}

	function get_value() {
		switch(this.v) {
		case Thunk(f):
			var v = f();
			this.v = Value(v);
			return v;
		case Value(v):
			return v;
		}
	}

}
