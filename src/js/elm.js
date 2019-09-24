(function(scope){
'use strict';

function F(arity, fun, wrapper) {
  wrapper.a = arity;
  wrapper.f = fun;
  return wrapper;
}

function F2(fun) {
  return F(2, fun, function(a) { return function(b) { return fun(a,b); }; })
}
function F3(fun) {
  return F(3, fun, function(a) {
    return function(b) { return function(c) { return fun(a, b, c); }; };
  });
}
function F4(fun) {
  return F(4, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return fun(a, b, c, d); }; }; };
  });
}
function F5(fun) {
  return F(5, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return fun(a, b, c, d, e); }; }; }; };
  });
}
function F6(fun) {
  return F(6, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return fun(a, b, c, d, e, f); }; }; }; }; };
  });
}
function F7(fun) {
  return F(7, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return fun(a, b, c, d, e, f, g); }; }; }; }; }; };
  });
}
function F8(fun) {
  return F(8, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return function(h) {
    return fun(a, b, c, d, e, f, g, h); }; }; }; }; }; }; };
  });
}
function F9(fun) {
  return F(9, fun, function(a) { return function(b) { return function(c) {
    return function(d) { return function(e) { return function(f) {
    return function(g) { return function(h) { return function(i) {
    return fun(a, b, c, d, e, f, g, h, i); }; }; }; }; }; }; }; };
  });
}

function A2(fun, a, b) {
  return fun.a === 2 ? fun.f(a, b) : fun(a)(b);
}
function A3(fun, a, b, c) {
  return fun.a === 3 ? fun.f(a, b, c) : fun(a)(b)(c);
}
function A4(fun, a, b, c, d) {
  return fun.a === 4 ? fun.f(a, b, c, d) : fun(a)(b)(c)(d);
}
function A5(fun, a, b, c, d, e) {
  return fun.a === 5 ? fun.f(a, b, c, d, e) : fun(a)(b)(c)(d)(e);
}
function A6(fun, a, b, c, d, e, f) {
  return fun.a === 6 ? fun.f(a, b, c, d, e, f) : fun(a)(b)(c)(d)(e)(f);
}
function A7(fun, a, b, c, d, e, f, g) {
  return fun.a === 7 ? fun.f(a, b, c, d, e, f, g) : fun(a)(b)(c)(d)(e)(f)(g);
}
function A8(fun, a, b, c, d, e, f, g, h) {
  return fun.a === 8 ? fun.f(a, b, c, d, e, f, g, h) : fun(a)(b)(c)(d)(e)(f)(g)(h);
}
function A9(fun, a, b, c, d, e, f, g, h, i) {
  return fun.a === 9 ? fun.f(a, b, c, d, e, f, g, h, i) : fun(a)(b)(c)(d)(e)(f)(g)(h)(i);
}




var _Bitwise_and = F2(function(a, b)
{
	return a & b;
});

var _Bitwise_or = F2(function(a, b)
{
	return a | b;
});

var _Bitwise_xor = F2(function(a, b)
{
	return a ^ b;
});

function _Bitwise_complement(a)
{
	return ~a;
};

var _Bitwise_shiftLeftBy = F2(function(offset, a)
{
	return a << offset;
});

var _Bitwise_shiftRightBy = F2(function(offset, a)
{
	return a >> offset;
});

var _Bitwise_shiftRightZfBy = F2(function(offset, a)
{
	return a >>> offset;
});



var _JsArray_empty = [];

function _JsArray_singleton(value)
{
    return [value];
}

function _JsArray_length(array)
{
    return array.length;
}

var _JsArray_initialize = F3(function(size, offset, func)
{
    var result = new Array(size);

    for (var i = 0; i < size; i++)
    {
        result[i] = func(offset + i);
    }

    return result;
});

var _JsArray_initializeFromList = F2(function (max, ls)
{
    var result = new Array(max);

    for (var i = 0; i < max && ls.b; i++)
    {
        result[i] = ls.a;
        ls = ls.b;
    }

    result.length = i;
    return _Utils_Tuple2(result, ls);
});

var _JsArray_unsafeGet = F2(function(index, array)
{
    return array[index];
});

var _JsArray_unsafeSet = F3(function(index, value, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = array[i];
    }

    result[index] = value;
    return result;
});

var _JsArray_push = F2(function(value, array)
{
    var length = array.length;
    var result = new Array(length + 1);

    for (var i = 0; i < length; i++)
    {
        result[i] = array[i];
    }

    result[length] = value;
    return result;
});

var _JsArray_foldl = F3(function(func, acc, array)
{
    var length = array.length;

    for (var i = 0; i < length; i++)
    {
        acc = A2(func, array[i], acc);
    }

    return acc;
});

var _JsArray_foldr = F3(function(func, acc, array)
{
    for (var i = array.length - 1; i >= 0; i--)
    {
        acc = A2(func, array[i], acc);
    }

    return acc;
});

var _JsArray_map = F2(function(func, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = func(array[i]);
    }

    return result;
});

var _JsArray_indexedMap = F3(function(func, offset, array)
{
    var length = array.length;
    var result = new Array(length);

    for (var i = 0; i < length; i++)
    {
        result[i] = A2(func, offset + i, array[i]);
    }

    return result;
});

var _JsArray_slice = F3(function(from, to, array)
{
    return array.slice(from, to);
});

var _JsArray_appendN = F3(function(n, dest, source)
{
    var destLen = dest.length;
    var itemsToCopy = n - destLen;

    if (itemsToCopy > source.length)
    {
        itemsToCopy = source.length;
    }

    var size = destLen + itemsToCopy;
    var result = new Array(size);

    for (var i = 0; i < destLen; i++)
    {
        result[i] = dest[i];
    }

    for (var i = 0; i < itemsToCopy; i++)
    {
        result[i + destLen] = source[i];
    }

    return result;
});



var _List_Nil = { $: 0 };
var _List_Nil_UNUSED = { $: '[]' };

function _List_Cons(hd, tl) { return { $: 1, a: hd, b: tl }; }
function _List_Cons_UNUSED(hd, tl) { return { $: '::', a: hd, b: tl }; }


var _List_cons = F2(_List_Cons);

function _List_fromArray(arr)
{
	var out = _List_Nil;
	for (var i = arr.length; i--; )
	{
		out = _List_Cons(arr[i], out);
	}
	return out;
}

function _List_toArray(xs)
{
	for (var out = []; xs.b; xs = xs.b) // WHILE_CONS
	{
		out.push(xs.a);
	}
	return out;
}

var _List_map2 = F3(function(f, xs, ys)
{
	for (var arr = []; xs.b && ys.b; xs = xs.b, ys = ys.b) // WHILE_CONSES
	{
		arr.push(A2(f, xs.a, ys.a));
	}
	return _List_fromArray(arr);
});

var _List_map3 = F4(function(f, xs, ys, zs)
{
	for (var arr = []; xs.b && ys.b && zs.b; xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
	{
		arr.push(A3(f, xs.a, ys.a, zs.a));
	}
	return _List_fromArray(arr);
});

var _List_map4 = F5(function(f, ws, xs, ys, zs)
{
	for (var arr = []; ws.b && xs.b && ys.b && zs.b; ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
	{
		arr.push(A4(f, ws.a, xs.a, ys.a, zs.a));
	}
	return _List_fromArray(arr);
});

var _List_map5 = F6(function(f, vs, ws, xs, ys, zs)
{
	for (var arr = []; vs.b && ws.b && xs.b && ys.b && zs.b; vs = vs.b, ws = ws.b, xs = xs.b, ys = ys.b, zs = zs.b) // WHILE_CONSES
	{
		arr.push(A5(f, vs.a, ws.a, xs.a, ys.a, zs.a));
	}
	return _List_fromArray(arr);
});

var _List_sortBy = F2(function(f, xs)
{
	return _List_fromArray(_List_toArray(xs).sort(function(a, b) {
		return _Utils_cmp(f(a), f(b));
	}));
});

var _List_sortWith = F2(function(f, xs)
{
	return _List_fromArray(_List_toArray(xs).sort(function(a, b) {
		var ord = A2(f, a, b);
		return ord === elm$core$Basics$EQ ? 0 : ord === elm$core$Basics$LT ? -1 : 1;
	}));
});



// LOG

var _Debug_log = F2(function(tag, value)
{
	return value;
});

var _Debug_log_UNUSED = F2(function(tag, value)
{
	console.log(tag + ': ' + _Debug_toString(value));
	return value;
});


// TODOS

function _Debug_todo(moduleName, region)
{
	return function(message) {
		_Debug_crash(8, moduleName, region, message);
	};
}

function _Debug_todoCase(moduleName, region, value)
{
	return function(message) {
		_Debug_crash(9, moduleName, region, value, message);
	};
}


// TO STRING

function _Debug_toString(value)
{
	return '<internals>';
}

function _Debug_toString_UNUSED(value)
{
	return _Debug_toAnsiString(false, value);
}

function _Debug_toAnsiString(ansi, value)
{
	if (typeof value === 'function')
	{
		return _Debug_internalColor(ansi, '<function>');
	}

	if (typeof value === 'boolean')
	{
		return _Debug_ctorColor(ansi, value ? 'True' : 'False');
	}

	if (typeof value === 'number')
	{
		return _Debug_numberColor(ansi, value + '');
	}

	if (value instanceof String)
	{
		return _Debug_charColor(ansi, "'" + _Debug_addSlashes(value, true) + "'");
	}

	if (typeof value === 'string')
	{
		return _Debug_stringColor(ansi, '"' + _Debug_addSlashes(value, false) + '"');
	}

	if (typeof value === 'object' && '$' in value)
	{
		var tag = value.$;

		if (typeof tag === 'number')
		{
			return _Debug_internalColor(ansi, '<internals>');
		}

		if (tag[0] === '#')
		{
			var output = [];
			for (var k in value)
			{
				if (k === '$') continue;
				output.push(_Debug_toAnsiString(ansi, value[k]));
			}
			return '(' + output.join(',') + ')';
		}

		if (tag === 'Set_elm_builtin')
		{
			return _Debug_ctorColor(ansi, 'Set')
				+ _Debug_fadeColor(ansi, '.fromList') + ' '
				+ _Debug_toAnsiString(ansi, elm$core$Set$toList(value));
		}

		if (tag === 'RBNode_elm_builtin' || tag === 'RBEmpty_elm_builtin')
		{
			return _Debug_ctorColor(ansi, 'Dict')
				+ _Debug_fadeColor(ansi, '.fromList') + ' '
				+ _Debug_toAnsiString(ansi, elm$core$Dict$toList(value));
		}

		if (tag === 'Array_elm_builtin')
		{
			return _Debug_ctorColor(ansi, 'Array')
				+ _Debug_fadeColor(ansi, '.fromList') + ' '
				+ _Debug_toAnsiString(ansi, elm$core$Array$toList(value));
		}

		if (tag === '::' || tag === '[]')
		{
			var output = '[';

			value.b && (output += _Debug_toAnsiString(ansi, value.a), value = value.b)

			for (; value.b; value = value.b) // WHILE_CONS
			{
				output += ',' + _Debug_toAnsiString(ansi, value.a);
			}
			return output + ']';
		}

		var output = '';
		for (var i in value)
		{
			if (i === '$') continue;
			var str = _Debug_toAnsiString(ansi, value[i]);
			var c0 = str[0];
			var parenless = c0 === '{' || c0 === '(' || c0 === '[' || c0 === '<' || c0 === '"' || str.indexOf(' ') < 0;
			output += ' ' + (parenless ? str : '(' + str + ')');
		}
		return _Debug_ctorColor(ansi, tag) + output;
	}

	if (typeof DataView === 'function' && value instanceof DataView)
	{
		return _Debug_stringColor(ansi, '<' + value.byteLength + ' bytes>');
	}

	if (typeof File === 'function' && value instanceof File)
	{
		return _Debug_internalColor(ansi, '<' + value.name + '>');
	}

	if (typeof value === 'object')
	{
		var output = [];
		for (var key in value)
		{
			var field = key[0] === '_' ? key.slice(1) : key;
			output.push(_Debug_fadeColor(ansi, field) + ' = ' + _Debug_toAnsiString(ansi, value[key]));
		}
		if (output.length === 0)
		{
			return '{}';
		}
		return '{ ' + output.join(', ') + ' }';
	}

	return _Debug_internalColor(ansi, '<internals>');
}

function _Debug_addSlashes(str, isChar)
{
	var s = str
		.replace(/\\/g, '\\\\')
		.replace(/\n/g, '\\n')
		.replace(/\t/g, '\\t')
		.replace(/\r/g, '\\r')
		.replace(/\v/g, '\\v')
		.replace(/\0/g, '\\0');

	if (isChar)
	{
		return s.replace(/\'/g, '\\\'');
	}
	else
	{
		return s.replace(/\"/g, '\\"');
	}
}

function _Debug_ctorColor(ansi, string)
{
	return ansi ? '\x1b[96m' + string + '\x1b[0m' : string;
}

function _Debug_numberColor(ansi, string)
{
	return ansi ? '\x1b[95m' + string + '\x1b[0m' : string;
}

function _Debug_stringColor(ansi, string)
{
	return ansi ? '\x1b[93m' + string + '\x1b[0m' : string;
}

function _Debug_charColor(ansi, string)
{
	return ansi ? '\x1b[92m' + string + '\x1b[0m' : string;
}

function _Debug_fadeColor(ansi, string)
{
	return ansi ? '\x1b[37m' + string + '\x1b[0m' : string;
}

function _Debug_internalColor(ansi, string)
{
	return ansi ? '\x1b[94m' + string + '\x1b[0m' : string;
}

function _Debug_toHexDigit(n)
{
	return String.fromCharCode(n < 10 ? 48 + n : 55 + n);
}


// CRASH


function _Debug_crash(identifier)
{
	throw new Error('https://github.com/elm/core/blob/1.0.0/hints/' + identifier + '.md');
}


function _Debug_crash_UNUSED(identifier, fact1, fact2, fact3, fact4)
{
	switch(identifier)
	{
		case 0:
			throw new Error('What node should I take over? In JavaScript I need something like:\n\n    Elm.Main.init({\n        node: document.getElementById("elm-node")\n    })\n\nYou need to do this with any Browser.sandbox or Browser.element program.');

		case 1:
			throw new Error('Browser.application programs cannot handle URLs like this:\n\n    ' + document.location.href + '\n\nWhat is the root? The root of your file system? Try looking at this program with `elm reactor` or some other server.');

		case 2:
			var jsonErrorString = fact1;
			throw new Error('Problem with the flags given to your Elm program on initialization.\n\n' + jsonErrorString);

		case 3:
			var portName = fact1;
			throw new Error('There can only be one port named `' + portName + '`, but your program has multiple.');

		case 4:
			var portName = fact1;
			var problem = fact2;
			throw new Error('Trying to send an unexpected type of value through port `' + portName + '`:\n' + problem);

		case 5:
			throw new Error('Trying to use `(==)` on functions.\nThere is no way to know if functions are "the same" in the Elm sense.\nRead more about this at https://package.elm-lang.org/packages/elm/core/latest/Basics#== which describes why it is this way and what the better version will look like.');

		case 6:
			var moduleName = fact1;
			throw new Error('Your page is loading multiple Elm scripts with a module named ' + moduleName + '. Maybe a duplicate script is getting loaded accidentally? If not, rename one of them so I know which is which!');

		case 8:
			var moduleName = fact1;
			var region = fact2;
			var message = fact3;
			throw new Error('TODO in module `' + moduleName + '` ' + _Debug_regionToString(region) + '\n\n' + message);

		case 9:
			var moduleName = fact1;
			var region = fact2;
			var value = fact3;
			var message = fact4;
			throw new Error(
				'TODO in module `' + moduleName + '` from the `case` expression '
				+ _Debug_regionToString(region) + '\n\nIt received the following value:\n\n    '
				+ _Debug_toString(value).replace('\n', '\n    ')
				+ '\n\nBut the branch that handles it says:\n\n    ' + message.replace('\n', '\n    ')
			);

		case 10:
			throw new Error('Bug in https://github.com/elm/virtual-dom/issues');

		case 11:
			throw new Error('Cannot perform mod 0. Division by zero error.');
	}
}

function _Debug_regionToString(region)
{
	if (region.cm.E === region.am.E)
	{
		return 'on line ' + region.cm.E;
	}
	return 'on lines ' + region.cm.E + ' through ' + region.am.E;
}



// EQUALITY

function _Utils_eq(x, y)
{
	for (
		var pair, stack = [], isEqual = _Utils_eqHelp(x, y, 0, stack);
		isEqual && (pair = stack.pop());
		isEqual = _Utils_eqHelp(pair.a, pair.b, 0, stack)
		)
	{}

	return isEqual;
}

function _Utils_eqHelp(x, y, depth, stack)
{
	if (depth > 100)
	{
		stack.push(_Utils_Tuple2(x,y));
		return true;
	}

	if (x === y)
	{
		return true;
	}

	if (typeof x !== 'object' || x === null || y === null)
	{
		typeof x === 'function' && _Debug_crash(5);
		return false;
	}

	/**_UNUSED/
	if (x.$ === 'Set_elm_builtin')
	{
		x = elm$core$Set$toList(x);
		y = elm$core$Set$toList(y);
	}
	if (x.$ === 'RBNode_elm_builtin' || x.$ === 'RBEmpty_elm_builtin')
	{
		x = elm$core$Dict$toList(x);
		y = elm$core$Dict$toList(y);
	}
	//*/

	/**/
	if (x.$ < 0)
	{
		x = elm$core$Dict$toList(x);
		y = elm$core$Dict$toList(y);
	}
	//*/

	for (var key in x)
	{
		if (!_Utils_eqHelp(x[key], y[key], depth + 1, stack))
		{
			return false;
		}
	}
	return true;
}

var _Utils_equal = F2(_Utils_eq);
var _Utils_notEqual = F2(function(a, b) { return !_Utils_eq(a,b); });



// COMPARISONS

// Code in Generate/JavaScript.hs, Basics.js, and List.js depends on
// the particular integer values assigned to LT, EQ, and GT.

function _Utils_cmp(x, y, ord)
{
	if (typeof x !== 'object')
	{
		return x === y ? /*EQ*/ 0 : x < y ? /*LT*/ -1 : /*GT*/ 1;
	}

	/**_UNUSED/
	if (x instanceof String)
	{
		var a = x.valueOf();
		var b = y.valueOf();
		return a === b ? 0 : a < b ? -1 : 1;
	}
	//*/

	/**/
	if (typeof x.$ === 'undefined')
	//*/
	/**_UNUSED/
	if (x.$[0] === '#')
	//*/
	{
		return (ord = _Utils_cmp(x.a, y.a))
			? ord
			: (ord = _Utils_cmp(x.b, y.b))
				? ord
				: _Utils_cmp(x.c, y.c);
	}

	// traverse conses until end of a list or a mismatch
	for (; x.b && y.b && !(ord = _Utils_cmp(x.a, y.a)); x = x.b, y = y.b) {} // WHILE_CONSES
	return ord || (x.b ? /*GT*/ 1 : y.b ? /*LT*/ -1 : /*EQ*/ 0);
}

var _Utils_lt = F2(function(a, b) { return _Utils_cmp(a, b) < 0; });
var _Utils_le = F2(function(a, b) { return _Utils_cmp(a, b) < 1; });
var _Utils_gt = F2(function(a, b) { return _Utils_cmp(a, b) > 0; });
var _Utils_ge = F2(function(a, b) { return _Utils_cmp(a, b) >= 0; });

var _Utils_compare = F2(function(x, y)
{
	var n = _Utils_cmp(x, y);
	return n < 0 ? elm$core$Basics$LT : n ? elm$core$Basics$GT : elm$core$Basics$EQ;
});


// COMMON VALUES

var _Utils_Tuple0 = 0;
var _Utils_Tuple0_UNUSED = { $: '#0' };

function _Utils_Tuple2(a, b) { return { a: a, b: b }; }
function _Utils_Tuple2_UNUSED(a, b) { return { $: '#2', a: a, b: b }; }

function _Utils_Tuple3(a, b, c) { return { a: a, b: b, c: c }; }
function _Utils_Tuple3_UNUSED(a, b, c) { return { $: '#3', a: a, b: b, c: c }; }

function _Utils_chr(c) { return c; }
function _Utils_chr_UNUSED(c) { return new String(c); }


// RECORDS

function _Utils_update(oldRecord, updatedFields)
{
	var newRecord = {};

	for (var key in oldRecord)
	{
		newRecord[key] = oldRecord[key];
	}

	for (var key in updatedFields)
	{
		newRecord[key] = updatedFields[key];
	}

	return newRecord;
}


// APPEND

var _Utils_append = F2(_Utils_ap);

function _Utils_ap(xs, ys)
{
	// append Strings
	if (typeof xs === 'string')
	{
		return xs + ys;
	}

	// append Lists
	if (!xs.b)
	{
		return ys;
	}
	var root = _List_Cons(xs.a, ys);
	xs = xs.b
	for (var curr = root; xs.b; xs = xs.b) // WHILE_CONS
	{
		curr = curr.b = _List_Cons(xs.a, ys);
	}
	return root;
}



// MATH

var _Basics_add = F2(function(a, b) { return a + b; });
var _Basics_sub = F2(function(a, b) { return a - b; });
var _Basics_mul = F2(function(a, b) { return a * b; });
var _Basics_fdiv = F2(function(a, b) { return a / b; });
var _Basics_idiv = F2(function(a, b) { return (a / b) | 0; });
var _Basics_pow = F2(Math.pow);

var _Basics_remainderBy = F2(function(b, a) { return a % b; });

// https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/divmodnote-letter.pdf
var _Basics_modBy = F2(function(modulus, x)
{
	var answer = x % modulus;
	return modulus === 0
		? _Debug_crash(11)
		:
	((answer > 0 && modulus < 0) || (answer < 0 && modulus > 0))
		? answer + modulus
		: answer;
});


// TRIGONOMETRY

var _Basics_pi = Math.PI;
var _Basics_e = Math.E;
var _Basics_cos = Math.cos;
var _Basics_sin = Math.sin;
var _Basics_tan = Math.tan;
var _Basics_acos = Math.acos;
var _Basics_asin = Math.asin;
var _Basics_atan = Math.atan;
var _Basics_atan2 = F2(Math.atan2);


// MORE MATH

function _Basics_toFloat(x) { return x; }
function _Basics_truncate(n) { return n | 0; }
function _Basics_isInfinite(n) { return n === Infinity || n === -Infinity; }

var _Basics_ceiling = Math.ceil;
var _Basics_floor = Math.floor;
var _Basics_round = Math.round;
var _Basics_sqrt = Math.sqrt;
var _Basics_log = Math.log;
var _Basics_isNaN = isNaN;


// BOOLEANS

function _Basics_not(bool) { return !bool; }
var _Basics_and = F2(function(a, b) { return a && b; });
var _Basics_or  = F2(function(a, b) { return a || b; });
var _Basics_xor = F2(function(a, b) { return a !== b; });



function _Char_toCode(char)
{
	var code = char.charCodeAt(0);
	if (0xD800 <= code && code <= 0xDBFF)
	{
		return (code - 0xD800) * 0x400 + char.charCodeAt(1) - 0xDC00 + 0x10000
	}
	return code;
}

function _Char_fromCode(code)
{
	return _Utils_chr(
		(code < 0 || 0x10FFFF < code)
			? '\uFFFD'
			:
		(code <= 0xFFFF)
			? String.fromCharCode(code)
			:
		(code -= 0x10000,
			String.fromCharCode(Math.floor(code / 0x400) + 0xD800, code % 0x400 + 0xDC00)
		)
	);
}

function _Char_toUpper(char)
{
	return _Utils_chr(char.toUpperCase());
}

function _Char_toLower(char)
{
	return _Utils_chr(char.toLowerCase());
}

function _Char_toLocaleUpper(char)
{
	return _Utils_chr(char.toLocaleUpperCase());
}

function _Char_toLocaleLower(char)
{
	return _Utils_chr(char.toLocaleLowerCase());
}



var _String_cons = F2(function(chr, str)
{
	return chr + str;
});

function _String_uncons(string)
{
	var word = string.charCodeAt(0);
	return word
		? elm$core$Maybe$Just(
			0xD800 <= word && word <= 0xDBFF
				? _Utils_Tuple2(_Utils_chr(string[0] + string[1]), string.slice(2))
				: _Utils_Tuple2(_Utils_chr(string[0]), string.slice(1))
		)
		: elm$core$Maybe$Nothing;
}

var _String_append = F2(function(a, b)
{
	return a + b;
});

function _String_length(str)
{
	return str.length;
}

var _String_map = F2(function(func, string)
{
	var len = string.length;
	var array = new Array(len);
	var i = 0;
	while (i < len)
	{
		var word = string.charCodeAt(i);
		if (0xD800 <= word && word <= 0xDBFF)
		{
			array[i] = func(_Utils_chr(string[i] + string[i+1]));
			i += 2;
			continue;
		}
		array[i] = func(_Utils_chr(string[i]));
		i++;
	}
	return array.join('');
});

var _String_filter = F2(function(isGood, str)
{
	var arr = [];
	var len = str.length;
	var i = 0;
	while (i < len)
	{
		var char = str[i];
		var word = str.charCodeAt(i);
		i++;
		if (0xD800 <= word && word <= 0xDBFF)
		{
			char += str[i];
			i++;
		}

		if (isGood(_Utils_chr(char)))
		{
			arr.push(char);
		}
	}
	return arr.join('');
});

function _String_reverse(str)
{
	var len = str.length;
	var arr = new Array(len);
	var i = 0;
	while (i < len)
	{
		var word = str.charCodeAt(i);
		if (0xD800 <= word && word <= 0xDBFF)
		{
			arr[len - i] = str[i + 1];
			i++;
			arr[len - i] = str[i - 1];
			i++;
		}
		else
		{
			arr[len - i] = str[i];
			i++;
		}
	}
	return arr.join('');
}

var _String_foldl = F3(function(func, state, string)
{
	var len = string.length;
	var i = 0;
	while (i < len)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		i++;
		if (0xD800 <= word && word <= 0xDBFF)
		{
			char += string[i];
			i++;
		}
		state = A2(func, _Utils_chr(char), state);
	}
	return state;
});

var _String_foldr = F3(function(func, state, string)
{
	var i = string.length;
	while (i--)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		if (0xDC00 <= word && word <= 0xDFFF)
		{
			i--;
			char = string[i] + char;
		}
		state = A2(func, _Utils_chr(char), state);
	}
	return state;
});

var _String_split = F2(function(sep, str)
{
	return str.split(sep);
});

var _String_join = F2(function(sep, strs)
{
	return strs.join(sep);
});

var _String_slice = F3(function(start, end, str) {
	return str.slice(start, end);
});

function _String_trim(str)
{
	return str.trim();
}

function _String_trimLeft(str)
{
	return str.replace(/^\s+/, '');
}

function _String_trimRight(str)
{
	return str.replace(/\s+$/, '');
}

function _String_words(str)
{
	return _List_fromArray(str.trim().split(/\s+/g));
}

function _String_lines(str)
{
	return _List_fromArray(str.split(/\r\n|\r|\n/g));
}

function _String_toUpper(str)
{
	return str.toUpperCase();
}

function _String_toLower(str)
{
	return str.toLowerCase();
}

var _String_any = F2(function(isGood, string)
{
	var i = string.length;
	while (i--)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		if (0xDC00 <= word && word <= 0xDFFF)
		{
			i--;
			char = string[i] + char;
		}
		if (isGood(_Utils_chr(char)))
		{
			return true;
		}
	}
	return false;
});

var _String_all = F2(function(isGood, string)
{
	var i = string.length;
	while (i--)
	{
		var char = string[i];
		var word = string.charCodeAt(i);
		if (0xDC00 <= word && word <= 0xDFFF)
		{
			i--;
			char = string[i] + char;
		}
		if (!isGood(_Utils_chr(char)))
		{
			return false;
		}
	}
	return true;
});

var _String_contains = F2(function(sub, str)
{
	return str.indexOf(sub) > -1;
});

var _String_startsWith = F2(function(sub, str)
{
	return str.indexOf(sub) === 0;
});

var _String_endsWith = F2(function(sub, str)
{
	return str.length >= sub.length &&
		str.lastIndexOf(sub) === str.length - sub.length;
});

var _String_indexes = F2(function(sub, str)
{
	var subLen = sub.length;

	if (subLen < 1)
	{
		return _List_Nil;
	}

	var i = 0;
	var is = [];

	while ((i = str.indexOf(sub, i)) > -1)
	{
		is.push(i);
		i = i + subLen;
	}

	return _List_fromArray(is);
});


// TO STRING

function _String_fromNumber(number)
{
	return number + '';
}


// INT CONVERSIONS

function _String_toInt(str)
{
	var total = 0;
	var code0 = str.charCodeAt(0);
	var start = code0 == 0x2B /* + */ || code0 == 0x2D /* - */ ? 1 : 0;

	for (var i = start; i < str.length; ++i)
	{
		var code = str.charCodeAt(i);
		if (code < 0x30 || 0x39 < code)
		{
			return elm$core$Maybe$Nothing;
		}
		total = 10 * total + code - 0x30;
	}

	return i == start
		? elm$core$Maybe$Nothing
		: elm$core$Maybe$Just(code0 == 0x2D ? -total : total);
}


// FLOAT CONVERSIONS

function _String_toFloat(s)
{
	// check if it is a hex, octal, or binary number
	if (s.length === 0 || /[\sxbo]/.test(s))
	{
		return elm$core$Maybe$Nothing;
	}
	var n = +s;
	// faster isNaN check
	return n === n ? elm$core$Maybe$Just(n) : elm$core$Maybe$Nothing;
}

function _String_fromList(chars)
{
	return _List_toArray(chars).join('');
}




/**_UNUSED/
function _Json_errorToString(error)
{
	return elm$json$Json$Decode$errorToString(error);
}
//*/


// CORE DECODERS

function _Json_succeed(msg)
{
	return {
		$: 0,
		a: msg
	};
}

function _Json_fail(msg)
{
	return {
		$: 1,
		a: msg
	};
}

function _Json_decodePrim(decoder)
{
	return { $: 2, b: decoder };
}

var _Json_decodeInt = _Json_decodePrim(function(value) {
	return (typeof value !== 'number')
		? _Json_expecting('an INT', value)
		:
	(-2147483647 < value && value < 2147483647 && (value | 0) === value)
		? elm$core$Result$Ok(value)
		:
	(isFinite(value) && !(value % 1))
		? elm$core$Result$Ok(value)
		: _Json_expecting('an INT', value);
});

var _Json_decodeBool = _Json_decodePrim(function(value) {
	return (typeof value === 'boolean')
		? elm$core$Result$Ok(value)
		: _Json_expecting('a BOOL', value);
});

var _Json_decodeFloat = _Json_decodePrim(function(value) {
	return (typeof value === 'number')
		? elm$core$Result$Ok(value)
		: _Json_expecting('a FLOAT', value);
});

var _Json_decodeValue = _Json_decodePrim(function(value) {
	return elm$core$Result$Ok(_Json_wrap(value));
});

var _Json_decodeString = _Json_decodePrim(function(value) {
	return (typeof value === 'string')
		? elm$core$Result$Ok(value)
		: (value instanceof String)
			? elm$core$Result$Ok(value + '')
			: _Json_expecting('a STRING', value);
});

function _Json_decodeList(decoder) { return { $: 3, b: decoder }; }
function _Json_decodeArray(decoder) { return { $: 4, b: decoder }; }

function _Json_decodeNull(value) { return { $: 5, c: value }; }

var _Json_decodeField = F2(function(field, decoder)
{
	return {
		$: 6,
		d: field,
		b: decoder
	};
});

var _Json_decodeIndex = F2(function(index, decoder)
{
	return {
		$: 7,
		e: index,
		b: decoder
	};
});

function _Json_decodeKeyValuePairs(decoder)
{
	return {
		$: 8,
		b: decoder
	};
}

function _Json_mapMany(f, decoders)
{
	return {
		$: 9,
		f: f,
		g: decoders
	};
}

var _Json_andThen = F2(function(callback, decoder)
{
	return {
		$: 10,
		b: decoder,
		h: callback
	};
});

function _Json_oneOf(decoders)
{
	return {
		$: 11,
		g: decoders
	};
}


// DECODING OBJECTS

var _Json_map1 = F2(function(f, d1)
{
	return _Json_mapMany(f, [d1]);
});

var _Json_map2 = F3(function(f, d1, d2)
{
	return _Json_mapMany(f, [d1, d2]);
});

var _Json_map3 = F4(function(f, d1, d2, d3)
{
	return _Json_mapMany(f, [d1, d2, d3]);
});

var _Json_map4 = F5(function(f, d1, d2, d3, d4)
{
	return _Json_mapMany(f, [d1, d2, d3, d4]);
});

var _Json_map5 = F6(function(f, d1, d2, d3, d4, d5)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5]);
});

var _Json_map6 = F7(function(f, d1, d2, d3, d4, d5, d6)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5, d6]);
});

var _Json_map7 = F8(function(f, d1, d2, d3, d4, d5, d6, d7)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7]);
});

var _Json_map8 = F9(function(f, d1, d2, d3, d4, d5, d6, d7, d8)
{
	return _Json_mapMany(f, [d1, d2, d3, d4, d5, d6, d7, d8]);
});


// DECODE

var _Json_runOnString = F2(function(decoder, string)
{
	try
	{
		var value = JSON.parse(string);
		return _Json_runHelp(decoder, value);
	}
	catch (e)
	{
		return elm$core$Result$Err(A2(elm$json$Json$Decode$Failure, 'This is not valid JSON! ' + e.message, _Json_wrap(string)));
	}
});

var _Json_run = F2(function(decoder, value)
{
	return _Json_runHelp(decoder, _Json_unwrap(value));
});

function _Json_runHelp(decoder, value)
{
	switch (decoder.$)
	{
		case 2:
			return decoder.b(value);

		case 5:
			return (value === null)
				? elm$core$Result$Ok(decoder.c)
				: _Json_expecting('null', value);

		case 3:
			if (!_Json_isArray(value))
			{
				return _Json_expecting('a LIST', value);
			}
			return _Json_runArrayDecoder(decoder.b, value, _List_fromArray);

		case 4:
			if (!_Json_isArray(value))
			{
				return _Json_expecting('an ARRAY', value);
			}
			return _Json_runArrayDecoder(decoder.b, value, _Json_toElmArray);

		case 6:
			var field = decoder.d;
			if (typeof value !== 'object' || value === null || !(field in value))
			{
				return _Json_expecting('an OBJECT with a field named `' + field + '`', value);
			}
			var result = _Json_runHelp(decoder.b, value[field]);
			return (elm$core$Result$isOk(result)) ? result : elm$core$Result$Err(A2(elm$json$Json$Decode$Field, field, result.a));

		case 7:
			var index = decoder.e;
			if (!_Json_isArray(value))
			{
				return _Json_expecting('an ARRAY', value);
			}
			if (index >= value.length)
			{
				return _Json_expecting('a LONGER array. Need index ' + index + ' but only see ' + value.length + ' entries', value);
			}
			var result = _Json_runHelp(decoder.b, value[index]);
			return (elm$core$Result$isOk(result)) ? result : elm$core$Result$Err(A2(elm$json$Json$Decode$Index, index, result.a));

		case 8:
			if (typeof value !== 'object' || value === null || _Json_isArray(value))
			{
				return _Json_expecting('an OBJECT', value);
			}

			var keyValuePairs = _List_Nil;
			// TODO test perf of Object.keys and switch when support is good enough
			for (var key in value)
			{
				if (value.hasOwnProperty(key))
				{
					var result = _Json_runHelp(decoder.b, value[key]);
					if (!elm$core$Result$isOk(result))
					{
						return elm$core$Result$Err(A2(elm$json$Json$Decode$Field, key, result.a));
					}
					keyValuePairs = _List_Cons(_Utils_Tuple2(key, result.a), keyValuePairs);
				}
			}
			return elm$core$Result$Ok(elm$core$List$reverse(keyValuePairs));

		case 9:
			var answer = decoder.f;
			var decoders = decoder.g;
			for (var i = 0; i < decoders.length; i++)
			{
				var result = _Json_runHelp(decoders[i], value);
				if (!elm$core$Result$isOk(result))
				{
					return result;
				}
				answer = answer(result.a);
			}
			return elm$core$Result$Ok(answer);

		case 10:
			var result = _Json_runHelp(decoder.b, value);
			return (!elm$core$Result$isOk(result))
				? result
				: _Json_runHelp(decoder.h(result.a), value);

		case 11:
			var errors = _List_Nil;
			for (var temp = decoder.g; temp.b; temp = temp.b) // WHILE_CONS
			{
				var result = _Json_runHelp(temp.a, value);
				if (elm$core$Result$isOk(result))
				{
					return result;
				}
				errors = _List_Cons(result.a, errors);
			}
			return elm$core$Result$Err(elm$json$Json$Decode$OneOf(elm$core$List$reverse(errors)));

		case 1:
			return elm$core$Result$Err(A2(elm$json$Json$Decode$Failure, decoder.a, _Json_wrap(value)));

		case 0:
			return elm$core$Result$Ok(decoder.a);
	}
}

function _Json_runArrayDecoder(decoder, value, toElmValue)
{
	var len = value.length;
	var array = new Array(len);
	for (var i = 0; i < len; i++)
	{
		var result = _Json_runHelp(decoder, value[i]);
		if (!elm$core$Result$isOk(result))
		{
			return elm$core$Result$Err(A2(elm$json$Json$Decode$Index, i, result.a));
		}
		array[i] = result.a;
	}
	return elm$core$Result$Ok(toElmValue(array));
}

function _Json_isArray(value)
{
	return Array.isArray(value) || (typeof FileList !== 'undefined' && value instanceof FileList);
}

function _Json_toElmArray(array)
{
	return A2(elm$core$Array$initialize, array.length, function(i) { return array[i]; });
}

function _Json_expecting(type, value)
{
	return elm$core$Result$Err(A2(elm$json$Json$Decode$Failure, 'Expecting ' + type, _Json_wrap(value)));
}


// EQUALITY

function _Json_equality(x, y)
{
	if (x === y)
	{
		return true;
	}

	if (x.$ !== y.$)
	{
		return false;
	}

	switch (x.$)
	{
		case 0:
		case 1:
			return x.a === y.a;

		case 2:
			return x.b === y.b;

		case 5:
			return x.c === y.c;

		case 3:
		case 4:
		case 8:
			return _Json_equality(x.b, y.b);

		case 6:
			return x.d === y.d && _Json_equality(x.b, y.b);

		case 7:
			return x.e === y.e && _Json_equality(x.b, y.b);

		case 9:
			return x.f === y.f && _Json_listEquality(x.g, y.g);

		case 10:
			return x.h === y.h && _Json_equality(x.b, y.b);

		case 11:
			return _Json_listEquality(x.g, y.g);
	}
}

function _Json_listEquality(aDecoders, bDecoders)
{
	var len = aDecoders.length;
	if (len !== bDecoders.length)
	{
		return false;
	}
	for (var i = 0; i < len; i++)
	{
		if (!_Json_equality(aDecoders[i], bDecoders[i]))
		{
			return false;
		}
	}
	return true;
}


// ENCODE

var _Json_encode = F2(function(indentLevel, value)
{
	return JSON.stringify(_Json_unwrap(value), null, indentLevel) + '';
});

function _Json_wrap_UNUSED(value) { return { $: 0, a: value }; }
function _Json_unwrap_UNUSED(value) { return value.a; }

function _Json_wrap(value) { return value; }
function _Json_unwrap(value) { return value; }

function _Json_emptyArray() { return []; }
function _Json_emptyObject() { return {}; }

var _Json_addField = F3(function(key, value, object)
{
	object[key] = _Json_unwrap(value);
	return object;
});

function _Json_addEntry(func)
{
	return F2(function(entry, array)
	{
		array.push(_Json_unwrap(func(entry)));
		return array;
	});
}

var _Json_encodeNull = _Json_wrap(null);



// TASKS

function _Scheduler_succeed(value)
{
	return {
		$: 0,
		a: value
	};
}

function _Scheduler_fail(error)
{
	return {
		$: 1,
		a: error
	};
}

function _Scheduler_binding(callback)
{
	return {
		$: 2,
		b: callback,
		c: null
	};
}

var _Scheduler_andThen = F2(function(callback, task)
{
	return {
		$: 3,
		b: callback,
		d: task
	};
});

var _Scheduler_onError = F2(function(callback, task)
{
	return {
		$: 4,
		b: callback,
		d: task
	};
});

function _Scheduler_receive(callback)
{
	return {
		$: 5,
		b: callback
	};
}


// PROCESSES

var _Scheduler_guid = 0;

function _Scheduler_rawSpawn(task)
{
	var proc = {
		$: 0,
		e: _Scheduler_guid++,
		f: task,
		g: null,
		h: []
	};

	_Scheduler_enqueue(proc);

	return proc;
}

function _Scheduler_spawn(task)
{
	return _Scheduler_binding(function(callback) {
		callback(_Scheduler_succeed(_Scheduler_rawSpawn(task)));
	});
}

function _Scheduler_rawSend(proc, msg)
{
	proc.h.push(msg);
	_Scheduler_enqueue(proc);
}

var _Scheduler_send = F2(function(proc, msg)
{
	return _Scheduler_binding(function(callback) {
		_Scheduler_rawSend(proc, msg);
		callback(_Scheduler_succeed(_Utils_Tuple0));
	});
});

function _Scheduler_kill(proc)
{
	return _Scheduler_binding(function(callback) {
		var task = proc.f;
		if (task.$ === 2 && task.c)
		{
			task.c();
		}

		proc.f = null;

		callback(_Scheduler_succeed(_Utils_Tuple0));
	});
}


/* STEP PROCESSES

type alias Process =
  { $ : tag
  , id : unique_id
  , root : Task
  , stack : null | { $: SUCCEED | FAIL, a: callback, b: stack }
  , mailbox : [msg]
  }

*/


var _Scheduler_working = false;
var _Scheduler_queue = [];


function _Scheduler_enqueue(proc)
{
	_Scheduler_queue.push(proc);
	if (_Scheduler_working)
	{
		return;
	}
	_Scheduler_working = true;
	while (proc = _Scheduler_queue.shift())
	{
		_Scheduler_step(proc);
	}
	_Scheduler_working = false;
}


function _Scheduler_step(proc)
{
	while (proc.f)
	{
		var rootTag = proc.f.$;
		if (rootTag === 0 || rootTag === 1)
		{
			while (proc.g && proc.g.$ !== rootTag)
			{
				proc.g = proc.g.i;
			}
			if (!proc.g)
			{
				return;
			}
			proc.f = proc.g.b(proc.f.a);
			proc.g = proc.g.i;
		}
		else if (rootTag === 2)
		{
			proc.f.c = proc.f.b(function(newRoot) {
				proc.f = newRoot;
				_Scheduler_enqueue(proc);
			});
			return;
		}
		else if (rootTag === 5)
		{
			if (proc.h.length === 0)
			{
				return;
			}
			proc.f = proc.f.b(proc.h.shift());
		}
		else // if (rootTag === 3 || rootTag === 4)
		{
			proc.g = {
				$: rootTag === 3 ? 0 : 1,
				b: proc.f.b,
				i: proc.g
			};
			proc.f = proc.f.d;
		}
	}
}



function _Process_sleep(time)
{
	return _Scheduler_binding(function(callback) {
		var id = setTimeout(function() {
			callback(_Scheduler_succeed(_Utils_Tuple0));
		}, time);

		return function() { clearTimeout(id); };
	});
}




// PROGRAMS


var _Platform_worker = F4(function(impl, flagDecoder, debugMetadata, args)
{
	return _Platform_initialize(
		flagDecoder,
		args,
		impl.bH,
		impl.cx,
		impl.cs,
		function() { return function() {} }
	);
});



// INITIALIZE A PROGRAM


function _Platform_initialize(flagDecoder, args, init, update, subscriptions, stepperBuilder)
{
	var result = A2(_Json_run, flagDecoder, _Json_wrap(args ? args['flags'] : undefined));
	elm$core$Result$isOk(result) || _Debug_crash(2 /**_UNUSED/, _Json_errorToString(result.a) /**/);
	var managers = {};
	result = init(result.a);
	var model = result.a;
	var stepper = stepperBuilder(sendToApp, model);
	var ports = _Platform_setupEffects(managers, sendToApp);

	function sendToApp(msg, viewMetadata)
	{
		result = A2(update, msg, model);
		stepper(model = result.a, viewMetadata);
		_Platform_dispatchEffects(managers, result.b, subscriptions(model));
	}

	_Platform_dispatchEffects(managers, result.b, subscriptions(model));

	return ports ? { ports: ports } : {};
}



// TRACK PRELOADS
//
// This is used by code in elm/browser and elm/http
// to register any HTTP requests that are triggered by init.
//


var _Platform_preload;


function _Platform_registerPreload(url)
{
	_Platform_preload.add(url);
}



// EFFECT MANAGERS


var _Platform_effectManagers = {};


function _Platform_setupEffects(managers, sendToApp)
{
	var ports;

	// setup all necessary effect managers
	for (var key in _Platform_effectManagers)
	{
		var manager = _Platform_effectManagers[key];

		if (manager.a)
		{
			ports = ports || {};
			ports[key] = manager.a(key, sendToApp);
		}

		managers[key] = _Platform_instantiateManager(manager, sendToApp);
	}

	return ports;
}


function _Platform_createManager(init, onEffects, onSelfMsg, cmdMap, subMap)
{
	return {
		b: init,
		c: onEffects,
		d: onSelfMsg,
		e: cmdMap,
		f: subMap
	};
}


function _Platform_instantiateManager(info, sendToApp)
{
	var router = {
		g: sendToApp,
		h: undefined
	};

	var onEffects = info.c;
	var onSelfMsg = info.d;
	var cmdMap = info.e;
	var subMap = info.f;

	function loop(state)
	{
		return A2(_Scheduler_andThen, loop, _Scheduler_receive(function(msg)
		{
			var value = msg.a;

			if (msg.$ === 0)
			{
				return A3(onSelfMsg, router, value, state);
			}

			return cmdMap && subMap
				? A4(onEffects, router, value.i, value.j, state)
				: A3(onEffects, router, cmdMap ? value.i : value.j, state);
		}));
	}

	return router.h = _Scheduler_rawSpawn(A2(_Scheduler_andThen, loop, info.b));
}



// ROUTING


var _Platform_sendToApp = F2(function(router, msg)
{
	return _Scheduler_binding(function(callback)
	{
		router.g(msg);
		callback(_Scheduler_succeed(_Utils_Tuple0));
	});
});


var _Platform_sendToSelf = F2(function(router, msg)
{
	return A2(_Scheduler_send, router.h, {
		$: 0,
		a: msg
	});
});



// BAGS


function _Platform_leaf(home)
{
	return function(value)
	{
		return {
			$: 1,
			k: home,
			l: value
		};
	};
}


function _Platform_batch(list)
{
	return {
		$: 2,
		m: list
	};
}


var _Platform_map = F2(function(tagger, bag)
{
	return {
		$: 3,
		n: tagger,
		o: bag
	}
});



// PIPE BAGS INTO EFFECT MANAGERS


function _Platform_dispatchEffects(managers, cmdBag, subBag)
{
	var effectsDict = {};
	_Platform_gatherEffects(true, cmdBag, effectsDict, null);
	_Platform_gatherEffects(false, subBag, effectsDict, null);

	for (var home in managers)
	{
		_Scheduler_rawSend(managers[home], {
			$: 'fx',
			a: effectsDict[home] || { i: _List_Nil, j: _List_Nil }
		});
	}
}


function _Platform_gatherEffects(isCmd, bag, effectsDict, taggers)
{
	switch (bag.$)
	{
		case 1:
			var home = bag.k;
			var effect = _Platform_toEffect(isCmd, home, taggers, bag.l);
			effectsDict[home] = _Platform_insert(isCmd, effect, effectsDict[home]);
			return;

		case 2:
			for (var list = bag.m; list.b; list = list.b) // WHILE_CONS
			{
				_Platform_gatherEffects(isCmd, list.a, effectsDict, taggers);
			}
			return;

		case 3:
			_Platform_gatherEffects(isCmd, bag.o, effectsDict, {
				p: bag.n,
				q: taggers
			});
			return;
	}
}


function _Platform_toEffect(isCmd, home, taggers, value)
{
	function applyTaggers(x)
	{
		for (var temp = taggers; temp; temp = temp.q)
		{
			x = temp.p(x);
		}
		return x;
	}

	var map = isCmd
		? _Platform_effectManagers[home].e
		: _Platform_effectManagers[home].f;

	return A2(map, applyTaggers, value)
}


function _Platform_insert(isCmd, newEffect, effects)
{
	effects = effects || { i: _List_Nil, j: _List_Nil };

	isCmd
		? (effects.i = _List_Cons(newEffect, effects.i))
		: (effects.j = _List_Cons(newEffect, effects.j));

	return effects;
}



// PORTS


function _Platform_checkPortName(name)
{
	if (_Platform_effectManagers[name])
	{
		_Debug_crash(3, name)
	}
}



// OUTGOING PORTS


function _Platform_outgoingPort(name, converter)
{
	_Platform_checkPortName(name);
	_Platform_effectManagers[name] = {
		e: _Platform_outgoingPortMap,
		r: converter,
		a: _Platform_setupOutgoingPort
	};
	return _Platform_leaf(name);
}


var _Platform_outgoingPortMap = F2(function(tagger, value) { return value; });


function _Platform_setupOutgoingPort(name)
{
	var subs = [];
	var converter = _Platform_effectManagers[name].r;

	// CREATE MANAGER

	var init = _Process_sleep(0);

	_Platform_effectManagers[name].b = init;
	_Platform_effectManagers[name].c = F3(function(router, cmdList, state)
	{
		for ( ; cmdList.b; cmdList = cmdList.b) // WHILE_CONS
		{
			// grab a separate reference to subs in case unsubscribe is called
			var currentSubs = subs;
			var value = _Json_unwrap(converter(cmdList.a));
			for (var i = 0; i < currentSubs.length; i++)
			{
				currentSubs[i](value);
			}
		}
		return init;
	});

	// PUBLIC API

	function subscribe(callback)
	{
		subs.push(callback);
	}

	function unsubscribe(callback)
	{
		// copy subs into a new array in case unsubscribe is called within a
		// subscribed callback
		subs = subs.slice();
		var index = subs.indexOf(callback);
		if (index >= 0)
		{
			subs.splice(index, 1);
		}
	}

	return {
		subscribe: subscribe,
		unsubscribe: unsubscribe
	};
}



// INCOMING PORTS


function _Platform_incomingPort(name, converter)
{
	_Platform_checkPortName(name);
	_Platform_effectManagers[name] = {
		f: _Platform_incomingPortMap,
		r: converter,
		a: _Platform_setupIncomingPort
	};
	return _Platform_leaf(name);
}


var _Platform_incomingPortMap = F2(function(tagger, finalTagger)
{
	return function(value)
	{
		return tagger(finalTagger(value));
	};
});


function _Platform_setupIncomingPort(name, sendToApp)
{
	var subs = _List_Nil;
	var converter = _Platform_effectManagers[name].r;

	// CREATE MANAGER

	var init = _Scheduler_succeed(null);

	_Platform_effectManagers[name].b = init;
	_Platform_effectManagers[name].c = F3(function(router, subList, state)
	{
		subs = subList;
		return init;
	});

	// PUBLIC API

	function send(incomingValue)
	{
		var result = A2(_Json_run, converter, _Json_wrap(incomingValue));

		elm$core$Result$isOk(result) || _Debug_crash(4, name, result.a);

		var value = result.a;
		for (var temp = subs; temp.b; temp = temp.b) // WHILE_CONS
		{
			sendToApp(temp.a(value));
		}
	}

	return { send: send };
}



// EXPORT ELM MODULES
//
// Have DEBUG and PROD versions so that we can (1) give nicer errors in
// debug mode and (2) not pay for the bits needed for that in prod mode.
//


function _Platform_export(exports)
{
	scope['Elm']
		? _Platform_mergeExportsProd(scope['Elm'], exports)
		: scope['Elm'] = exports;
}


function _Platform_mergeExportsProd(obj, exports)
{
	for (var name in exports)
	{
		(name in obj)
			? (name == 'init')
				? _Debug_crash(6)
				: _Platform_mergeExportsProd(obj[name], exports[name])
			: (obj[name] = exports[name]);
	}
}


function _Platform_export_UNUSED(exports)
{
	scope['Elm']
		? _Platform_mergeExportsDebug('Elm', scope['Elm'], exports)
		: scope['Elm'] = exports;
}


function _Platform_mergeExportsDebug(moduleName, obj, exports)
{
	for (var name in exports)
	{
		(name in obj)
			? (name == 'init')
				? _Debug_crash(6, moduleName)
				: _Platform_mergeExportsDebug(moduleName + '.' + name, obj[name], exports[name])
			: (obj[name] = exports[name]);
	}
}




// HELPERS


var _VirtualDom_divertHrefToApp;

var _VirtualDom_doc = typeof document !== 'undefined' ? document : {};


function _VirtualDom_appendChild(parent, child)
{
	parent.appendChild(child);
}

var _VirtualDom_init = F4(function(virtualNode, flagDecoder, debugMetadata, args)
{
	// NOTE: this function needs _Platform_export available to work

	/**/
	var node = args['node'];
	//*/
	/**_UNUSED/
	var node = args && args['node'] ? args['node'] : _Debug_crash(0);
	//*/

	node.parentNode.replaceChild(
		_VirtualDom_render(virtualNode, function() {}),
		node
	);

	return {};
});



// TEXT


function _VirtualDom_text(string)
{
	return {
		$: 0,
		a: string
	};
}



// NODE


var _VirtualDom_nodeNS = F2(function(namespace, tag)
{
	return F2(function(factList, kidList)
	{
		for (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS
		{
			var kid = kidList.a;
			descendantsCount += (kid.b || 0);
			kids.push(kid);
		}
		descendantsCount += kids.length;

		return {
			$: 1,
			c: tag,
			d: _VirtualDom_organizeFacts(factList),
			e: kids,
			f: namespace,
			b: descendantsCount
		};
	});
});


var _VirtualDom_node = _VirtualDom_nodeNS(undefined);



// KEYED NODE


var _VirtualDom_keyedNodeNS = F2(function(namespace, tag)
{
	return F2(function(factList, kidList)
	{
		for (var kids = [], descendantsCount = 0; kidList.b; kidList = kidList.b) // WHILE_CONS
		{
			var kid = kidList.a;
			descendantsCount += (kid.b.b || 0);
			kids.push(kid);
		}
		descendantsCount += kids.length;

		return {
			$: 2,
			c: tag,
			d: _VirtualDom_organizeFacts(factList),
			e: kids,
			f: namespace,
			b: descendantsCount
		};
	});
});


var _VirtualDom_keyedNode = _VirtualDom_keyedNodeNS(undefined);



// CUSTOM


function _VirtualDom_custom(factList, model, render, diff)
{
	return {
		$: 3,
		d: _VirtualDom_organizeFacts(factList),
		g: model,
		h: render,
		i: diff
	};
}



// MAP


var _VirtualDom_map = F2(function(tagger, node)
{
	return {
		$: 4,
		j: tagger,
		k: node,
		b: 1 + (node.b || 0)
	};
});



// LAZY


function _VirtualDom_thunk(refs, thunk)
{
	return {
		$: 5,
		l: refs,
		m: thunk,
		k: undefined
	};
}

var _VirtualDom_lazy = F2(function(func, a)
{
	return _VirtualDom_thunk([func, a], function() {
		return func(a);
	});
});

var _VirtualDom_lazy2 = F3(function(func, a, b)
{
	return _VirtualDom_thunk([func, a, b], function() {
		return A2(func, a, b);
	});
});

var _VirtualDom_lazy3 = F4(function(func, a, b, c)
{
	return _VirtualDom_thunk([func, a, b, c], function() {
		return A3(func, a, b, c);
	});
});

var _VirtualDom_lazy4 = F5(function(func, a, b, c, d)
{
	return _VirtualDom_thunk([func, a, b, c, d], function() {
		return A4(func, a, b, c, d);
	});
});

var _VirtualDom_lazy5 = F6(function(func, a, b, c, d, e)
{
	return _VirtualDom_thunk([func, a, b, c, d, e], function() {
		return A5(func, a, b, c, d, e);
	});
});

var _VirtualDom_lazy6 = F7(function(func, a, b, c, d, e, f)
{
	return _VirtualDom_thunk([func, a, b, c, d, e, f], function() {
		return A6(func, a, b, c, d, e, f);
	});
});

var _VirtualDom_lazy7 = F8(function(func, a, b, c, d, e, f, g)
{
	return _VirtualDom_thunk([func, a, b, c, d, e, f, g], function() {
		return A7(func, a, b, c, d, e, f, g);
	});
});

var _VirtualDom_lazy8 = F9(function(func, a, b, c, d, e, f, g, h)
{
	return _VirtualDom_thunk([func, a, b, c, d, e, f, g, h], function() {
		return A8(func, a, b, c, d, e, f, g, h);
	});
});



// FACTS


var _VirtualDom_on = F2(function(key, handler)
{
	return {
		$: 'a0',
		n: key,
		o: handler
	};
});
var _VirtualDom_style = F2(function(key, value)
{
	return {
		$: 'a1',
		n: key,
		o: value
	};
});
var _VirtualDom_property = F2(function(key, value)
{
	return {
		$: 'a2',
		n: key,
		o: value
	};
});
var _VirtualDom_attribute = F2(function(key, value)
{
	return {
		$: 'a3',
		n: key,
		o: value
	};
});
var _VirtualDom_attributeNS = F3(function(namespace, key, value)
{
	return {
		$: 'a4',
		n: key,
		o: { f: namespace, o: value }
	};
});



// XSS ATTACK VECTOR CHECKS


function _VirtualDom_noScript(tag)
{
	return tag == 'script' ? 'p' : tag;
}

function _VirtualDom_noOnOrFormAction(key)
{
	return /^(on|formAction$)/i.test(key) ? 'data-' + key : key;
}

function _VirtualDom_noInnerHtmlOrFormAction(key)
{
	return key == 'innerHTML' || key == 'formAction' ? 'data-' + key : key;
}

function _VirtualDom_noJavaScriptUri(value)
{
	return /^javascript:/i.test(value.replace(/\s/g,'')) ? '' : value;
}

function _VirtualDom_noJavaScriptUri_UNUSED(value)
{
	return /^javascript:/i.test(value.replace(/\s/g,''))
		? 'javascript:alert("This is an XSS vector. Please use ports or web components instead.")'
		: value;
}

function _VirtualDom_noJavaScriptOrHtmlUri(value)
{
	return /^\s*(javascript:|data:text\/html)/i.test(value) ? '' : value;
}

function _VirtualDom_noJavaScriptOrHtmlUri_UNUSED(value)
{
	return /^\s*(javascript:|data:text\/html)/i.test(value)
		? 'javascript:alert("This is an XSS vector. Please use ports or web components instead.")'
		: value;
}



// MAP FACTS


var _VirtualDom_mapAttribute = F2(function(func, attr)
{
	return (attr.$ === 'a0')
		? A2(_VirtualDom_on, attr.n, _VirtualDom_mapHandler(func, attr.o))
		: attr;
});

function _VirtualDom_mapHandler(func, handler)
{
	var tag = elm$virtual_dom$VirtualDom$toHandlerInt(handler);

	// 0 = Normal
	// 1 = MayStopPropagation
	// 2 = MayPreventDefault
	// 3 = Custom

	return {
		$: handler.$,
		a:
			!tag
				? A2(elm$json$Json$Decode$map, func, handler.a)
				:
			A3(elm$json$Json$Decode$map2,
				tag < 3
					? _VirtualDom_mapEventTuple
					: _VirtualDom_mapEventRecord,
				elm$json$Json$Decode$succeed(func),
				handler.a
			)
	};
}

var _VirtualDom_mapEventTuple = F2(function(func, tuple)
{
	return _Utils_Tuple2(func(tuple.a), tuple.b);
});

var _VirtualDom_mapEventRecord = F2(function(func, record)
{
	return {
		bY: func(record.bY),
		af: record.af,
		ac: record.ac
	}
});



// ORGANIZE FACTS


function _VirtualDom_organizeFacts(factList)
{
	for (var facts = {}; factList.b; factList = factList.b) // WHILE_CONS
	{
		var entry = factList.a;

		var tag = entry.$;
		var key = entry.n;
		var value = entry.o;

		if (tag === 'a2')
		{
			(key === 'className')
				? _VirtualDom_addClass(facts, key, _Json_unwrap(value))
				: facts[key] = _Json_unwrap(value);

			continue;
		}

		var subFacts = facts[tag] || (facts[tag] = {});
		(tag === 'a3' && key === 'class')
			? _VirtualDom_addClass(subFacts, key, value)
			: subFacts[key] = value;
	}

	return facts;
}

function _VirtualDom_addClass(object, key, newClass)
{
	var classes = object[key];
	object[key] = classes ? classes + ' ' + newClass : newClass;
}



// RENDER


function _VirtualDom_render(vNode, eventNode)
{
	var tag = vNode.$;

	if (tag === 5)
	{
		return _VirtualDom_render(vNode.k || (vNode.k = vNode.m()), eventNode);
	}

	if (tag === 0)
	{
		return _VirtualDom_doc.createTextNode(vNode.a);
	}

	if (tag === 4)
	{
		var subNode = vNode.k;
		var tagger = vNode.j;

		while (subNode.$ === 4)
		{
			typeof tagger !== 'object'
				? tagger = [tagger, subNode.j]
				: tagger.push(subNode.j);

			subNode = subNode.k;
		}

		var subEventRoot = { j: tagger, p: eventNode };
		var domNode = _VirtualDom_render(subNode, subEventRoot);
		domNode.elm_event_node_ref = subEventRoot;
		return domNode;
	}

	if (tag === 3)
	{
		var domNode = vNode.h(vNode.g);
		_VirtualDom_applyFacts(domNode, eventNode, vNode.d);
		return domNode;
	}

	// at this point `tag` must be 1 or 2

	var domNode = vNode.f
		? _VirtualDom_doc.createElementNS(vNode.f, vNode.c)
		: _VirtualDom_doc.createElement(vNode.c);

	if (_VirtualDom_divertHrefToApp && vNode.c == 'a')
	{
		domNode.addEventListener('click', _VirtualDom_divertHrefToApp(domNode));
	}

	_VirtualDom_applyFacts(domNode, eventNode, vNode.d);

	for (var kids = vNode.e, i = 0; i < kids.length; i++)
	{
		_VirtualDom_appendChild(domNode, _VirtualDom_render(tag === 1 ? kids[i] : kids[i].b, eventNode));
	}

	return domNode;
}



// APPLY FACTS


function _VirtualDom_applyFacts(domNode, eventNode, facts)
{
	for (var key in facts)
	{
		var value = facts[key];

		key === 'a1'
			? _VirtualDom_applyStyles(domNode, value)
			:
		key === 'a0'
			? _VirtualDom_applyEvents(domNode, eventNode, value)
			:
		key === 'a3'
			? _VirtualDom_applyAttrs(domNode, value)
			:
		key === 'a4'
			? _VirtualDom_applyAttrsNS(domNode, value)
			:
		((key !== 'value' && key !== 'checked') || domNode[key] !== value) && (domNode[key] = value);
	}
}



// APPLY STYLES


function _VirtualDom_applyStyles(domNode, styles)
{
	var domNodeStyle = domNode.style;

	for (var key in styles)
	{
		domNodeStyle[key] = styles[key];
	}
}



// APPLY ATTRS


function _VirtualDom_applyAttrs(domNode, attrs)
{
	for (var key in attrs)
	{
		var value = attrs[key];
		typeof value !== 'undefined'
			? domNode.setAttribute(key, value)
			: domNode.removeAttribute(key);
	}
}



// APPLY NAMESPACED ATTRS


function _VirtualDom_applyAttrsNS(domNode, nsAttrs)
{
	for (var key in nsAttrs)
	{
		var pair = nsAttrs[key];
		var namespace = pair.f;
		var value = pair.o;

		typeof value !== 'undefined'
			? domNode.setAttributeNS(namespace, key, value)
			: domNode.removeAttributeNS(namespace, key);
	}
}



// APPLY EVENTS


function _VirtualDom_applyEvents(domNode, eventNode, events)
{
	var allCallbacks = domNode.elmFs || (domNode.elmFs = {});

	for (var key in events)
	{
		var newHandler = events[key];
		var oldCallback = allCallbacks[key];

		if (!newHandler)
		{
			domNode.removeEventListener(key, oldCallback);
			allCallbacks[key] = undefined;
			continue;
		}

		if (oldCallback)
		{
			var oldHandler = oldCallback.q;
			if (oldHandler.$ === newHandler.$)
			{
				oldCallback.q = newHandler;
				continue;
			}
			domNode.removeEventListener(key, oldCallback);
		}

		oldCallback = _VirtualDom_makeCallback(eventNode, newHandler);
		domNode.addEventListener(key, oldCallback,
			_VirtualDom_passiveSupported
			&& { passive: elm$virtual_dom$VirtualDom$toHandlerInt(newHandler) < 2 }
		);
		allCallbacks[key] = oldCallback;
	}
}



// PASSIVE EVENTS


var _VirtualDom_passiveSupported;

try
{
	window.addEventListener('t', null, Object.defineProperty({}, 'passive', {
		get: function() { _VirtualDom_passiveSupported = true; }
	}));
}
catch(e) {}



// EVENT HANDLERS


function _VirtualDom_makeCallback(eventNode, initialHandler)
{
	function callback(event)
	{
		var handler = callback.q;
		var result = _Json_runHelp(handler.a, event);

		if (!elm$core$Result$isOk(result))
		{
			return;
		}

		var tag = elm$virtual_dom$VirtualDom$toHandlerInt(handler);

		// 0 = Normal
		// 1 = MayStopPropagation
		// 2 = MayPreventDefault
		// 3 = Custom

		var value = result.a;
		var message = !tag ? value : tag < 3 ? value.a : value.bY;
		var stopPropagation = tag == 1 ? value.b : tag == 3 && value.af;
		var currentEventNode = (
			stopPropagation && event.stopPropagation(),
			(tag == 2 ? value.b : tag == 3 && value.ac) && event.preventDefault(),
			eventNode
		);
		var tagger;
		var i;
		while (tagger = currentEventNode.j)
		{
			if (typeof tagger == 'function')
			{
				message = tagger(message);
			}
			else
			{
				for (var i = tagger.length; i--; )
				{
					message = tagger[i](message);
				}
			}
			currentEventNode = currentEventNode.p;
		}
		currentEventNode(message, stopPropagation); // stopPropagation implies isSync
	}

	callback.q = initialHandler;

	return callback;
}

function _VirtualDom_equalEvents(x, y)
{
	return x.$ == y.$ && _Json_equality(x.a, y.a);
}



// DIFF


// TODO: Should we do patches like in iOS?
//
// type Patch
//   = At Int Patch
//   | Batch (List Patch)
//   | Change ...
//
// How could it not be better?
//
function _VirtualDom_diff(x, y)
{
	var patches = [];
	_VirtualDom_diffHelp(x, y, patches, 0);
	return patches;
}


function _VirtualDom_pushPatch(patches, type, index, data)
{
	var patch = {
		$: type,
		r: index,
		s: data,
		t: undefined,
		u: undefined
	};
	patches.push(patch);
	return patch;
}


function _VirtualDom_diffHelp(x, y, patches, index)
{
	if (x === y)
	{
		return;
	}

	var xType = x.$;
	var yType = y.$;

	// Bail if you run into different types of nodes. Implies that the
	// structure has changed significantly and it's not worth a diff.
	if (xType !== yType)
	{
		if (xType === 1 && yType === 2)
		{
			y = _VirtualDom_dekey(y);
			yType = 1;
		}
		else
		{
			_VirtualDom_pushPatch(patches, 0, index, y);
			return;
		}
	}

	// Now we know that both nodes are the same $.
	switch (yType)
	{
		case 5:
			var xRefs = x.l;
			var yRefs = y.l;
			var i = xRefs.length;
			var same = i === yRefs.length;
			while (same && i--)
			{
				same = xRefs[i] === yRefs[i];
			}
			if (same)
			{
				y.k = x.k;
				return;
			}
			y.k = y.m();
			var subPatches = [];
			_VirtualDom_diffHelp(x.k, y.k, subPatches, 0);
			subPatches.length > 0 && _VirtualDom_pushPatch(patches, 1, index, subPatches);
			return;

		case 4:
			// gather nested taggers
			var xTaggers = x.j;
			var yTaggers = y.j;
			var nesting = false;

			var xSubNode = x.k;
			while (xSubNode.$ === 4)
			{
				nesting = true;

				typeof xTaggers !== 'object'
					? xTaggers = [xTaggers, xSubNode.j]
					: xTaggers.push(xSubNode.j);

				xSubNode = xSubNode.k;
			}

			var ySubNode = y.k;
			while (ySubNode.$ === 4)
			{
				nesting = true;

				typeof yTaggers !== 'object'
					? yTaggers = [yTaggers, ySubNode.j]
					: yTaggers.push(ySubNode.j);

				ySubNode = ySubNode.k;
			}

			// Just bail if different numbers of taggers. This implies the
			// structure of the virtual DOM has changed.
			if (nesting && xTaggers.length !== yTaggers.length)
			{
				_VirtualDom_pushPatch(patches, 0, index, y);
				return;
			}

			// check if taggers are "the same"
			if (nesting ? !_VirtualDom_pairwiseRefEqual(xTaggers, yTaggers) : xTaggers !== yTaggers)
			{
				_VirtualDom_pushPatch(patches, 2, index, yTaggers);
			}

			// diff everything below the taggers
			_VirtualDom_diffHelp(xSubNode, ySubNode, patches, index + 1);
			return;

		case 0:
			if (x.a !== y.a)
			{
				_VirtualDom_pushPatch(patches, 3, index, y.a);
			}
			return;

		case 1:
			_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKids);
			return;

		case 2:
			_VirtualDom_diffNodes(x, y, patches, index, _VirtualDom_diffKeyedKids);
			return;

		case 3:
			if (x.h !== y.h)
			{
				_VirtualDom_pushPatch(patches, 0, index, y);
				return;
			}

			var factsDiff = _VirtualDom_diffFacts(x.d, y.d);
			factsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);

			var patch = y.i(x.g, y.g);
			patch && _VirtualDom_pushPatch(patches, 5, index, patch);

			return;
	}
}

// assumes the incoming arrays are the same length
function _VirtualDom_pairwiseRefEqual(as, bs)
{
	for (var i = 0; i < as.length; i++)
	{
		if (as[i] !== bs[i])
		{
			return false;
		}
	}

	return true;
}

function _VirtualDom_diffNodes(x, y, patches, index, diffKids)
{
	// Bail if obvious indicators have changed. Implies more serious
	// structural changes such that it's not worth it to diff.
	if (x.c !== y.c || x.f !== y.f)
	{
		_VirtualDom_pushPatch(patches, 0, index, y);
		return;
	}

	var factsDiff = _VirtualDom_diffFacts(x.d, y.d);
	factsDiff && _VirtualDom_pushPatch(patches, 4, index, factsDiff);

	diffKids(x, y, patches, index);
}



// DIFF FACTS


// TODO Instead of creating a new diff object, it's possible to just test if
// there *is* a diff. During the actual patch, do the diff again and make the
// modifications directly. This way, there's no new allocations. Worth it?
function _VirtualDom_diffFacts(x, y, category)
{
	var diff;

	// look for changes and removals
	for (var xKey in x)
	{
		if (xKey === 'a1' || xKey === 'a0' || xKey === 'a3' || xKey === 'a4')
		{
			var subDiff = _VirtualDom_diffFacts(x[xKey], y[xKey] || {}, xKey);
			if (subDiff)
			{
				diff = diff || {};
				diff[xKey] = subDiff;
			}
			continue;
		}

		// remove if not in the new facts
		if (!(xKey in y))
		{
			diff = diff || {};
			diff[xKey] =
				!category
					? (typeof x[xKey] === 'string' ? '' : null)
					:
				(category === 'a1')
					? ''
					:
				(category === 'a0' || category === 'a3')
					? undefined
					:
				{ f: x[xKey].f, o: undefined };

			continue;
		}

		var xValue = x[xKey];
		var yValue = y[xKey];

		// reference equal, so don't worry about it
		if (xValue === yValue && xKey !== 'value' && xKey !== 'checked'
			|| category === 'a0' && _VirtualDom_equalEvents(xValue, yValue))
		{
			continue;
		}

		diff = diff || {};
		diff[xKey] = yValue;
	}

	// add new stuff
	for (var yKey in y)
	{
		if (!(yKey in x))
		{
			diff = diff || {};
			diff[yKey] = y[yKey];
		}
	}

	return diff;
}



// DIFF KIDS


function _VirtualDom_diffKids(xParent, yParent, patches, index)
{
	var xKids = xParent.e;
	var yKids = yParent.e;

	var xLen = xKids.length;
	var yLen = yKids.length;

	// FIGURE OUT IF THERE ARE INSERTS OR REMOVALS

	if (xLen > yLen)
	{
		_VirtualDom_pushPatch(patches, 6, index, {
			v: yLen,
			i: xLen - yLen
		});
	}
	else if (xLen < yLen)
	{
		_VirtualDom_pushPatch(patches, 7, index, {
			v: xLen,
			e: yKids
		});
	}

	// PAIRWISE DIFF EVERYTHING ELSE

	for (var minLen = xLen < yLen ? xLen : yLen, i = 0; i < minLen; i++)
	{
		var xKid = xKids[i];
		_VirtualDom_diffHelp(xKid, yKids[i], patches, ++index);
		index += xKid.b || 0;
	}
}



// KEYED DIFF


function _VirtualDom_diffKeyedKids(xParent, yParent, patches, rootIndex)
{
	var localPatches = [];

	var changes = {}; // Dict String Entry
	var inserts = []; // Array { index : Int, entry : Entry }
	// type Entry = { tag : String, vnode : VNode, index : Int, data : _ }

	var xKids = xParent.e;
	var yKids = yParent.e;
	var xLen = xKids.length;
	var yLen = yKids.length;
	var xIndex = 0;
	var yIndex = 0;

	var index = rootIndex;

	while (xIndex < xLen && yIndex < yLen)
	{
		var x = xKids[xIndex];
		var y = yKids[yIndex];

		var xKey = x.a;
		var yKey = y.a;
		var xNode = x.b;
		var yNode = y.b;

		var newMatch = undefined;
		var oldMatch = undefined;

		// check if keys match

		if (xKey === yKey)
		{
			index++;
			_VirtualDom_diffHelp(xNode, yNode, localPatches, index);
			index += xNode.b || 0;

			xIndex++;
			yIndex++;
			continue;
		}

		// look ahead 1 to detect insertions and removals.

		var xNext = xKids[xIndex + 1];
		var yNext = yKids[yIndex + 1];

		if (xNext)
		{
			var xNextKey = xNext.a;
			var xNextNode = xNext.b;
			oldMatch = yKey === xNextKey;
		}

		if (yNext)
		{
			var yNextKey = yNext.a;
			var yNextNode = yNext.b;
			newMatch = xKey === yNextKey;
		}


		// swap x and y
		if (newMatch && oldMatch)
		{
			index++;
			_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);
			_VirtualDom_insertNode(changes, localPatches, xKey, yNode, yIndex, inserts);
			index += xNode.b || 0;

			index++;
			_VirtualDom_removeNode(changes, localPatches, xKey, xNextNode, index);
			index += xNextNode.b || 0;

			xIndex += 2;
			yIndex += 2;
			continue;
		}

		// insert y
		if (newMatch)
		{
			index++;
			_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);
			_VirtualDom_diffHelp(xNode, yNextNode, localPatches, index);
			index += xNode.b || 0;

			xIndex += 1;
			yIndex += 2;
			continue;
		}

		// remove x
		if (oldMatch)
		{
			index++;
			_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);
			index += xNode.b || 0;

			index++;
			_VirtualDom_diffHelp(xNextNode, yNode, localPatches, index);
			index += xNextNode.b || 0;

			xIndex += 2;
			yIndex += 1;
			continue;
		}

		// remove x, insert y
		if (xNext && xNextKey === yNextKey)
		{
			index++;
			_VirtualDom_removeNode(changes, localPatches, xKey, xNode, index);
			_VirtualDom_insertNode(changes, localPatches, yKey, yNode, yIndex, inserts);
			index += xNode.b || 0;

			index++;
			_VirtualDom_diffHelp(xNextNode, yNextNode, localPatches, index);
			index += xNextNode.b || 0;

			xIndex += 2;
			yIndex += 2;
			continue;
		}

		break;
	}

	// eat up any remaining nodes with removeNode and insertNode

	while (xIndex < xLen)
	{
		index++;
		var x = xKids[xIndex];
		var xNode = x.b;
		_VirtualDom_removeNode(changes, localPatches, x.a, xNode, index);
		index += xNode.b || 0;
		xIndex++;
	}

	while (yIndex < yLen)
	{
		var endInserts = endInserts || [];
		var y = yKids[yIndex];
		_VirtualDom_insertNode(changes, localPatches, y.a, y.b, undefined, endInserts);
		yIndex++;
	}

	if (localPatches.length > 0 || inserts.length > 0 || endInserts)
	{
		_VirtualDom_pushPatch(patches, 8, rootIndex, {
			w: localPatches,
			x: inserts,
			y: endInserts
		});
	}
}



// CHANGES FROM KEYED DIFF


var _VirtualDom_POSTFIX = '_elmW6BL';


function _VirtualDom_insertNode(changes, localPatches, key, vnode, yIndex, inserts)
{
	var entry = changes[key];

	// never seen this key before
	if (!entry)
	{
		entry = {
			c: 0,
			z: vnode,
			r: yIndex,
			s: undefined
		};

		inserts.push({ r: yIndex, A: entry });
		changes[key] = entry;

		return;
	}

	// this key was removed earlier, a match!
	if (entry.c === 1)
	{
		inserts.push({ r: yIndex, A: entry });

		entry.c = 2;
		var subPatches = [];
		_VirtualDom_diffHelp(entry.z, vnode, subPatches, entry.r);
		entry.r = yIndex;
		entry.s.s = {
			w: subPatches,
			A: entry
		};

		return;
	}

	// this key has already been inserted or moved, a duplicate!
	_VirtualDom_insertNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, yIndex, inserts);
}


function _VirtualDom_removeNode(changes, localPatches, key, vnode, index)
{
	var entry = changes[key];

	// never seen this key before
	if (!entry)
	{
		var patch = _VirtualDom_pushPatch(localPatches, 9, index, undefined);

		changes[key] = {
			c: 1,
			z: vnode,
			r: index,
			s: patch
		};

		return;
	}

	// this key was inserted earlier, a match!
	if (entry.c === 0)
	{
		entry.c = 2;
		var subPatches = [];
		_VirtualDom_diffHelp(vnode, entry.z, subPatches, index);

		_VirtualDom_pushPatch(localPatches, 9, index, {
			w: subPatches,
			A: entry
		});

		return;
	}

	// this key has already been removed or moved, a duplicate!
	_VirtualDom_removeNode(changes, localPatches, key + _VirtualDom_POSTFIX, vnode, index);
}



// ADD DOM NODES
//
// Each DOM node has an "index" assigned in order of traversal. It is important
// to minimize our crawl over the actual DOM, so these indexes (along with the
// descendantsCount of virtual nodes) let us skip touching entire subtrees of
// the DOM if we know there are no patches there.


function _VirtualDom_addDomNodes(domNode, vNode, patches, eventNode)
{
	_VirtualDom_addDomNodesHelp(domNode, vNode, patches, 0, 0, vNode.b, eventNode);
}


// assumes `patches` is non-empty and indexes increase monotonically.
function _VirtualDom_addDomNodesHelp(domNode, vNode, patches, i, low, high, eventNode)
{
	var patch = patches[i];
	var index = patch.r;

	while (index === low)
	{
		var patchType = patch.$;

		if (patchType === 1)
		{
			_VirtualDom_addDomNodes(domNode, vNode.k, patch.s, eventNode);
		}
		else if (patchType === 8)
		{
			patch.t = domNode;
			patch.u = eventNode;

			var subPatches = patch.s.w;
			if (subPatches.length > 0)
			{
				_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);
			}
		}
		else if (patchType === 9)
		{
			patch.t = domNode;
			patch.u = eventNode;

			var data = patch.s;
			if (data)
			{
				data.A.s = domNode;
				var subPatches = data.w;
				if (subPatches.length > 0)
				{
					_VirtualDom_addDomNodesHelp(domNode, vNode, subPatches, 0, low, high, eventNode);
				}
			}
		}
		else
		{
			patch.t = domNode;
			patch.u = eventNode;
		}

		i++;

		if (!(patch = patches[i]) || (index = patch.r) > high)
		{
			return i;
		}
	}

	var tag = vNode.$;

	if (tag === 4)
	{
		var subNode = vNode.k;

		while (subNode.$ === 4)
		{
			subNode = subNode.k;
		}

		return _VirtualDom_addDomNodesHelp(domNode, subNode, patches, i, low + 1, high, domNode.elm_event_node_ref);
	}

	// tag must be 1 or 2 at this point

	var vKids = vNode.e;
	var childNodes = domNode.childNodes;
	for (var j = 0; j < vKids.length; j++)
	{
		low++;
		var vKid = tag === 1 ? vKids[j] : vKids[j].b;
		var nextLow = low + (vKid.b || 0);
		if (low <= index && index <= nextLow)
		{
			i = _VirtualDom_addDomNodesHelp(childNodes[j], vKid, patches, i, low, nextLow, eventNode);
			if (!(patch = patches[i]) || (index = patch.r) > high)
			{
				return i;
			}
		}
		low = nextLow;
	}
	return i;
}



// APPLY PATCHES


function _VirtualDom_applyPatches(rootDomNode, oldVirtualNode, patches, eventNode)
{
	if (patches.length === 0)
	{
		return rootDomNode;
	}

	_VirtualDom_addDomNodes(rootDomNode, oldVirtualNode, patches, eventNode);
	return _VirtualDom_applyPatchesHelp(rootDomNode, patches);
}

function _VirtualDom_applyPatchesHelp(rootDomNode, patches)
{
	for (var i = 0; i < patches.length; i++)
	{
		var patch = patches[i];
		var localDomNode = patch.t
		var newNode = _VirtualDom_applyPatch(localDomNode, patch);
		if (localDomNode === rootDomNode)
		{
			rootDomNode = newNode;
		}
	}
	return rootDomNode;
}

function _VirtualDom_applyPatch(domNode, patch)
{
	switch (patch.$)
	{
		case 0:
			return _VirtualDom_applyPatchRedraw(domNode, patch.s, patch.u);

		case 4:
			_VirtualDom_applyFacts(domNode, patch.u, patch.s);
			return domNode;

		case 3:
			domNode.replaceData(0, domNode.length, patch.s);
			return domNode;

		case 1:
			return _VirtualDom_applyPatchesHelp(domNode, patch.s);

		case 2:
			if (domNode.elm_event_node_ref)
			{
				domNode.elm_event_node_ref.j = patch.s;
			}
			else
			{
				domNode.elm_event_node_ref = { j: patch.s, p: patch.u };
			}
			return domNode;

		case 6:
			var data = patch.s;
			for (var i = 0; i < data.i; i++)
			{
				domNode.removeChild(domNode.childNodes[data.v]);
			}
			return domNode;

		case 7:
			var data = patch.s;
			var kids = data.e;
			var i = data.v;
			var theEnd = domNode.childNodes[i];
			for (; i < kids.length; i++)
			{
				domNode.insertBefore(_VirtualDom_render(kids[i], patch.u), theEnd);
			}
			return domNode;

		case 9:
			var data = patch.s;
			if (!data)
			{
				domNode.parentNode.removeChild(domNode);
				return domNode;
			}
			var entry = data.A;
			if (typeof entry.r !== 'undefined')
			{
				domNode.parentNode.removeChild(domNode);
			}
			entry.s = _VirtualDom_applyPatchesHelp(domNode, data.w);
			return domNode;

		case 8:
			return _VirtualDom_applyPatchReorder(domNode, patch);

		case 5:
			return patch.s(domNode);

		default:
			_Debug_crash(10); // 'Ran into an unknown patch!'
	}
}


function _VirtualDom_applyPatchRedraw(domNode, vNode, eventNode)
{
	var parentNode = domNode.parentNode;
	var newNode = _VirtualDom_render(vNode, eventNode);

	if (!newNode.elm_event_node_ref)
	{
		newNode.elm_event_node_ref = domNode.elm_event_node_ref;
	}

	if (parentNode && newNode !== domNode)
	{
		parentNode.replaceChild(newNode, domNode);
	}
	return newNode;
}


function _VirtualDom_applyPatchReorder(domNode, patch)
{
	var data = patch.s;

	// remove end inserts
	var frag = _VirtualDom_applyPatchReorderEndInsertsHelp(data.y, patch);

	// removals
	domNode = _VirtualDom_applyPatchesHelp(domNode, data.w);

	// inserts
	var inserts = data.x;
	for (var i = 0; i < inserts.length; i++)
	{
		var insert = inserts[i];
		var entry = insert.A;
		var node = entry.c === 2
			? entry.s
			: _VirtualDom_render(entry.z, patch.u);
		domNode.insertBefore(node, domNode.childNodes[insert.r]);
	}

	// add end inserts
	if (frag)
	{
		_VirtualDom_appendChild(domNode, frag);
	}

	return domNode;
}


function _VirtualDom_applyPatchReorderEndInsertsHelp(endInserts, patch)
{
	if (!endInserts)
	{
		return;
	}

	var frag = _VirtualDom_doc.createDocumentFragment();
	for (var i = 0; i < endInserts.length; i++)
	{
		var insert = endInserts[i];
		var entry = insert.A;
		_VirtualDom_appendChild(frag, entry.c === 2
			? entry.s
			: _VirtualDom_render(entry.z, patch.u)
		);
	}
	return frag;
}


function _VirtualDom_virtualize(node)
{
	// TEXT NODES

	if (node.nodeType === 3)
	{
		return _VirtualDom_text(node.textContent);
	}


	// WEIRD NODES

	if (node.nodeType !== 1)
	{
		return _VirtualDom_text('');
	}


	// ELEMENT NODES

	var attrList = _List_Nil;
	var attrs = node.attributes;
	for (var i = attrs.length; i--; )
	{
		var attr = attrs[i];
		var name = attr.name;
		var value = attr.value;
		attrList = _List_Cons( A2(_VirtualDom_attribute, name, value), attrList );
	}

	var tag = node.tagName.toLowerCase();
	var kidList = _List_Nil;
	var kids = node.childNodes;

	for (var i = kids.length; i--; )
	{
		kidList = _List_Cons(_VirtualDom_virtualize(kids[i]), kidList);
	}
	return A3(_VirtualDom_node, tag, attrList, kidList);
}

function _VirtualDom_dekey(keyedNode)
{
	var keyedKids = keyedNode.e;
	var len = keyedKids.length;
	var kids = new Array(len);
	for (var i = 0; i < len; i++)
	{
		kids[i] = keyedKids[i].b;
	}

	return {
		$: 1,
		c: keyedNode.c,
		d: keyedNode.d,
		e: kids,
		f: keyedNode.f,
		b: keyedNode.b
	};
}




// ELEMENT


var _Debugger_element;

var _Browser_element = _Debugger_element || F4(function(impl, flagDecoder, debugMetadata, args)
{
	return _Platform_initialize(
		flagDecoder,
		args,
		impl.bH,
		impl.cx,
		impl.cs,
		function(sendToApp, initialModel) {
			var view = impl.cz;
			/**/
			var domNode = args['node'];
			//*/
			/**_UNUSED/
			var domNode = args && args['node'] ? args['node'] : _Debug_crash(0);
			//*/
			var currNode = _VirtualDom_virtualize(domNode);

			return _Browser_makeAnimator(initialModel, function(model)
			{
				var nextNode = view(model);
				var patches = _VirtualDom_diff(currNode, nextNode);
				domNode = _VirtualDom_applyPatches(domNode, currNode, patches, sendToApp);
				currNode = nextNode;
			});
		}
	);
});



// DOCUMENT


var _Debugger_document;

var _Browser_document = _Debugger_document || F4(function(impl, flagDecoder, debugMetadata, args)
{
	return _Platform_initialize(
		flagDecoder,
		args,
		impl.bH,
		impl.cx,
		impl.cs,
		function(sendToApp, initialModel) {
			var divertHrefToApp = impl.F && impl.F(sendToApp)
			var view = impl.cz;
			var title = _VirtualDom_doc.title;
			var bodyNode = _VirtualDom_doc.body;
			var currNode = _VirtualDom_virtualize(bodyNode);
			return _Browser_makeAnimator(initialModel, function(model)
			{
				_VirtualDom_divertHrefToApp = divertHrefToApp;
				var doc = view(model);
				var nextNode = _VirtualDom_node('body')(_List_Nil)(doc.bb);
				var patches = _VirtualDom_diff(currNode, nextNode);
				bodyNode = _VirtualDom_applyPatches(bodyNode, currNode, patches, sendToApp);
				currNode = nextNode;
				_VirtualDom_divertHrefToApp = 0;
				(title !== doc.cu) && (_VirtualDom_doc.title = title = doc.cu);
			});
		}
	);
});



// ANIMATION


var _Browser_cancelAnimationFrame =
	typeof cancelAnimationFrame !== 'undefined'
		? cancelAnimationFrame
		: function(id) { clearTimeout(id); };

var _Browser_requestAnimationFrame =
	typeof requestAnimationFrame !== 'undefined'
		? requestAnimationFrame
		: function(callback) { return setTimeout(callback, 1000 / 60); };


function _Browser_makeAnimator(model, draw)
{
	draw(model);

	var state = 0;

	function updateIfNeeded()
	{
		state = state === 1
			? 0
			: ( _Browser_requestAnimationFrame(updateIfNeeded), draw(model), 1 );
	}

	return function(nextModel, isSync)
	{
		model = nextModel;

		isSync
			? ( draw(model),
				state === 2 && (state = 1)
				)
			: ( state === 0 && _Browser_requestAnimationFrame(updateIfNeeded),
				state = 2
				);
	};
}



// APPLICATION


function _Browser_application(impl)
{
	var onUrlChange = impl.b2;
	var onUrlRequest = impl.b3;
	var key = function() { key.a(onUrlChange(_Browser_getUrl())); };

	return _Browser_document({
		F: function(sendToApp)
		{
			key.a = sendToApp;
			_Browser_window.addEventListener('popstate', key);
			_Browser_window.navigator.userAgent.indexOf('Trident') < 0 || _Browser_window.addEventListener('hashchange', key);

			return F2(function(domNode, event)
			{
				if (!event.ctrlKey && !event.metaKey && !event.shiftKey && event.button < 1 && !domNode.target && !domNode.hasAttribute('download'))
				{
					event.preventDefault();
					var href = domNode.href;
					var curr = _Browser_getUrl();
					var next = elm$url$Url$fromString(href).a;
					sendToApp(onUrlRequest(
						(next
							&& curr.aM === next.aM
							&& curr.at === next.at
							&& curr.aI.a === next.aI.a
						)
							? elm$browser$Browser$Internal(next)
							: elm$browser$Browser$External(href)
					));
				}
			});
		},
		bH: function(flags)
		{
			return A3(impl.bH, flags, _Browser_getUrl(), key);
		},
		cz: impl.cz,
		cx: impl.cx,
		cs: impl.cs
	});
}

function _Browser_getUrl()
{
	return elm$url$Url$fromString(_VirtualDom_doc.location.href).a || _Debug_crash(1);
}

var _Browser_go = F2(function(key, n)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function() {
		n && history.go(n);
		key();
	}));
});

var _Browser_pushUrl = F2(function(key, url)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function() {
		history.pushState({}, '', url);
		key();
	}));
});

var _Browser_replaceUrl = F2(function(key, url)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function() {
		history.replaceState({}, '', url);
		key();
	}));
});



// GLOBAL EVENTS


var _Browser_fakeNode = { addEventListener: function() {}, removeEventListener: function() {} };
var _Browser_doc = typeof document !== 'undefined' ? document : _Browser_fakeNode;
var _Browser_window = typeof window !== 'undefined' ? window : _Browser_fakeNode;

var _Browser_on = F3(function(node, eventName, sendToSelf)
{
	return _Scheduler_spawn(_Scheduler_binding(function(callback)
	{
		function handler(event)	{ _Scheduler_rawSpawn(sendToSelf(event)); }
		node.addEventListener(eventName, handler, _VirtualDom_passiveSupported && { passive: true });
		return function() { node.removeEventListener(eventName, handler); };
	}));
});

var _Browser_decodeEvent = F2(function(decoder, event)
{
	var result = _Json_runHelp(decoder, event);
	return elm$core$Result$isOk(result) ? elm$core$Maybe$Just(result.a) : elm$core$Maybe$Nothing;
});



// PAGE VISIBILITY


function _Browser_visibilityInfo()
{
	return (typeof _VirtualDom_doc.hidden !== 'undefined')
		? { bD: 'hidden', be: 'visibilitychange' }
		:
	(typeof _VirtualDom_doc.mozHidden !== 'undefined')
		? { bD: 'mozHidden', be: 'mozvisibilitychange' }
		:
	(typeof _VirtualDom_doc.msHidden !== 'undefined')
		? { bD: 'msHidden', be: 'msvisibilitychange' }
		:
	(typeof _VirtualDom_doc.webkitHidden !== 'undefined')
		? { bD: 'webkitHidden', be: 'webkitvisibilitychange' }
		: { bD: 'hidden', be: 'visibilitychange' };
}



// ANIMATION FRAMES


function _Browser_rAF()
{
	return _Scheduler_binding(function(callback)
	{
		var id = _Browser_requestAnimationFrame(function() {
			callback(_Scheduler_succeed(Date.now()));
		});

		return function() {
			_Browser_cancelAnimationFrame(id);
		};
	});
}


function _Browser_now()
{
	return _Scheduler_binding(function(callback)
	{
		callback(_Scheduler_succeed(Date.now()));
	});
}



// DOM STUFF


function _Browser_withNode(id, doStuff)
{
	return _Scheduler_binding(function(callback)
	{
		_Browser_requestAnimationFrame(function() {
			var node = document.getElementById(id);
			callback(node
				? _Scheduler_succeed(doStuff(node))
				: _Scheduler_fail(elm$browser$Browser$Dom$NotFound(id))
			);
		});
	});
}


function _Browser_withWindow(doStuff)
{
	return _Scheduler_binding(function(callback)
	{
		_Browser_requestAnimationFrame(function() {
			callback(_Scheduler_succeed(doStuff()));
		});
	});
}


// FOCUS and BLUR


var _Browser_call = F2(function(functionName, id)
{
	return _Browser_withNode(id, function(node) {
		node[functionName]();
		return _Utils_Tuple0;
	});
});



// WINDOW VIEWPORT


function _Browser_getViewport()
{
	return {
		aS: _Browser_getScene(),
		a1: {
			a2: _Browser_window.pageXOffset,
			a3: _Browser_window.pageYOffset,
			cD: _Browser_doc.documentElement.clientWidth,
			bC: _Browser_doc.documentElement.clientHeight
		}
	};
}

function _Browser_getScene()
{
	var body = _Browser_doc.body;
	var elem = _Browser_doc.documentElement;
	return {
		cD: Math.max(body.scrollWidth, body.offsetWidth, elem.scrollWidth, elem.offsetWidth, elem.clientWidth),
		bC: Math.max(body.scrollHeight, body.offsetHeight, elem.scrollHeight, elem.offsetHeight, elem.clientHeight)
	};
}

var _Browser_setViewport = F2(function(x, y)
{
	return _Browser_withWindow(function()
	{
		_Browser_window.scroll(x, y);
		return _Utils_Tuple0;
	});
});



// ELEMENT VIEWPORT


function _Browser_getViewportOf(id)
{
	return _Browser_withNode(id, function(node)
	{
		return {
			aS: {
				cD: node.scrollWidth,
				bC: node.scrollHeight
			},
			a1: {
				a2: node.scrollLeft,
				a3: node.scrollTop,
				cD: node.clientWidth,
				bC: node.clientHeight
			}
		};
	});
}


var _Browser_setViewportOf = F3(function(id, x, y)
{
	return _Browser_withNode(id, function(node)
	{
		node.scrollLeft = x;
		node.scrollTop = y;
		return _Utils_Tuple0;
	});
});



// ELEMENT


function _Browser_getElement(id)
{
	return _Browser_withNode(id, function(node)
	{
		var rect = node.getBoundingClientRect();
		var x = _Browser_window.pageXOffset;
		var y = _Browser_window.pageYOffset;
		return {
			aS: _Browser_getScene(),
			a1: {
				a2: x,
				a3: y,
				cD: _Browser_doc.documentElement.clientWidth,
				bC: _Browser_doc.documentElement.clientHeight
			},
			bn: {
				a2: x + rect.left,
				a3: y + rect.top,
				cD: rect.width,
				bC: rect.height
			}
		};
	});
}



// LOAD and RELOAD


function _Browser_reload(skipCache)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function(callback)
	{
		_VirtualDom_doc.location.reload(skipCache);
	}));
}

function _Browser_load(url)
{
	return A2(elm$core$Task$perform, elm$core$Basics$never, _Scheduler_binding(function(callback)
	{
		try
		{
			_Browser_window.location = url;
		}
		catch(err)
		{
			// Only Firefox can throw a NS_ERROR_MALFORMED_URI exception here.
			// Other browsers reload the page, so let's be consistent about that.
			_VirtualDom_doc.location.reload(false);
		}
	}));
}



function _Time_now(millisToPosix)
{
	return _Scheduler_binding(function(callback)
	{
		callback(_Scheduler_succeed(millisToPosix(Date.now())));
	});
}

var _Time_setInterval = F2(function(interval, task)
{
	return _Scheduler_binding(function(callback)
	{
		var id = setInterval(function() { _Scheduler_rawSpawn(task); }, interval);
		return function() { clearInterval(id); };
	});
});

function _Time_here()
{
	return _Scheduler_binding(function(callback)
	{
		callback(_Scheduler_succeed(
			A2(elm$time$Time$customZone, -(new Date().getTimezoneOffset()), _List_Nil)
		));
	});
}


function _Time_getZoneName()
{
	return _Scheduler_binding(function(callback)
	{
		try
		{
			var name = elm$time$Time$Name(Intl.DateTimeFormat().resolvedOptions().timeZone);
		}
		catch (e)
		{
			var name = elm$time$Time$Offset(new Date().getTimezoneOffset());
		}
		callback(_Scheduler_succeed(name));
	});
}
var TSFoster$elm_uuid$UUID$UUID = elm$core$Basics$identity;
var elm$core$Basics$composeR = F3(
	function (f, g, x) {
		return g(
			f(x));
	});
var elm$core$Basics$identity = function (x) {
	return x;
};
var elm$core$Bitwise$and = _Bitwise_and;
var elm$core$Bitwise$or = _Bitwise_or;
var TSFoster$elm_uuid$UUID$setVariantBits = function (v) {
	switch (v) {
		case 1:
			return A2(
				elm$core$Basics$composeR,
				elm$core$Bitwise$and(63),
				elm$core$Bitwise$or(128));
		case 2:
			return A2(
				elm$core$Basics$composeR,
				elm$core$Bitwise$and(31),
				elm$core$Bitwise$or(192));
		default:
			return elm$core$Basics$identity;
	}
};
var elm$core$Elm$JsArray$foldr = _JsArray_foldr;
var elm$core$Array$foldr = F3(
	function (func, baseCase, _n0) {
		var tree = _n0.c;
		var tail = _n0.d;
		var helper = F2(
			function (node, acc) {
				if (!node.$) {
					var subTree = node.a;
					return A3(elm$core$Elm$JsArray$foldr, helper, acc, subTree);
				} else {
					var values = node.a;
					return A3(elm$core$Elm$JsArray$foldr, func, acc, values);
				}
			});
		return A3(
			elm$core$Elm$JsArray$foldr,
			helper,
			A3(elm$core$Elm$JsArray$foldr, func, baseCase, tail),
			tree);
	});
var elm$core$Basics$EQ = 1;
var elm$core$Basics$LT = 0;
var elm$core$List$cons = _List_cons;
var elm$core$Array$toList = function (array) {
	return A3(elm$core$Array$foldr, elm$core$List$cons, _List_Nil, array);
};
var elm$core$Basics$GT = 2;
var elm$core$Dict$foldr = F3(
	function (func, acc, t) {
		foldr:
		while (true) {
			if (t.$ === -2) {
				return acc;
			} else {
				var key = t.b;
				var value = t.c;
				var left = t.d;
				var right = t.e;
				var $temp$func = func,
					$temp$acc = A3(
					func,
					key,
					value,
					A3(elm$core$Dict$foldr, func, acc, right)),
					$temp$t = left;
				func = $temp$func;
				acc = $temp$acc;
				t = $temp$t;
				continue foldr;
			}
		}
	});
var elm$core$Dict$toList = function (dict) {
	return A3(
		elm$core$Dict$foldr,
		F3(
			function (key, value, list) {
				return A2(
					elm$core$List$cons,
					_Utils_Tuple2(key, value),
					list);
			}),
		_List_Nil,
		dict);
};
var elm$core$Dict$keys = function (dict) {
	return A3(
		elm$core$Dict$foldr,
		F3(
			function (key, value, keyList) {
				return A2(elm$core$List$cons, key, keyList);
			}),
		_List_Nil,
		dict);
};
var elm$core$Set$toList = function (_n0) {
	var dict = _n0;
	return elm$core$Dict$keys(dict);
};
var elm$core$Basics$append = _Utils_append;
var elm$core$Basics$lt = _Utils_lt;
var elm$core$Basics$le = _Utils_le;
var elm$core$Basics$sub = _Basics_sub;
var elm$core$List$drop = F2(
	function (n, list) {
		drop:
		while (true) {
			if (n <= 0) {
				return list;
			} else {
				if (!list.b) {
					return list;
				} else {
					var x = list.a;
					var xs = list.b;
					var $temp$n = n - 1,
						$temp$list = xs;
					n = $temp$n;
					list = $temp$list;
					continue drop;
				}
			}
		}
	});
var elm$core$Basics$add = _Basics_add;
var elm$core$Basics$gt = _Utils_gt;
var elm$core$List$foldl = F3(
	function (func, acc, list) {
		foldl:
		while (true) {
			if (!list.b) {
				return acc;
			} else {
				var x = list.a;
				var xs = list.b;
				var $temp$func = func,
					$temp$acc = A2(func, x, acc),
					$temp$list = xs;
				func = $temp$func;
				acc = $temp$acc;
				list = $temp$list;
				continue foldl;
			}
		}
	});
var elm$core$List$reverse = function (list) {
	return A3(elm$core$List$foldl, elm$core$List$cons, _List_Nil, list);
};
var elm$core$List$takeReverse = F3(
	function (n, list, kept) {
		takeReverse:
		while (true) {
			if (n <= 0) {
				return kept;
			} else {
				if (!list.b) {
					return kept;
				} else {
					var x = list.a;
					var xs = list.b;
					var $temp$n = n - 1,
						$temp$list = xs,
						$temp$kept = A2(elm$core$List$cons, x, kept);
					n = $temp$n;
					list = $temp$list;
					kept = $temp$kept;
					continue takeReverse;
				}
			}
		}
	});
var elm$core$List$takeTailRec = F2(
	function (n, list) {
		return elm$core$List$reverse(
			A3(elm$core$List$takeReverse, n, list, _List_Nil));
	});
var elm$core$List$takeFast = F3(
	function (ctr, n, list) {
		if (n <= 0) {
			return _List_Nil;
		} else {
			var _n0 = _Utils_Tuple2(n, list);
			_n0$1:
			while (true) {
				_n0$5:
				while (true) {
					if (!_n0.b.b) {
						return list;
					} else {
						if (_n0.b.b.b) {
							switch (_n0.a) {
								case 1:
									break _n0$1;
								case 2:
									var _n2 = _n0.b;
									var x = _n2.a;
									var _n3 = _n2.b;
									var y = _n3.a;
									return _List_fromArray(
										[x, y]);
								case 3:
									if (_n0.b.b.b.b) {
										var _n4 = _n0.b;
										var x = _n4.a;
										var _n5 = _n4.b;
										var y = _n5.a;
										var _n6 = _n5.b;
										var z = _n6.a;
										return _List_fromArray(
											[x, y, z]);
									} else {
										break _n0$5;
									}
								default:
									if (_n0.b.b.b.b && _n0.b.b.b.b.b) {
										var _n7 = _n0.b;
										var x = _n7.a;
										var _n8 = _n7.b;
										var y = _n8.a;
										var _n9 = _n8.b;
										var z = _n9.a;
										var _n10 = _n9.b;
										var w = _n10.a;
										var tl = _n10.b;
										return (ctr > 1000) ? A2(
											elm$core$List$cons,
											x,
											A2(
												elm$core$List$cons,
												y,
												A2(
													elm$core$List$cons,
													z,
													A2(
														elm$core$List$cons,
														w,
														A2(elm$core$List$takeTailRec, n - 4, tl))))) : A2(
											elm$core$List$cons,
											x,
											A2(
												elm$core$List$cons,
												y,
												A2(
													elm$core$List$cons,
													z,
													A2(
														elm$core$List$cons,
														w,
														A3(elm$core$List$takeFast, ctr + 1, n - 4, tl)))));
									} else {
										break _n0$5;
									}
							}
						} else {
							if (_n0.a === 1) {
								break _n0$1;
							} else {
								break _n0$5;
							}
						}
					}
				}
				return list;
			}
			var _n1 = _n0.b;
			var x = _n1.a;
			return _List_fromArray(
				[x]);
		}
	});
var elm$core$List$take = F2(
	function (n, list) {
		return A3(elm$core$List$takeFast, 0, n, list);
	});
var elm_community$list_extra$List$Extra$updateAt = F3(
	function (index, fn, list) {
		if (index < 0) {
			return list;
		} else {
			var tail = A2(elm$core$List$drop, index, list);
			var head = A2(elm$core$List$take, index, list);
			if (tail.b) {
				var x = tail.a;
				var xs = tail.b;
				return _Utils_ap(
					head,
					A2(
						elm$core$List$cons,
						fn(x),
						xs));
			} else {
				return list;
			}
		}
	});
var TSFoster$elm_uuid$UUID$toVariant = F2(
	function (v, _n0) {
		var bytes = _n0;
		return A3(
			elm_community$list_extra$List$Extra$updateAt,
			8,
			TSFoster$elm_uuid$UUID$setVariantBits(v),
			bytes);
	});
var elm$core$Basics$apR = F2(
	function (x, f) {
		return f(x);
	});
var elm$core$Bitwise$shiftLeftBy = _Bitwise_shiftLeftBy;
var TSFoster$elm_uuid$UUID$toVersion = F2(
	function (v, _n0) {
		var bytes = _n0;
		var updateFn = A2(
			elm_community$list_extra$List$Extra$updateAt,
			6,
			A2(
				elm$core$Basics$composeR,
				elm$core$Bitwise$and(15),
				elm$core$Bitwise$or((15 & v) << 4)));
		return updateFn(bytes);
	});
var elm$core$Basics$eq = _Utils_equal;
var elm$core$Basics$negate = function (n) {
	return -n;
};
var elm$core$Basics$remainderBy = _Basics_remainderBy;
var elm$core$Bitwise$shiftRightZfBy = _Bitwise_shiftRightZfBy;
var elm$random$Random$Generator = elm$core$Basics$identity;
var elm$core$Basics$mul = _Basics_mul;
var elm$random$Random$Seed = F2(
	function (a, b) {
		return {$: 0, a: a, b: b};
	});
var elm$random$Random$next = function (_n0) {
	var state0 = _n0.a;
	var incr = _n0.b;
	return A2(elm$random$Random$Seed, ((state0 * 1664525) + incr) >>> 0, incr);
};
var elm$core$Bitwise$xor = _Bitwise_xor;
var elm$random$Random$peel = function (_n0) {
	var state = _n0.a;
	var word = (state ^ (state >>> ((state >>> 28) + 4))) * 277803737;
	return ((word >>> 22) ^ word) >>> 0;
};
var elm$random$Random$int = F2(
	function (a, b) {
		return function (seed0) {
			var _n0 = (_Utils_cmp(a, b) < 0) ? _Utils_Tuple2(a, b) : _Utils_Tuple2(b, a);
			var lo = _n0.a;
			var hi = _n0.b;
			var range = (hi - lo) + 1;
			if (!((range - 1) & range)) {
				return _Utils_Tuple2(
					(((range - 1) & elm$random$Random$peel(seed0)) >>> 0) + lo,
					elm$random$Random$next(seed0));
			} else {
				var threshhold = (((-range) >>> 0) % range) >>> 0;
				var accountForBias = function (seed) {
					accountForBias:
					while (true) {
						var x = elm$random$Random$peel(seed);
						var seedN = elm$random$Random$next(seed);
						if (_Utils_cmp(x, threshhold) < 0) {
							var $temp$seed = seedN;
							seed = $temp$seed;
							continue accountForBias;
						} else {
							return _Utils_Tuple2((x % range) + lo, seedN);
						}
					}
				};
				return accountForBias(seed0);
			}
		};
	});
var elm$random$Random$listHelp = F4(
	function (revList, n, gen, seed) {
		listHelp:
		while (true) {
			if (n < 1) {
				return _Utils_Tuple2(revList, seed);
			} else {
				var _n0 = gen(seed);
				var value = _n0.a;
				var newSeed = _n0.b;
				var $temp$revList = A2(elm$core$List$cons, value, revList),
					$temp$n = n - 1,
					$temp$gen = gen,
					$temp$seed = newSeed;
				revList = $temp$revList;
				n = $temp$n;
				gen = $temp$gen;
				seed = $temp$seed;
				continue listHelp;
			}
		}
	});
var elm$random$Random$list = F2(
	function (n, _n0) {
		var gen = _n0;
		return function (seed) {
			return A4(elm$random$Random$listHelp, _List_Nil, n, gen, seed);
		};
	});
var elm$random$Random$map = F2(
	function (func, _n0) {
		var genA = _n0;
		return function (seed0) {
			var _n1 = genA(seed0);
			var a = _n1.a;
			var seed1 = _n1.b;
			return _Utils_Tuple2(
				func(a),
				seed1);
		};
	});
var TSFoster$elm_uuid$UUID$generator = A2(
	elm$random$Random$map,
	TSFoster$elm_uuid$UUID$toVariant(1),
	A2(
		elm$random$Random$map,
		TSFoster$elm_uuid$UUID$toVersion(4),
		A2(
			elm$random$Random$map,
			elm$core$Basics$identity,
			A2(
				elm$random$Random$list,
				16,
				A2(elm$random$Random$int, 0, 255)))));
var author$project$InitialModel$frequence = 40;
var elm$core$Maybe$Just = function (a) {
	return {$: 0, a: a};
};
var author$project$Map$Generator$fill = F2(
	function (f, l) {
		if (l.b) {
			var x = l.a;
			var xs = l.b;
			return A2(
				elm$core$List$cons,
				_Utils_update(
					f,
					{
						cc: elm$core$Maybe$Just(x)
					}),
				A2(author$project$Map$Generator$fill, f, xs));
		} else {
			return _List_Nil;
		}
	});
var author$project$Map$Generator$possibleTileCoords = function (m) {
	var createRows = F2(
		function (yp, xp) {
			return (_Utils_cmp(xp, m.p.cD * m.p.B) < 0) ? A2(
				elm$core$List$cons,
				{a2: xp, a3: yp},
				A2(createRows, yp, xp + m.p.B)) : ((_Utils_cmp(yp, m.p.bC * m.p.B) < 0) ? A2(
				elm$core$List$cons,
				{a2: 0, a3: yp + m.p.B},
				A2(createRows, yp + m.p.B, 0 + m.p.B)) : _List_Nil);
		});
	return A2(createRows, 0, 0);
};
var author$project$Objects$Physics$setSpeed = F2(
	function (speed, gO) {
		var _n0 = gO.aC;
		if (!_n0.$) {
			var motion = _n0.a;
			return _Utils_update(
				gO,
				{
					aC: elm$core$Maybe$Just(
						_Utils_update(
							motion,
							{aV: speed}))
				});
		} else {
			return gO;
		}
	});
var elm$core$Basics$fdiv = _Basics_fdiv;
var elm$core$Basics$ge = _Utils_ge;
var author$project$Objects$Physics$brakeTo = F2(
	function (limit, gO) {
		var _n0 = gO.aC;
		if (!_n0.$) {
			var motion = _n0.a;
			var brakeFactor = motion.aV / 7.5;
			return (_Utils_cmp(motion.aV, limit + brakeFactor) > -1) ? A2(author$project$Objects$Physics$setSpeed, motion.aV - brakeFactor, gO) : ((_Utils_cmp(motion.aV, limit) > -1) ? A2(author$project$Objects$Physics$setSpeed, limit, gO) : gO);
		} else {
			return gO;
		}
	});
var author$project$Objects$Physics$slowDown = F2(
	function (impact, gO) {
		return A2(author$project$Objects$Physics$brakeTo, 20, gO);
	});
var author$project$Types$Background = 3;
var author$project$Types$Impact = elm$core$Basics$identity;
var author$project$Types$Rect = function (a) {
	return {$: 0, a: a};
};
var elm$core$Basics$False = 1;
var elm$core$Maybe$Nothing = {$: 1};
var author$project$Objects$Tiles$Background$dust = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 64,
				bE: elm$core$Maybe$Just(
					{
						O: 0,
						bu: elm$core$Maybe$Just(author$project$Objects$Physics$slowDown),
						au: 'background',
						b6: false,
						a0: elm$core$Maybe$Nothing
					}),
				cc: {a2: 0, a3: 0},
				a$: elm$core$Maybe$Nothing,
				cD: 64
			})),
	au: 'BackgroundDust',
	bL: 3,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 64},
	ck: 'assets/background.png',
	cl: elm$core$Maybe$Nothing
};
var author$project$Map$Track$DustRace$background = author$project$Objects$Tiles$Background$dust;
var author$project$Objects$Utils$position = F2(
	function (p, gO) {
		return _Utils_update(
			gO,
			{cc: p});
	});
var author$project$Objects$Module$position = author$project$Objects$Utils$position;
var author$project$Objects$Utils$rotate = F2(
	function (r, gO) {
		return _Utils_update(
			gO,
			{ae: r});
	});
var author$project$Objects$Module$rotate = author$project$Objects$Utils$rotate;
var elm$core$Basics$not = _Basics_not;
var elm$core$Basics$or = _Basics_or;
var author$project$Objects$Trigger$catchCheckpoint = F2(
	function (gO, m) {
		var snatch = function (l) {
			if (l.b) {
				var x = l.a;
				var xs = l.b;
				return _Utils_eq(gO.au, x.au) || snatch(xs);
			} else {
				return false;
			}
		};
		var myPlayer = m.k;
		var controlledObject = myPlayer.S;
		var catchedCheckpoints = myPlayer.bd;
		var activateCheckpoint = _Utils_update(
			gO,
			{bg: elm$core$Maybe$Nothing, ck: 'assets/decor/checkboxActiveRoadCurve.png'});
		return (!snatch(catchedCheckpoints)) ? _Utils_update(
			m,
			{
				k: _Utils_update(
					myPlayer,
					{
						bd: A2(elm$core$List$cons, activateCheckpoint, catchedCheckpoints)
					})
			}) : m;
	});
var author$project$Types$Checkpoint = 1;
var elm$core$Basics$True = 0;
var author$project$Objects$Tiles$Checkpoint$checkBox = function (identifier) {
	return {
		bg: elm$core$Maybe$Just(
			author$project$Types$Rect(
				{
					bC: 64,
					bE: elm$core$Maybe$Just(
						{O: 100, bu: elm$core$Maybe$Nothing, au: 'checkbox-' + identifier, b6: true, a0: elm$core$Maybe$Nothing}),
					cc: {a2: 0, a3: 0},
					a$: elm$core$Maybe$Just(author$project$Objects$Trigger$catchCheckpoint),
					cD: 64
				})),
		au: 'checkbox-' + identifier,
		bL: 1,
		aC: elm$core$Maybe$Nothing,
		b8: elm$core$Maybe$Nothing,
		cc: elm$core$Maybe$Nothing,
		ae: 0,
		cj: {bC: 64, cD: 64},
		ck: 'assets/decor/checkboxRoadCurve.png',
		cl: elm$core$Maybe$Nothing
	};
};
var author$project$Map$Track$DustRace$checkBox = _List_fromArray(
	[
		A2(
		author$project$Objects$Module$rotate,
		180,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 896, a3: 64}),
			author$project$Objects$Tiles$Checkpoint$checkBox('1'))),
		A2(
		author$project$Objects$Module$rotate,
		270,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 896, a3: 448}),
			author$project$Objects$Tiles$Checkpoint$checkBox('2'))),
		A2(
		author$project$Objects$Module$rotate,
		0,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 512, a3: 448}),
			author$project$Objects$Tiles$Checkpoint$checkBox('3'))),
		A2(
		author$project$Objects$Module$rotate,
		180,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 512, a3: 256}),
			author$project$Objects$Tiles$Checkpoint$checkBox('4'))),
		A2(
		author$project$Objects$Module$rotate,
		0,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 64, a3: 320}),
			author$project$Objects$Tiles$Checkpoint$checkBox('5'))),
		A2(
		author$project$Objects$Module$rotate,
		90,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 64, a3: 64}),
			author$project$Objects$Tiles$Checkpoint$checkBox('6')))
	]);
var author$project$Objects$Physics$getDirectionFromGameObject = function (gO) {
	var _n0 = gO.aC;
	if (!_n0.$) {
		var motion = _n0.a;
		return (motion.aV > 0) ? 1 : ((motion.aV < 0) ? (-1) : 0);
	} else {
		return 0;
	}
};
var author$project$Objects$Physics$getDirectionFromImpact = function (impact) {
	var i = impact;
	var _n1 = i.a0;
	if (!_n1.$) {
		var gameObject = _n1.a;
		return author$project$Objects$Physics$getDirectionFromGameObject(gameObject);
	} else {
		return 0;
	}
};
var author$project$Objects$Physics$overwriteSpeedLimits = F3(
	function (maxForwardSpeed, maxBackwardSpeed, gO) {
		var _n0 = gO.aC;
		if (!_n0.$) {
			var motion = _n0.a;
			return (_Utils_cmp(motion.aV, maxForwardSpeed) > 0) ? A2(author$project$Objects$Physics$setSpeed, maxForwardSpeed, gO) : ((_Utils_cmp(motion.aV, -maxBackwardSpeed) < 0) ? A2(author$project$Objects$Physics$setSpeed, -maxBackwardSpeed, gO) : A2(author$project$Objects$Physics$setSpeed, motion.aV, gO));
		} else {
			return gO;
		}
	});
var elm$core$Basics$apL = F2(
	function (f, x) {
		return f(x);
	});
var author$project$Objects$Physics$bump = F2(
	function (impact, gO) {
		return (author$project$Objects$Physics$getDirectionFromImpact(impact) > 0) ? A3(
			author$project$Objects$Physics$overwriteSpeedLimits,
			40,
			20,
			A2(author$project$Objects$Physics$setSpeed, -80, gO)) : ((author$project$Objects$Physics$getDirectionFromImpact(impact) < 0) ? A3(
			author$project$Objects$Physics$overwriteSpeedLimits,
			20,
			20,
			A2(author$project$Objects$Physics$setSpeed, 80, gO)) : gO);
	});
var author$project$Types$Decor = 5;
var author$project$Objects$Tiles$Decor$bush1 = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 32,
				bE: elm$core$Maybe$Just(
					{
						O: 100,
						bu: elm$core$Maybe$Just(author$project$Objects$Physics$bump),
						au: 'Bush1',
						b6: true,
						a0: elm$core$Maybe$Nothing
					}),
				cc: {a2: 16, a3: 16},
				a$: elm$core$Maybe$Nothing,
				cD: 32
			})),
	au: 'Bush1',
	bL: 5,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 64},
	ck: 'assets/decor/Bush_01.png',
	cl: elm$core$Maybe$Nothing
};
var author$project$Objects$Tiles$Decor$bush2 = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 32,
				bE: elm$core$Maybe$Just(
					{
						O: 100,
						bu: elm$core$Maybe$Just(author$project$Objects$Physics$bump),
						au: 'Bush2',
						b6: true,
						a0: elm$core$Maybe$Nothing
					}),
				cc: {a2: 16, a3: 16},
				a$: elm$core$Maybe$Nothing,
				cD: 32
			})),
	au: 'Bush2',
	bL: 5,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 64},
	ck: 'assets/decor/Bush_02.png',
	cl: elm$core$Maybe$Nothing
};
var author$project$Objects$Tiles$Decor$invisible = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 64,
				bE: elm$core$Maybe$Just(
					{
						O: 100,
						bu: elm$core$Maybe$Just(author$project$Objects$Physics$bump),
						au: 'invisible',
						b6: true,
						a0: elm$core$Maybe$Nothing
					}),
				cc: {a2: 0, a3: 0},
				a$: elm$core$Maybe$Nothing,
				cD: 64
			})),
	au: 'invisible',
	bL: 5,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 64},
	ck: '',
	cl: elm$core$Maybe$Nothing
};
var author$project$Objects$Tiles$Decor$platformBlue = {
	bg: elm$core$Maybe$Nothing,
	au: 'PlatformBlue',
	bL: 5,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 128},
	ck: 'assets/decor/Pavilion_01.png',
	cl: elm$core$Maybe$Nothing
};
var author$project$Objects$Tiles$Decor$rock1 = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 20,
				bE: elm$core$Maybe$Just(
					{
						O: 100,
						bu: elm$core$Maybe$Just(author$project$Objects$Physics$bump),
						au: 'Rock1',
						b6: true,
						a0: elm$core$Maybe$Nothing
					}),
				cc: {a2: 0, a3: 5},
				a$: elm$core$Maybe$Nothing,
				cD: 32
			})),
	au: 'Rock1',
	bL: 5,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 32, cD: 32},
	ck: 'assets/decor/Rock_01.png',
	cl: elm$core$Maybe$Nothing
};
var author$project$Objects$Tiles$Decor$rock2 = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 20,
				bE: elm$core$Maybe$Just(
					{
						O: 100,
						bu: elm$core$Maybe$Just(author$project$Objects$Physics$bump),
						au: 'Rock2',
						b6: true,
						a0: elm$core$Maybe$Nothing
					}),
				cc: {a2: 0, a3: 5},
				a$: elm$core$Maybe$Nothing,
				cD: 32
			})),
	au: 'Rock2',
	bL: 5,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 32, cD: 32},
	ck: 'assets/decor/Rock_02.png',
	cl: elm$core$Maybe$Nothing
};
var author$project$Objects$Tiles$Decor$tree2 = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 54,
				bE: elm$core$Maybe$Just(
					{
						O: 100,
						bu: elm$core$Maybe$Just(author$project$Objects$Physics$bump),
						au: 'Tree2',
						b6: true,
						a0: elm$core$Maybe$Nothing
					}),
				cc: {a2: 5, a3: 5},
				a$: elm$core$Maybe$Nothing,
				cD: 54
			})),
	au: 'Tree2',
	bL: 5,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 64},
	ck: 'assets/decor/Tree_02.png',
	cl: elm$core$Maybe$Nothing
};
var author$project$Map$Track$DustRace$decor = _Utils_ap(
	_List_fromArray(
		[
			A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 448, a3: 0}),
			author$project$Objects$Tiles$Decor$platformBlue)
		]),
	_Utils_ap(
		A2(
			author$project$Map$Generator$fill,
			author$project$Objects$Tiles$Decor$bush1,
			_List_fromArray(
				[
					{a2: 384, a3: 0},
					{a2: 590, a3: 0}
				])),
		_Utils_ap(
			A2(
				author$project$Map$Generator$fill,
				author$project$Objects$Tiles$Decor$bush2,
				_List_fromArray(
					[
						{a2: 448, a3: 320},
						{a2: 576, a3: 384}
					])),
			_Utils_ap(
				A2(
					author$project$Map$Generator$fill,
					author$project$Objects$Tiles$Decor$rock1,
					_List_fromArray(
						[
							{a2: 858, a3: 416},
							{a2: 138, a3: 138}
						])),
				_Utils_ap(
					A2(
						author$project$Map$Generator$fill,
						author$project$Objects$Tiles$Decor$rock2,
						_List_fromArray(
							[
								{a2: 138, a3: 224}
							])),
					_Utils_ap(
						A2(
							author$project$Map$Generator$fill,
							author$project$Objects$Tiles$Decor$tree2,
							_List_fromArray(
								[
									{a2: 32, a3: 365},
									{a2: 96, a3: 390},
									{a2: 160, a3: 370},
									{a2: 0, a3: 250},
									{a2: 0, a3: 310},
									{a2: 192, a3: 320}
								])),
						A2(
							author$project$Map$Generator$fill,
							author$project$Objects$Tiles$Decor$invisible,
							_List_fromArray(
								[
									{a2: -64, a3: 0},
									{a2: -64, a3: 64},
									{a2: -64, a3: 128},
									{a2: -64, a3: 192},
									{a2: -64, a3: 256},
									{a2: -64, a3: 320},
									{a2: -64, a3: 384},
									{a2: -64, a3: 448},
									{a2: -64, a3: 512},
									{a2: -64, a3: -64},
									{a2: 0, a3: -64},
									{a2: 64, a3: -64},
									{a2: 128, a3: -64},
									{a2: 192, a3: -64},
									{a2: 256, a3: -64},
									{a2: 320, a3: -64},
									{a2: 384, a3: -64},
									{a2: 448, a3: -64},
									{a2: 512, a3: -64},
									{a2: 576, a3: -64},
									{a2: 640, a3: -64},
									{a2: 704, a3: -64},
									{a2: 768, a3: -64},
									{a2: 832, a3: -64},
									{a2: 896, a3: -64},
									{a2: 960, a3: -64},
									{a2: 1024, a3: -64},
									{a2: 1024, a3: 0},
									{a2: 1024, a3: 64},
									{a2: 1024, a3: 128},
									{a2: 1024, a3: 192},
									{a2: 1024, a3: 256},
									{a2: 1024, a3: 320},
									{a2: 1024, a3: 384},
									{a2: 1024, a3: 448},
									{a2: 1024, a3: 512},
									{a2: 0, a3: 576},
									{a2: 64, a3: 576},
									{a2: 128, a3: 576},
									{a2: 192, a3: 576},
									{a2: 256, a3: 576},
									{a2: 320, a3: 576},
									{a2: 384, a3: 576},
									{a2: 448, a3: 576},
									{a2: 512, a3: 576},
									{a2: 576, a3: 576},
									{a2: 640, a3: 576},
									{a2: 704, a3: 576},
									{a2: 768, a3: 576},
									{a2: 832, a3: 576},
									{a2: 896, a3: 576},
									{a2: 960, a3: 576},
									{a2: 1024, a3: 576}
								]))))))));
var author$project$Types$Finished = 1;
var elm$core$Basics$and = _Basics_and;
var author$project$Objects$Trigger$endCheckpoint = F2(
	function (gO, m) {
		var myPlayer = m.k;
		var getCheckpoints = function (l) {
			getCheckpoints:
			while (true) {
				if (l.b) {
					var x = l.a;
					var xs = l.b;
					if (x.bL === 1) {
						return A2(
							elm$core$List$cons,
							x,
							getCheckpoints(xs));
					} else {
						var $temp$l = xs;
						l = $temp$l;
						continue getCheckpoints;
					}
				} else {
					return _List_Nil;
				}
			}
		};
		var neededCheckpoints = getCheckpoints(m.ay.Q.cv);
		var catchedCheckpoints = A2(elm$core$List$cons, gO, myPlayer.bd);
		var approvedHelper = F2(
			function (g, l) {
				if (l.b) {
					var x = l.a;
					var xs = l.b;
					return _Utils_eq(g.au, x.au) || A2(approvedHelper, g, xs);
				} else {
					return false;
				}
			});
		var approved = function (l) {
			if (l.b) {
				var x = l.a;
				var xs = l.b;
				return A2(approvedHelper, x, catchedCheckpoints) && approved(xs);
			} else {
				return true;
			}
		};
		return approved(neededCheckpoints) ? ((_Utils_cmp(m.k.bj, m.ay.b5.bR) < 0) ? _Utils_update(
			m,
			{
				k: _Utils_update(
					myPlayer,
					{bd: _List_Nil, bj: myPlayer.bj + 1})
			}) : _Utils_update(
			m,
			{aW: 1})) : m;
	});
var author$project$Objects$Tiles$Checkpoint$finishLine = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 64,
				bE: elm$core$Maybe$Just(
					{O: 100, bu: elm$core$Maybe$Nothing, au: 'FinishLine', b6: true, a0: elm$core$Maybe$Nothing}),
				cc: {a2: 0, a3: 0},
				a$: elm$core$Maybe$Just(author$project$Objects$Trigger$endCheckpoint),
				cD: 20
			})),
	au: 'FinishLine',
	bL: 1,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 20},
	ck: 'assets/decor/Finish.png',
	cl: elm$core$Maybe$Nothing
};
var author$project$Map$Track$DustRace$finishLine = A2(
	author$project$Objects$Module$position,
	elm$core$Maybe$Just(
		{a2: 492, a3: 65}),
	A2(author$project$Objects$Module$rotate, 0, author$project$Objects$Tiles$Checkpoint$finishLine));
var author$project$Types$Road = 4;
var author$project$Objects$Tiles$Road$curveTopRight = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 64,
				bE: elm$core$Maybe$Just(
					{O: 0, bu: elm$core$Maybe$Nothing, au: 'road', b6: true, a0: elm$core$Maybe$Nothing}),
				cc: {a2: 0, a3: 0},
				a$: elm$core$Maybe$Nothing,
				cD: 64
			})),
	au: 'RoadStraight',
	bL: 4,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 64},
	ck: 'assets/roadCurve.png',
	cl: elm$core$Maybe$Just('assets/minimapRoadCurve.png')
};
var author$project$Objects$Tiles$Road$straight = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 64,
				bE: elm$core$Maybe$Just(
					{O: 0, bu: elm$core$Maybe$Nothing, au: 'road', b6: true, a0: elm$core$Maybe$Nothing}),
				cc: {a2: 0, a3: 0},
				a$: elm$core$Maybe$Nothing,
				cD: 64
			})),
	au: 'RoadStraight',
	bL: 4,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 64},
	ck: 'assets/roadStraight.png',
	cl: elm$core$Maybe$Just('assets/minimapRoadStraight.png')
};
var author$project$Map$Track$DustRace$roads = _Utils_ap(
	A2(
		author$project$Map$Generator$fill,
		author$project$Objects$Tiles$Road$straight,
		_List_fromArray(
			[
				{a2: 64, a3: 128},
				{a2: 64, a3: 192},
				{a2: 64, a3: 256},
				{a2: 512, a3: 320},
				{a2: 512, a3: 384},
				{a2: 896, a3: 128},
				{a2: 896, a3: 192},
				{a2: 896, a3: 256},
				{a2: 896, a3: 320},
				{a2: 896, a3: 384}
			])),
	_Utils_ap(
		A2(
			author$project$Map$Generator$fill,
			A2(author$project$Objects$Module$rotate, 90, author$project$Objects$Tiles$Road$straight),
			_List_fromArray(
				[
					{a2: 128, a3: 64},
					{a2: 192, a3: 64},
					{a2: 256, a3: 64},
					{a2: 320, a3: 64},
					{a2: 384, a3: 64},
					{a2: 448, a3: 64},
					{a2: 512, a3: 64},
					{a2: 576, a3: 64},
					{a2: 640, a3: 64},
					{a2: 704, a3: 64},
					{a2: 768, a3: 64},
					{a2: 832, a3: 64},
					{a2: 192, a3: 256},
					{a2: 256, a3: 256},
					{a2: 320, a3: 256},
					{a2: 384, a3: 256},
					{a2: 448, a3: 256},
					{a2: 576, a3: 448},
					{a2: 640, a3: 448},
					{a2: 704, a3: 448},
					{a2: 768, a3: 448},
					{a2: 832, a3: 448}
				])),
		_Utils_ap(
			A2(
				author$project$Map$Generator$fill,
				A2(author$project$Objects$Module$rotate, 90, author$project$Objects$Tiles$Road$curveTopRight),
				_List_fromArray(
					[
						{a2: 64, a3: 64},
						{a2: 128, a3: 256}
					])),
			_Utils_ap(
				A2(
					author$project$Map$Generator$fill,
					A2(author$project$Objects$Module$rotate, 0, author$project$Objects$Tiles$Road$curveTopRight),
					_List_fromArray(
						[
							{a2: 64, a3: 320},
							{a2: 512, a3: 448}
						])),
				_Utils_ap(
					A2(
						author$project$Map$Generator$fill,
						A2(author$project$Objects$Module$rotate, 270, author$project$Objects$Tiles$Road$curveTopRight),
						_List_fromArray(
							[
								{a2: 128, a3: 320},
								{a2: 896, a3: 448}
							])),
					A2(
						author$project$Map$Generator$fill,
						A2(author$project$Objects$Module$rotate, 180, author$project$Objects$Tiles$Road$curveTopRight),
						_List_fromArray(
							[
								{a2: 512, a3: 256},
								{a2: 896, a3: 64}
							])))))));
var author$project$Objects$Trigger$startCheckpoint = F2(
	function (gO, m) {
		var myPlayer = m.k;
		return _Utils_update(
			m,
			{
				k: _Utils_update(
					myPlayer,
					{
						bd: _List_fromArray(
							[gO])
					})
			});
	});
var author$project$Objects$Tiles$Checkpoint$startLine = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 64,
				bE: elm$core$Maybe$Just(
					{O: 100, bu: elm$core$Maybe$Nothing, au: 'StartLine', b6: true, a0: elm$core$Maybe$Nothing}),
				cc: {a2: 0, a3: 0},
				a$: elm$core$Maybe$Just(author$project$Objects$Trigger$startCheckpoint),
				cD: 20
			})),
	au: 'StartLine',
	bL: 1,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 20},
	ck: '',
	cl: elm$core$Maybe$Nothing
};
var author$project$Map$Track$DustRace$startLine = A2(
	author$project$Objects$Module$position,
	elm$core$Maybe$Just(
		{a2: 512, a3: 65}),
	A2(author$project$Objects$Module$rotate, 90, author$project$Objects$Tiles$Checkpoint$startLine));
var author$project$Map$Track$DustRace$init = {
	p: {bC: 8, B: 64, cA: 2, cD: 16},
	Q: {
		ba: _List_Nil,
		bl: author$project$Map$Track$DustRace$decor,
		cf: author$project$Map$Track$DustRace$roads,
		cv: A2(
			elm$core$List$cons,
			author$project$Map$Track$DustRace$startLine,
			A2(elm$core$List$cons, author$project$Map$Track$DustRace$finishLine, author$project$Map$Track$DustRace$checkBox))
	},
	bZ: {bm: 'The dirty one!', b$: 'Dust Race'},
	b5: {
		bR: 2,
		cd: 3000,
		co: _List_fromArray(
			[
				{a2: 448, a3: 128}
			]),
		cp: 1
	}
};
var author$project$Map$Track$DustRace$model = function () {
	var map = author$project$Map$Track$DustRace$init;
	var gameObjects = author$project$Map$Track$DustRace$init.Q;
	return _Utils_update(
		map,
		{
			Q: _Utils_update(
				gameObjects,
				{
					ba: A2(
						author$project$Map$Generator$fill,
						author$project$Map$Track$DustRace$background,
						author$project$Map$Generator$possibleTileCoords(map))
				})
		});
}();
var author$project$Map$Track$Module$defaultTrack = author$project$Map$Track$DustRace$model;
var author$project$Objects$Tiles$Background$grass = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 64,
				bE: elm$core$Maybe$Just(
					{
						O: 0,
						bu: elm$core$Maybe$Just(author$project$Objects$Physics$slowDown),
						au: 'background',
						b6: false,
						a0: elm$core$Maybe$Nothing
					}),
				cc: {a2: 0, a3: 0},
				a$: elm$core$Maybe$Nothing,
				cD: 64
			})),
	au: 'BackgroundGrass',
	bL: 3,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 64, cD: 64},
	ck: 'assets/backgroundGrass.png',
	cl: elm$core$Maybe$Nothing
};
var author$project$Map$Track$SummerBreeze$background = author$project$Objects$Tiles$Background$grass;
var author$project$Map$Track$SummerBreeze$checkBox = _List_fromArray(
	[
		A2(
		author$project$Objects$Module$rotate,
		180,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 896, a3: 64}),
			author$project$Objects$Tiles$Checkpoint$checkBox('1'))),
		A2(
		author$project$Objects$Module$rotate,
		180,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 704, a3: 256}),
			author$project$Objects$Tiles$Checkpoint$checkBox('2'))),
		A2(
		author$project$Objects$Module$rotate,
		0,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 512, a3: 448}),
			author$project$Objects$Tiles$Checkpoint$checkBox('3'))),
		A2(
		author$project$Objects$Module$rotate,
		180,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 512, a3: 256}),
			author$project$Objects$Tiles$Checkpoint$checkBox('4'))),
		A2(
		author$project$Objects$Module$rotate,
		0,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 64, a3: 320}),
			author$project$Objects$Tiles$Checkpoint$checkBox('5'))),
		A2(
		author$project$Objects$Module$rotate,
		90,
		A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 64, a3: 64}),
			author$project$Objects$Tiles$Checkpoint$checkBox('6')))
	]);
var author$project$Objects$Tiles$Decor$house1 = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 96,
				bE: elm$core$Maybe$Just(
					{
						O: 100,
						bu: elm$core$Maybe$Just(author$project$Objects$Physics$bump),
						au: 'Tree1',
						b6: true,
						a0: elm$core$Maybe$Nothing
					}),
				cc: {a2: 5, a3: 5},
				a$: elm$core$Maybe$Nothing,
				cD: 64
			})),
	au: 'House1',
	bL: 5,
	aC: elm$core$Maybe$Nothing,
	b8: elm$core$Maybe$Nothing,
	cc: elm$core$Maybe$Nothing,
	ae: 0,
	cj: {bC: 96, cD: 64},
	ck: 'assets/decor/Decor_Building_01.png',
	cl: elm$core$Maybe$Nothing
};
var author$project$Map$Track$SummerBreeze$decor = _Utils_ap(
	_List_fromArray(
		[
			A2(
			author$project$Objects$Module$position,
			elm$core$Maybe$Just(
				{a2: 832, a3: 384}),
			author$project$Objects$Tiles$Decor$house1)
		]),
	_Utils_ap(
		A2(
			author$project$Map$Generator$fill,
			author$project$Objects$Tiles$Decor$bush1,
			_List_fromArray(
				[
					{a2: 384, a3: 0},
					{a2: 487, a3: 0},
					{a2: 590, a3: 0}
				])),
		_Utils_ap(
			A2(
				author$project$Map$Generator$fill,
				author$project$Objects$Tiles$Decor$bush2,
				_List_fromArray(
					[
						{a2: 448, a3: 320},
						{a2: 576, a3: 384}
					])),
			_Utils_ap(
				A2(
					author$project$Map$Generator$fill,
					author$project$Objects$Tiles$Decor$rock1,
					_List_fromArray(
						[
							{a2: 138, a3: 138}
						])),
				_Utils_ap(
					A2(
						author$project$Map$Generator$fill,
						author$project$Objects$Tiles$Decor$rock2,
						_List_fromArray(
							[
								{a2: 138, a3: 224}
							])),
					_Utils_ap(
						A2(
							author$project$Map$Generator$fill,
							author$project$Objects$Tiles$Decor$tree2,
							_List_fromArray(
								[
									{a2: 32, a3: 365},
									{a2: 96, a3: 390},
									{a2: 160, a3: 370},
									{a2: 0, a3: 250},
									{a2: 0, a3: 310},
									{a2: 192, a3: 320}
								])),
						A2(
							author$project$Map$Generator$fill,
							author$project$Objects$Tiles$Decor$invisible,
							_List_fromArray(
								[
									{a2: -64, a3: 0},
									{a2: -64, a3: 64},
									{a2: -64, a3: 128},
									{a2: -64, a3: 192},
									{a2: -64, a3: 256},
									{a2: -64, a3: 320},
									{a2: -64, a3: 384},
									{a2: -64, a3: 448},
									{a2: -64, a3: 512},
									{a2: -64, a3: -64},
									{a2: 0, a3: -64},
									{a2: 64, a3: -64},
									{a2: 128, a3: -64},
									{a2: 192, a3: -64},
									{a2: 256, a3: -64},
									{a2: 320, a3: -64},
									{a2: 384, a3: -64},
									{a2: 448, a3: -64},
									{a2: 512, a3: -64},
									{a2: 576, a3: -64},
									{a2: 640, a3: -64},
									{a2: 704, a3: -64},
									{a2: 768, a3: -64},
									{a2: 832, a3: -64},
									{a2: 896, a3: -64},
									{a2: 960, a3: -64},
									{a2: 1024, a3: -64},
									{a2: 1024, a3: 0},
									{a2: 1024, a3: 64},
									{a2: 1024, a3: 128},
									{a2: 1024, a3: 192},
									{a2: 1024, a3: 256},
									{a2: 1024, a3: 320},
									{a2: 1024, a3: 384},
									{a2: 1024, a3: 448},
									{a2: 1024, a3: 512},
									{a2: 0, a3: 576},
									{a2: 64, a3: 576},
									{a2: 128, a3: 576},
									{a2: 192, a3: 576},
									{a2: 256, a3: 576},
									{a2: 320, a3: 576},
									{a2: 384, a3: 576},
									{a2: 448, a3: 576},
									{a2: 512, a3: 576},
									{a2: 576, a3: 576},
									{a2: 640, a3: 576},
									{a2: 704, a3: 576},
									{a2: 768, a3: 576},
									{a2: 832, a3: 576},
									{a2: 896, a3: 576},
									{a2: 960, a3: 576},
									{a2: 1024, a3: 576}
								]))))))));
var author$project$Map$Track$SummerBreeze$finishLine = A2(
	author$project$Objects$Module$position,
	elm$core$Maybe$Just(
		{a2: 492, a3: 65}),
	A2(author$project$Objects$Module$rotate, 0, author$project$Objects$Tiles$Checkpoint$finishLine));
var author$project$Map$Track$SummerBreeze$roads = _Utils_ap(
	A2(
		author$project$Map$Generator$fill,
		author$project$Objects$Tiles$Road$straight,
		_List_fromArray(
			[
				{a2: 64, a3: 128},
				{a2: 64, a3: 192},
				{a2: 64, a3: 256},
				{a2: 512, a3: 320},
				{a2: 512, a3: 384},
				{a2: 640, a3: 192},
				{a2: 704, a3: 320},
				{a2: 704, a3: 384}
			])),
	_Utils_ap(
		A2(
			author$project$Map$Generator$fill,
			A2(author$project$Objects$Module$rotate, 90, author$project$Objects$Tiles$Road$straight),
			_List_fromArray(
				[
					{a2: 128, a3: 64},
					{a2: 192, a3: 64},
					{a2: 256, a3: 64},
					{a2: 320, a3: 64},
					{a2: 384, a3: 64},
					{a2: 448, a3: 64},
					{a2: 512, a3: 64},
					{a2: 576, a3: 64},
					{a2: 640, a3: 64},
					{a2: 704, a3: 64},
					{a2: 768, a3: 64},
					{a2: 832, a3: 64},
					{a2: 832, a3: 128},
					{a2: 768, a3: 128},
					{a2: 704, a3: 128},
					{a2: 192, a3: 256},
					{a2: 256, a3: 256},
					{a2: 320, a3: 256},
					{a2: 384, a3: 256},
					{a2: 448, a3: 256},
					{a2: 576, a3: 448},
					{a2: 640, a3: 448}
				])),
		_Utils_ap(
			A2(
				author$project$Map$Generator$fill,
				A2(author$project$Objects$Module$rotate, 90, author$project$Objects$Tiles$Road$curveTopRight),
				_List_fromArray(
					[
						{a2: 64, a3: 64},
						{a2: 128, a3: 256},
						{a2: 640, a3: 128}
					])),
			_Utils_ap(
				A2(
					author$project$Map$Generator$fill,
					A2(author$project$Objects$Module$rotate, 0, author$project$Objects$Tiles$Road$curveTopRight),
					_List_fromArray(
						[
							{a2: 64, a3: 320},
							{a2: 512, a3: 448},
							{a2: 640, a3: 256}
						])),
				_Utils_ap(
					A2(
						author$project$Map$Generator$fill,
						A2(author$project$Objects$Module$rotate, 270, author$project$Objects$Tiles$Road$curveTopRight),
						_List_fromArray(
							[
								{a2: 128, a3: 320},
								{a2: 896, a3: 128},
								{a2: 704, a3: 448}
							])),
					A2(
						author$project$Map$Generator$fill,
						A2(author$project$Objects$Module$rotate, 180, author$project$Objects$Tiles$Road$curveTopRight),
						_List_fromArray(
							[
								{a2: 512, a3: 256},
								{a2: 896, a3: 64},
								{a2: 704, a3: 256}
							])))))));
var author$project$Map$Track$SummerBreeze$startLine = A2(
	author$project$Objects$Module$position,
	elm$core$Maybe$Just(
		{a2: 512, a3: 65}),
	A2(author$project$Objects$Module$rotate, 90, author$project$Objects$Tiles$Checkpoint$startLine));
var author$project$Map$Track$SummerBreeze$init = {
	p: {bC: 8, B: 64, cA: 2, cD: 16},
	Q: {
		ba: _List_Nil,
		bl: author$project$Map$Track$SummerBreeze$decor,
		cf: author$project$Map$Track$SummerBreeze$roads,
		cv: A2(
			elm$core$List$cons,
			author$project$Map$Track$SummerBreeze$startLine,
			A2(elm$core$List$cons, author$project$Map$Track$SummerBreeze$finishLine, author$project$Map$Track$SummerBreeze$checkBox))
	},
	bZ: {bm: 'Loud engines and sunny weather', b$: 'Summer Breeze'},
	b5: {
		bR: 4,
		cd: 5000,
		co: _List_fromArray(
			[
				{a2: 448, a3: 128}
			]),
		cp: 1
	}
};
var author$project$Map$Track$SummerBreeze$model = function () {
	var map = author$project$Map$Track$SummerBreeze$init;
	var gameObjects = author$project$Map$Track$SummerBreeze$init.Q;
	return _Utils_update(
		map,
		{
			Q: _Utils_update(
				gameObjects,
				{
					ba: A2(
						author$project$Map$Generator$fill,
						author$project$Map$Track$SummerBreeze$background,
						author$project$Map$Generator$possibleTileCoords(map))
				})
		});
}();
var author$project$Map$Track$Module$tracks = _List_fromArray(
	[author$project$Map$Track$DustRace$model, author$project$Map$Track$SummerBreeze$model]);
var author$project$Types$Car = 2;
var author$project$Objects$Vehicle$Ambulance$model = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 8,
				bE: elm$core$Maybe$Nothing,
				cc: {a2: 12, a3: 12},
				a$: elm$core$Maybe$Nothing,
				cD: 8
			})),
	au: 'Ambulance',
	bL: 2,
	aC: elm$core$Maybe$Just(
		{az: 20, aA: 90, aV: 0, cq: 4.6}),
	b8: elm$core$Maybe$Just(
		{bs: -1, bt: 2, t: _List_Nil}),
	cc: elm$core$Maybe$Just(
		{a2: 450, a3: 100}),
	ae: 90,
	cj: {bC: 32, cD: 32},
	ck: 'assets/cars/ambulance.png',
	cl: elm$core$Maybe$Just('assets/cars/ambulance.png')
};
var author$project$Objects$Vehicle$Module$defaultVehicle = author$project$Objects$Vehicle$Ambulance$model;
var author$project$Objects$Vehicle$Police$model = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 8,
				bE: elm$core$Maybe$Nothing,
				cc: {a2: 12, a3: 12},
				a$: elm$core$Maybe$Nothing,
				cD: 8
			})),
	au: 'Police',
	bL: 2,
	aC: elm$core$Maybe$Just(
		{az: 20, aA: 80, aV: 0, cq: 4.8}),
	b8: elm$core$Maybe$Just(
		{bs: -1, bt: 3, t: _List_Nil}),
	cc: elm$core$Maybe$Just(
		{a2: 450, a3: 100}),
	ae: 90,
	cj: {bC: 32, cD: 32},
	ck: 'assets/cars/police.png',
	cl: elm$core$Maybe$Just('assets/cars/police.png')
};
var author$project$Objects$Vehicle$Taxi$model = {
	bg: elm$core$Maybe$Just(
		author$project$Types$Rect(
			{
				bC: 8,
				bE: elm$core$Maybe$Nothing,
				cc: {a2: 12, a3: 12},
				a$: elm$core$Maybe$Nothing,
				cD: 8
			})),
	au: 'Taxi',
	bL: 2,
	aC: elm$core$Maybe$Just(
		{az: 20, aA: 75, aV: 0, cq: 5}),
	b8: elm$core$Maybe$Just(
		{bs: -1, bt: 2, t: _List_Nil}),
	cc: elm$core$Maybe$Just(
		{a2: 450, a3: 100}),
	ae: 90,
	cj: {bC: 32, cD: 32},
	ck: 'assets/cars/taxi.png',
	cl: elm$core$Maybe$Just('assets/cars/taxi.png')
};
var author$project$Objects$Vehicle$Module$vehicles = _List_fromArray(
	[author$project$Objects$Vehicle$Ambulance$model, author$project$Objects$Vehicle$Police$model, author$project$Objects$Vehicle$Taxi$model]);
var author$project$Types$A = 1;
var author$project$Types$D = 3;
var author$project$Types$Menu = 0;
var author$project$Types$Nothing = 4;
var author$project$Types$S = 2;
var author$project$Types$Space = 4;
var author$project$Types$W = 0;
var author$project$InitialModel$initialModel = {
	a8: author$project$Objects$Vehicle$Module$vehicles,
	a9: author$project$Map$Track$Module$tracks,
	bk: false,
	U: author$project$InitialModel$frequence,
	bM: 0,
	ay: author$project$Map$Track$Module$defaultTrack,
	k: {
		a7: {a5: 4, R: 2, T: 0, _: 1, ad: 3},
		bd: _List_Nil,
		S: author$project$Objects$Vehicle$Module$defaultVehicle,
		bj: 1,
		au: 'blue',
		bN: {bh: '#F3B1CF', cj: 40, ct: 'Unnamed Driver', cB: true},
		i: {R: 4, T: 4, _: 4, ad: 4},
		aZ: 0
	},
	b0: {bV: _List_Nil, b_: false, ci: '', cC: false},
	aF: _List_Nil,
	b7: {au: 'ownLobby', ay: 'Dust Race', bX: 2, aF: _List_Nil, ch: false, cw: (author$project$InitialModel$frequence * 50) + 1},
	aW: 0
};
var author$project$Types$Backward = 1;
var author$project$Types$Forward = 0;
var author$project$Types$Left = 2;
var author$project$Types$Right = 3;
var author$project$Control$Player$toKey = function (val) {
	switch (val) {
		case 'w':
			return 0;
		case 'a':
			return 2;
		case 's':
			return 1;
		case 'd':
			return 3;
		default:
			return 4;
	}
};
var elm$core$Array$branchFactor = 32;
var elm$core$Array$Array_elm_builtin = F4(
	function (a, b, c, d) {
		return {$: 0, a: a, b: b, c: c, d: d};
	});
var elm$core$Basics$ceiling = _Basics_ceiling;
var elm$core$Basics$logBase = F2(
	function (base, number) {
		return _Basics_log(number) / _Basics_log(base);
	});
var elm$core$Basics$toFloat = _Basics_toFloat;
var elm$core$Array$shiftStep = elm$core$Basics$ceiling(
	A2(elm$core$Basics$logBase, 2, elm$core$Array$branchFactor));
var elm$core$Elm$JsArray$empty = _JsArray_empty;
var elm$core$Array$empty = A4(elm$core$Array$Array_elm_builtin, 0, elm$core$Array$shiftStep, elm$core$Elm$JsArray$empty, elm$core$Elm$JsArray$empty);
var elm$core$Array$Leaf = function (a) {
	return {$: 1, a: a};
};
var elm$core$Array$SubTree = function (a) {
	return {$: 0, a: a};
};
var elm$core$Elm$JsArray$initializeFromList = _JsArray_initializeFromList;
var elm$core$Array$compressNodes = F2(
	function (nodes, acc) {
		compressNodes:
		while (true) {
			var _n0 = A2(elm$core$Elm$JsArray$initializeFromList, elm$core$Array$branchFactor, nodes);
			var node = _n0.a;
			var remainingNodes = _n0.b;
			var newAcc = A2(
				elm$core$List$cons,
				elm$core$Array$SubTree(node),
				acc);
			if (!remainingNodes.b) {
				return elm$core$List$reverse(newAcc);
			} else {
				var $temp$nodes = remainingNodes,
					$temp$acc = newAcc;
				nodes = $temp$nodes;
				acc = $temp$acc;
				continue compressNodes;
			}
		}
	});
var elm$core$Tuple$first = function (_n0) {
	var x = _n0.a;
	return x;
};
var elm$core$Array$treeFromBuilder = F2(
	function (nodeList, nodeListSize) {
		treeFromBuilder:
		while (true) {
			var newNodeSize = elm$core$Basics$ceiling(nodeListSize / elm$core$Array$branchFactor);
			if (newNodeSize === 1) {
				return A2(elm$core$Elm$JsArray$initializeFromList, elm$core$Array$branchFactor, nodeList).a;
			} else {
				var $temp$nodeList = A2(elm$core$Array$compressNodes, nodeList, _List_Nil),
					$temp$nodeListSize = newNodeSize;
				nodeList = $temp$nodeList;
				nodeListSize = $temp$nodeListSize;
				continue treeFromBuilder;
			}
		}
	});
var elm$core$Basics$floor = _Basics_floor;
var elm$core$Basics$max = F2(
	function (x, y) {
		return (_Utils_cmp(x, y) > 0) ? x : y;
	});
var elm$core$Elm$JsArray$length = _JsArray_length;
var elm$core$Array$builderToArray = F2(
	function (reverseNodeList, builder) {
		if (!builder.e) {
			return A4(
				elm$core$Array$Array_elm_builtin,
				elm$core$Elm$JsArray$length(builder.f),
				elm$core$Array$shiftStep,
				elm$core$Elm$JsArray$empty,
				builder.f);
		} else {
			var treeLen = builder.e * elm$core$Array$branchFactor;
			var depth = elm$core$Basics$floor(
				A2(elm$core$Basics$logBase, elm$core$Array$branchFactor, treeLen - 1));
			var correctNodeList = reverseNodeList ? elm$core$List$reverse(builder.g) : builder.g;
			var tree = A2(elm$core$Array$treeFromBuilder, correctNodeList, builder.e);
			return A4(
				elm$core$Array$Array_elm_builtin,
				elm$core$Elm$JsArray$length(builder.f) + treeLen,
				A2(elm$core$Basics$max, 5, depth * elm$core$Array$shiftStep),
				tree,
				builder.f);
		}
	});
var elm$core$Basics$idiv = _Basics_idiv;
var elm$core$Elm$JsArray$initialize = _JsArray_initialize;
var elm$core$Array$initializeHelp = F5(
	function (fn, fromIndex, len, nodeList, tail) {
		initializeHelp:
		while (true) {
			if (fromIndex < 0) {
				return A2(
					elm$core$Array$builderToArray,
					false,
					{g: nodeList, e: (len / elm$core$Array$branchFactor) | 0, f: tail});
			} else {
				var leaf = elm$core$Array$Leaf(
					A3(elm$core$Elm$JsArray$initialize, elm$core$Array$branchFactor, fromIndex, fn));
				var $temp$fn = fn,
					$temp$fromIndex = fromIndex - elm$core$Array$branchFactor,
					$temp$len = len,
					$temp$nodeList = A2(elm$core$List$cons, leaf, nodeList),
					$temp$tail = tail;
				fn = $temp$fn;
				fromIndex = $temp$fromIndex;
				len = $temp$len;
				nodeList = $temp$nodeList;
				tail = $temp$tail;
				continue initializeHelp;
			}
		}
	});
var elm$core$Array$initialize = F2(
	function (len, fn) {
		if (len <= 0) {
			return elm$core$Array$empty;
		} else {
			var tailLen = len % elm$core$Array$branchFactor;
			var tail = A3(elm$core$Elm$JsArray$initialize, tailLen, len - tailLen, fn);
			var initialFromIndex = (len - tailLen) - elm$core$Array$branchFactor;
			return A5(elm$core$Array$initializeHelp, fn, initialFromIndex, len, _List_Nil, tail);
		}
	});
var elm$core$Result$Err = function (a) {
	return {$: 1, a: a};
};
var elm$core$Result$Ok = function (a) {
	return {$: 0, a: a};
};
var elm$core$Result$isOk = function (result) {
	if (!result.$) {
		return true;
	} else {
		return false;
	}
};
var elm$json$Json$Decode$Failure = F2(
	function (a, b) {
		return {$: 3, a: a, b: b};
	});
var elm$json$Json$Decode$Field = F2(
	function (a, b) {
		return {$: 0, a: a, b: b};
	});
var elm$json$Json$Decode$Index = F2(
	function (a, b) {
		return {$: 1, a: a, b: b};
	});
var elm$json$Json$Decode$OneOf = function (a) {
	return {$: 2, a: a};
};
var elm$core$Char$toCode = _Char_toCode;
var elm$core$Char$isLower = function (_char) {
	var code = elm$core$Char$toCode(_char);
	return (97 <= code) && (code <= 122);
};
var elm$core$Char$isUpper = function (_char) {
	var code = elm$core$Char$toCode(_char);
	return (code <= 90) && (65 <= code);
};
var elm$core$Char$isAlpha = function (_char) {
	return elm$core$Char$isLower(_char) || elm$core$Char$isUpper(_char);
};
var elm$core$Char$isDigit = function (_char) {
	var code = elm$core$Char$toCode(_char);
	return (code <= 57) && (48 <= code);
};
var elm$core$Char$isAlphaNum = function (_char) {
	return elm$core$Char$isLower(_char) || (elm$core$Char$isUpper(_char) || elm$core$Char$isDigit(_char));
};
var elm$core$List$length = function (xs) {
	return A3(
		elm$core$List$foldl,
		F2(
			function (_n0, i) {
				return i + 1;
			}),
		0,
		xs);
};
var elm$core$List$map2 = _List_map2;
var elm$core$List$rangeHelp = F3(
	function (lo, hi, list) {
		rangeHelp:
		while (true) {
			if (_Utils_cmp(lo, hi) < 1) {
				var $temp$lo = lo,
					$temp$hi = hi - 1,
					$temp$list = A2(elm$core$List$cons, hi, list);
				lo = $temp$lo;
				hi = $temp$hi;
				list = $temp$list;
				continue rangeHelp;
			} else {
				return list;
			}
		}
	});
var elm$core$List$range = F2(
	function (lo, hi) {
		return A3(elm$core$List$rangeHelp, lo, hi, _List_Nil);
	});
var elm$core$List$indexedMap = F2(
	function (f, xs) {
		return A3(
			elm$core$List$map2,
			f,
			A2(
				elm$core$List$range,
				0,
				elm$core$List$length(xs) - 1),
			xs);
	});
var elm$core$String$all = _String_all;
var elm$core$String$fromInt = _String_fromNumber;
var elm$core$String$join = F2(
	function (sep, chunks) {
		return A2(
			_String_join,
			sep,
			_List_toArray(chunks));
	});
var elm$core$String$uncons = _String_uncons;
var elm$core$String$split = F2(
	function (sep, string) {
		return _List_fromArray(
			A2(_String_split, sep, string));
	});
var elm$json$Json$Decode$indent = function (str) {
	return A2(
		elm$core$String$join,
		'\n    ',
		A2(elm$core$String$split, '\n', str));
};
var elm$json$Json$Encode$encode = _Json_encode;
var elm$json$Json$Decode$errorOneOf = F2(
	function (i, error) {
		return '\n\n(' + (elm$core$String$fromInt(i + 1) + (') ' + elm$json$Json$Decode$indent(
			elm$json$Json$Decode$errorToString(error))));
	});
var elm$json$Json$Decode$errorToString = function (error) {
	return A2(elm$json$Json$Decode$errorToStringHelp, error, _List_Nil);
};
var elm$json$Json$Decode$errorToStringHelp = F2(
	function (error, context) {
		errorToStringHelp:
		while (true) {
			switch (error.$) {
				case 0:
					var f = error.a;
					var err = error.b;
					var isSimple = function () {
						var _n1 = elm$core$String$uncons(f);
						if (_n1.$ === 1) {
							return false;
						} else {
							var _n2 = _n1.a;
							var _char = _n2.a;
							var rest = _n2.b;
							return elm$core$Char$isAlpha(_char) && A2(elm$core$String$all, elm$core$Char$isAlphaNum, rest);
						}
					}();
					var fieldName = isSimple ? ('.' + f) : ('[\'' + (f + '\']'));
					var $temp$error = err,
						$temp$context = A2(elm$core$List$cons, fieldName, context);
					error = $temp$error;
					context = $temp$context;
					continue errorToStringHelp;
				case 1:
					var i = error.a;
					var err = error.b;
					var indexName = '[' + (elm$core$String$fromInt(i) + ']');
					var $temp$error = err,
						$temp$context = A2(elm$core$List$cons, indexName, context);
					error = $temp$error;
					context = $temp$context;
					continue errorToStringHelp;
				case 2:
					var errors = error.a;
					if (!errors.b) {
						return 'Ran into a Json.Decode.oneOf with no possibilities' + function () {
							if (!context.b) {
								return '!';
							} else {
								return ' at json' + A2(
									elm$core$String$join,
									'',
									elm$core$List$reverse(context));
							}
						}();
					} else {
						if (!errors.b.b) {
							var err = errors.a;
							var $temp$error = err,
								$temp$context = context;
							error = $temp$error;
							context = $temp$context;
							continue errorToStringHelp;
						} else {
							var starter = function () {
								if (!context.b) {
									return 'Json.Decode.oneOf';
								} else {
									return 'The Json.Decode.oneOf at json' + A2(
										elm$core$String$join,
										'',
										elm$core$List$reverse(context));
								}
							}();
							var introduction = starter + (' failed in the following ' + (elm$core$String$fromInt(
								elm$core$List$length(errors)) + ' ways:'));
							return A2(
								elm$core$String$join,
								'\n\n',
								A2(
									elm$core$List$cons,
									introduction,
									A2(elm$core$List$indexedMap, elm$json$Json$Decode$errorOneOf, errors)));
						}
					}
				default:
					var msg = error.a;
					var json = error.b;
					var introduction = function () {
						if (!context.b) {
							return 'Problem with the given value:\n\n';
						} else {
							return 'Problem with the value at json' + (A2(
								elm$core$String$join,
								'',
								elm$core$List$reverse(context)) + ':\n\n    ');
						}
					}();
					return introduction + (elm$json$Json$Decode$indent(
						A2(elm$json$Json$Encode$encode, 4, json)) + ('\n\n' + msg));
			}
		}
	});
var elm$json$Json$Decode$field = _Json_decodeField;
var elm$json$Json$Decode$map = _Json_map1;
var elm$json$Json$Decode$string = _Json_decodeString;
var author$project$Control$Player$keyDecoder = A2(
	elm$json$Json$Decode$map,
	author$project$Control$Player$toKey,
	A2(elm$json$Json$Decode$field, 'key', elm$json$Json$Decode$string));
var elm$json$Json$Decode$value = _Json_decodeValue;
var author$project$Network$Ports$parseReturn = _Platform_incomingPort('parseReturn', elm$json$Json$Decode$value);
var author$project$Network$Module$parseReturn = author$project$Network$Ports$parseReturn;
var author$project$Network$Ports$subPort = _Platform_incomingPort('subPort', elm$json$Json$Decode$value);
var author$project$Network$Module$subPort = author$project$Network$Ports$subPort;
var author$project$Types$Control = F3(
	function (a, b, c) {
		return {$: 5, a: a, b: b, c: c};
	});
var author$project$Types$Pressed = 0;
var author$project$Types$Process = function (a) {
	return {$: 1, a: a};
};
var author$project$Types$Receive = function (a) {
	return {$: 2, a: a};
};
var author$project$Types$Released = 1;
var author$project$Types$SyncLobbies = {$: 9};
var author$project$Types$SyncPlayer = {$: 10};
var author$project$Types$Tick = {$: 6};
var author$project$Types$Websocket = function (a) {
	return {$: 7, a: a};
};
var elm$browser$Browser$Events$Document = 0;
var elm$browser$Browser$Events$MySub = F3(
	function (a, b, c) {
		return {$: 0, a: a, b: b, c: c};
	});
var elm$browser$Browser$Events$State = F2(
	function (subs, pids) {
		return {aH: pids, aX: subs};
	});
var elm$core$Dict$RBEmpty_elm_builtin = {$: -2};
var elm$core$Dict$empty = elm$core$Dict$RBEmpty_elm_builtin;
var elm$core$Task$succeed = _Scheduler_succeed;
var elm$browser$Browser$Events$init = elm$core$Task$succeed(
	A2(elm$browser$Browser$Events$State, _List_Nil, elm$core$Dict$empty));
var elm$browser$Browser$Events$nodeToKey = function (node) {
	if (!node) {
		return 'd_';
	} else {
		return 'w_';
	}
};
var elm$browser$Browser$Events$addKey = function (sub) {
	var node = sub.a;
	var name = sub.b;
	return _Utils_Tuple2(
		_Utils_ap(
			elm$browser$Browser$Events$nodeToKey(node),
			name),
		sub);
};
var elm$browser$Browser$Events$Event = F2(
	function (key, event) {
		return {an: event, bK: key};
	});
var elm$core$Platform$sendToSelf = _Platform_sendToSelf;
var elm$core$Task$andThen = _Scheduler_andThen;
var elm$core$Task$map = F2(
	function (func, taskA) {
		return A2(
			elm$core$Task$andThen,
			function (a) {
				return elm$core$Task$succeed(
					func(a));
			},
			taskA);
	});
var elm$browser$Browser$External = function (a) {
	return {$: 1, a: a};
};
var elm$browser$Browser$Internal = function (a) {
	return {$: 0, a: a};
};
var elm$browser$Browser$Dom$NotFound = elm$core$Basics$identity;
var elm$core$Basics$never = function (_n0) {
	never:
	while (true) {
		var nvr = _n0;
		var $temp$_n0 = nvr;
		_n0 = $temp$_n0;
		continue never;
	}
};
var elm$core$Task$Perform = elm$core$Basics$identity;
var elm$core$Task$init = elm$core$Task$succeed(0);
var elm$core$List$foldrHelper = F4(
	function (fn, acc, ctr, ls) {
		if (!ls.b) {
			return acc;
		} else {
			var a = ls.a;
			var r1 = ls.b;
			if (!r1.b) {
				return A2(fn, a, acc);
			} else {
				var b = r1.a;
				var r2 = r1.b;
				if (!r2.b) {
					return A2(
						fn,
						a,
						A2(fn, b, acc));
				} else {
					var c = r2.a;
					var r3 = r2.b;
					if (!r3.b) {
						return A2(
							fn,
							a,
							A2(
								fn,
								b,
								A2(fn, c, acc)));
					} else {
						var d = r3.a;
						var r4 = r3.b;
						var res = (ctr > 500) ? A3(
							elm$core$List$foldl,
							fn,
							acc,
							elm$core$List$reverse(r4)) : A4(elm$core$List$foldrHelper, fn, acc, ctr + 1, r4);
						return A2(
							fn,
							a,
							A2(
								fn,
								b,
								A2(
									fn,
									c,
									A2(fn, d, res))));
					}
				}
			}
		}
	});
var elm$core$List$foldr = F3(
	function (fn, acc, ls) {
		return A4(elm$core$List$foldrHelper, fn, acc, 0, ls);
	});
var elm$core$List$map = F2(
	function (f, xs) {
		return A3(
			elm$core$List$foldr,
			F2(
				function (x, acc) {
					return A2(
						elm$core$List$cons,
						f(x),
						acc);
				}),
			_List_Nil,
			xs);
	});
var elm$core$Task$map2 = F3(
	function (func, taskA, taskB) {
		return A2(
			elm$core$Task$andThen,
			function (a) {
				return A2(
					elm$core$Task$andThen,
					function (b) {
						return elm$core$Task$succeed(
							A2(func, a, b));
					},
					taskB);
			},
			taskA);
	});
var elm$core$Task$sequence = function (tasks) {
	return A3(
		elm$core$List$foldr,
		elm$core$Task$map2(elm$core$List$cons),
		elm$core$Task$succeed(_List_Nil),
		tasks);
};
var elm$core$Platform$sendToApp = _Platform_sendToApp;
var elm$core$Task$spawnCmd = F2(
	function (router, _n0) {
		var task = _n0;
		return _Scheduler_spawn(
			A2(
				elm$core$Task$andThen,
				elm$core$Platform$sendToApp(router),
				task));
	});
var elm$core$Task$onEffects = F3(
	function (router, commands, state) {
		return A2(
			elm$core$Task$map,
			function (_n0) {
				return 0;
			},
			elm$core$Task$sequence(
				A2(
					elm$core$List$map,
					elm$core$Task$spawnCmd(router),
					commands)));
	});
var elm$core$Task$onSelfMsg = F3(
	function (_n0, _n1, _n2) {
		return elm$core$Task$succeed(0);
	});
var elm$core$Task$cmdMap = F2(
	function (tagger, _n0) {
		var task = _n0;
		return A2(elm$core$Task$map, tagger, task);
	});
_Platform_effectManagers['Task'] = _Platform_createManager(elm$core$Task$init, elm$core$Task$onEffects, elm$core$Task$onSelfMsg, elm$core$Task$cmdMap);
var elm$core$Task$command = _Platform_leaf('Task');
var elm$core$Task$perform = F2(
	function (toMessage, task) {
		return elm$core$Task$command(
			A2(elm$core$Task$map, toMessage, task));
	});
var elm$json$Json$Decode$map2 = _Json_map2;
var elm$json$Json$Decode$succeed = _Json_succeed;
var elm$virtual_dom$VirtualDom$toHandlerInt = function (handler) {
	switch (handler.$) {
		case 0:
			return 0;
		case 1:
			return 1;
		case 2:
			return 2;
		default:
			return 3;
	}
};
var elm$core$String$length = _String_length;
var elm$core$String$slice = _String_slice;
var elm$core$String$dropLeft = F2(
	function (n, string) {
		return (n < 1) ? string : A3(
			elm$core$String$slice,
			n,
			elm$core$String$length(string),
			string);
	});
var elm$core$String$startsWith = _String_startsWith;
var elm$url$Url$Http = 0;
var elm$url$Url$Https = 1;
var elm$core$String$indexes = _String_indexes;
var elm$core$String$isEmpty = function (string) {
	return string === '';
};
var elm$core$String$left = F2(
	function (n, string) {
		return (n < 1) ? '' : A3(elm$core$String$slice, 0, n, string);
	});
var elm$core$String$contains = _String_contains;
var elm$core$String$toInt = _String_toInt;
var elm$url$Url$Url = F6(
	function (protocol, host, port_, path, query, fragment) {
		return {aq: fragment, at: host, aG: path, aI: port_, aM: protocol, aN: query};
	});
var elm$url$Url$chompBeforePath = F5(
	function (protocol, path, params, frag, str) {
		if (elm$core$String$isEmpty(str) || A2(elm$core$String$contains, '@', str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, ':', str);
			if (!_n0.b) {
				return elm$core$Maybe$Just(
					A6(elm$url$Url$Url, protocol, str, elm$core$Maybe$Nothing, path, params, frag));
			} else {
				if (!_n0.b.b) {
					var i = _n0.a;
					var _n1 = elm$core$String$toInt(
						A2(elm$core$String$dropLeft, i + 1, str));
					if (_n1.$ === 1) {
						return elm$core$Maybe$Nothing;
					} else {
						var port_ = _n1;
						return elm$core$Maybe$Just(
							A6(
								elm$url$Url$Url,
								protocol,
								A2(elm$core$String$left, i, str),
								port_,
								path,
								params,
								frag));
					}
				} else {
					return elm$core$Maybe$Nothing;
				}
			}
		}
	});
var elm$url$Url$chompBeforeQuery = F4(
	function (protocol, params, frag, str) {
		if (elm$core$String$isEmpty(str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, '/', str);
			if (!_n0.b) {
				return A5(elm$url$Url$chompBeforePath, protocol, '/', params, frag, str);
			} else {
				var i = _n0.a;
				return A5(
					elm$url$Url$chompBeforePath,
					protocol,
					A2(elm$core$String$dropLeft, i, str),
					params,
					frag,
					A2(elm$core$String$left, i, str));
			}
		}
	});
var elm$url$Url$chompBeforeFragment = F3(
	function (protocol, frag, str) {
		if (elm$core$String$isEmpty(str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, '?', str);
			if (!_n0.b) {
				return A4(elm$url$Url$chompBeforeQuery, protocol, elm$core$Maybe$Nothing, frag, str);
			} else {
				var i = _n0.a;
				return A4(
					elm$url$Url$chompBeforeQuery,
					protocol,
					elm$core$Maybe$Just(
						A2(elm$core$String$dropLeft, i + 1, str)),
					frag,
					A2(elm$core$String$left, i, str));
			}
		}
	});
var elm$url$Url$chompAfterProtocol = F2(
	function (protocol, str) {
		if (elm$core$String$isEmpty(str)) {
			return elm$core$Maybe$Nothing;
		} else {
			var _n0 = A2(elm$core$String$indexes, '#', str);
			if (!_n0.b) {
				return A3(elm$url$Url$chompBeforeFragment, protocol, elm$core$Maybe$Nothing, str);
			} else {
				var i = _n0.a;
				return A3(
					elm$url$Url$chompBeforeFragment,
					protocol,
					elm$core$Maybe$Just(
						A2(elm$core$String$dropLeft, i + 1, str)),
					A2(elm$core$String$left, i, str));
			}
		}
	});
var elm$url$Url$fromString = function (str) {
	return A2(elm$core$String$startsWith, 'http://', str) ? A2(
		elm$url$Url$chompAfterProtocol,
		0,
		A2(elm$core$String$dropLeft, 7, str)) : (A2(elm$core$String$startsWith, 'https://', str) ? A2(
		elm$url$Url$chompAfterProtocol,
		1,
		A2(elm$core$String$dropLeft, 8, str)) : elm$core$Maybe$Nothing);
};
var elm$browser$Browser$Events$spawn = F3(
	function (router, key, _n0) {
		var node = _n0.a;
		var name = _n0.b;
		var actualNode = function () {
			if (!node) {
				return _Browser_doc;
			} else {
				return _Browser_window;
			}
		}();
		return A2(
			elm$core$Task$map,
			function (value) {
				return _Utils_Tuple2(key, value);
			},
			A3(
				_Browser_on,
				actualNode,
				name,
				function (event) {
					return A2(
						elm$core$Platform$sendToSelf,
						router,
						A2(elm$browser$Browser$Events$Event, key, event));
				}));
	});
var elm$core$Dict$Black = 1;
var elm$core$Dict$RBNode_elm_builtin = F5(
	function (a, b, c, d, e) {
		return {$: -1, a: a, b: b, c: c, d: d, e: e};
	});
var elm$core$Basics$compare = _Utils_compare;
var elm$core$Dict$Red = 0;
var elm$core$Dict$balance = F5(
	function (color, key, value, left, right) {
		if ((right.$ === -1) && (!right.a)) {
			var _n1 = right.a;
			var rK = right.b;
			var rV = right.c;
			var rLeft = right.d;
			var rRight = right.e;
			if ((left.$ === -1) && (!left.a)) {
				var _n3 = left.a;
				var lK = left.b;
				var lV = left.c;
				var lLeft = left.d;
				var lRight = left.e;
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					0,
					key,
					value,
					A5(elm$core$Dict$RBNode_elm_builtin, 1, lK, lV, lLeft, lRight),
					A5(elm$core$Dict$RBNode_elm_builtin, 1, rK, rV, rLeft, rRight));
			} else {
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					color,
					rK,
					rV,
					A5(elm$core$Dict$RBNode_elm_builtin, 0, key, value, left, rLeft),
					rRight);
			}
		} else {
			if ((((left.$ === -1) && (!left.a)) && (left.d.$ === -1)) && (!left.d.a)) {
				var _n5 = left.a;
				var lK = left.b;
				var lV = left.c;
				var _n6 = left.d;
				var _n7 = _n6.a;
				var llK = _n6.b;
				var llV = _n6.c;
				var llLeft = _n6.d;
				var llRight = _n6.e;
				var lRight = left.e;
				return A5(
					elm$core$Dict$RBNode_elm_builtin,
					0,
					lK,
					lV,
					A5(elm$core$Dict$RBNode_elm_builtin, 1, llK, llV, llLeft, llRight),
					A5(elm$core$Dict$RBNode_elm_builtin, 1, key, value, lRight, right));
			} else {
				return A5(elm$core$Dict$RBNode_elm_builtin, color, key, value, left, right);
			}
		}
	});
var elm$core$Dict$insertHelp = F3(
	function (key, value, dict) {
		if (dict.$ === -2) {
			return A5(elm$core$Dict$RBNode_elm_builtin, 0, key, value, elm$core$Dict$RBEmpty_elm_builtin, elm$core$Dict$RBEmpty_elm_builtin);
		} else {
			var nColor = dict.a;
			var nKey = dict.b;
			var nValue = dict.c;
			var nLeft = dict.d;
			var nRight = dict.e;
			var _n1 = A2(elm$core$Basics$compare, key, nKey);
			switch (_n1) {
				case 0:
					return A5(
						elm$core$Dict$balance,
						nColor,
						nKey,
						nValue,
						A3(elm$core$Dict$insertHelp, key, value, nLeft),
						nRight);
				case 1:
					return A5(elm$core$Dict$RBNode_elm_builtin, nColor, nKey, value, nLeft, nRight);
				default:
					return A5(
						elm$core$Dict$balance,
						nColor,
						nKey,
						nValue,
						nLeft,
						A3(elm$core$Dict$insertHelp, key, value, nRight));
			}
		}
	});
var elm$core$Dict$insert = F3(
	function (key, value, dict) {
		var _n0 = A3(elm$core$Dict$insertHelp, key, value, dict);
		if ((_n0.$ === -1) && (!_n0.a)) {
			var _n1 = _n0.a;
			var k = _n0.b;
			var v = _n0.c;
			var l = _n0.d;
			var r = _n0.e;
			return A5(elm$core$Dict$RBNode_elm_builtin, 1, k, v, l, r);
		} else {
			var x = _n0;
			return x;
		}
	});
var elm$core$Dict$fromList = function (assocs) {
	return A3(
		elm$core$List$foldl,
		F2(
			function (_n0, dict) {
				var key = _n0.a;
				var value = _n0.b;
				return A3(elm$core$Dict$insert, key, value, dict);
			}),
		elm$core$Dict$empty,
		assocs);
};
var elm$core$Dict$foldl = F3(
	function (func, acc, dict) {
		foldl:
		while (true) {
			if (dict.$ === -2) {
				return acc;
			} else {
				var key = dict.b;
				var value = dict.c;
				var left = dict.d;
				var right = dict.e;
				var $temp$func = func,
					$temp$acc = A3(
					func,
					key,
					value,
					A3(elm$core$Dict$foldl, func, acc, left)),
					$temp$dict = right;
				func = $temp$func;
				acc = $temp$acc;
				dict = $temp$dict;
				continue foldl;
			}
		}
	});
var elm$core$Dict$merge = F6(
	function (leftStep, bothStep, rightStep, leftDict, rightDict, initialResult) {
		var stepState = F3(
			function (rKey, rValue, _n0) {
				stepState:
				while (true) {
					var list = _n0.a;
					var result = _n0.b;
					if (!list.b) {
						return _Utils_Tuple2(
							list,
							A3(rightStep, rKey, rValue, result));
					} else {
						var _n2 = list.a;
						var lKey = _n2.a;
						var lValue = _n2.b;
						var rest = list.b;
						if (_Utils_cmp(lKey, rKey) < 0) {
							var $temp$rKey = rKey,
								$temp$rValue = rValue,
								$temp$_n0 = _Utils_Tuple2(
								rest,
								A3(leftStep, lKey, lValue, result));
							rKey = $temp$rKey;
							rValue = $temp$rValue;
							_n0 = $temp$_n0;
							continue stepState;
						} else {
							if (_Utils_cmp(lKey, rKey) > 0) {
								return _Utils_Tuple2(
									list,
									A3(rightStep, rKey, rValue, result));
							} else {
								return _Utils_Tuple2(
									rest,
									A4(bothStep, lKey, lValue, rValue, result));
							}
						}
					}
				}
			});
		var _n3 = A3(
			elm$core$Dict$foldl,
			stepState,
			_Utils_Tuple2(
				elm$core$Dict$toList(leftDict),
				initialResult),
			rightDict);
		var leftovers = _n3.a;
		var intermediateResult = _n3.b;
		return A3(
			elm$core$List$foldl,
			F2(
				function (_n4, result) {
					var k = _n4.a;
					var v = _n4.b;
					return A3(leftStep, k, v, result);
				}),
			intermediateResult,
			leftovers);
	});
var elm$core$Dict$union = F2(
	function (t1, t2) {
		return A3(elm$core$Dict$foldl, elm$core$Dict$insert, t2, t1);
	});
var elm$core$Process$kill = _Scheduler_kill;
var elm$browser$Browser$Events$onEffects = F3(
	function (router, subs, state) {
		var stepRight = F3(
			function (key, sub, _n6) {
				var deads = _n6.a;
				var lives = _n6.b;
				var news = _n6.c;
				return _Utils_Tuple3(
					deads,
					lives,
					A2(
						elm$core$List$cons,
						A3(elm$browser$Browser$Events$spawn, router, key, sub),
						news));
			});
		var stepLeft = F3(
			function (_n4, pid, _n5) {
				var deads = _n5.a;
				var lives = _n5.b;
				var news = _n5.c;
				return _Utils_Tuple3(
					A2(elm$core$List$cons, pid, deads),
					lives,
					news);
			});
		var stepBoth = F4(
			function (key, pid, _n2, _n3) {
				var deads = _n3.a;
				var lives = _n3.b;
				var news = _n3.c;
				return _Utils_Tuple3(
					deads,
					A3(elm$core$Dict$insert, key, pid, lives),
					news);
			});
		var newSubs = A2(elm$core$List$map, elm$browser$Browser$Events$addKey, subs);
		var _n0 = A6(
			elm$core$Dict$merge,
			stepLeft,
			stepBoth,
			stepRight,
			state.aH,
			elm$core$Dict$fromList(newSubs),
			_Utils_Tuple3(_List_Nil, elm$core$Dict$empty, _List_Nil));
		var deadPids = _n0.a;
		var livePids = _n0.b;
		var makeNewPids = _n0.c;
		return A2(
			elm$core$Task$andThen,
			function (pids) {
				return elm$core$Task$succeed(
					A2(
						elm$browser$Browser$Events$State,
						newSubs,
						A2(
							elm$core$Dict$union,
							livePids,
							elm$core$Dict$fromList(pids))));
			},
			A2(
				elm$core$Task$andThen,
				function (_n1) {
					return elm$core$Task$sequence(makeNewPids);
				},
				elm$core$Task$sequence(
					A2(elm$core$List$map, elm$core$Process$kill, deadPids))));
	});
var elm$core$List$maybeCons = F3(
	function (f, mx, xs) {
		var _n0 = f(mx);
		if (!_n0.$) {
			var x = _n0.a;
			return A2(elm$core$List$cons, x, xs);
		} else {
			return xs;
		}
	});
var elm$core$List$filterMap = F2(
	function (f, xs) {
		return A3(
			elm$core$List$foldr,
			elm$core$List$maybeCons(f),
			_List_Nil,
			xs);
	});
var elm$browser$Browser$Events$onSelfMsg = F3(
	function (router, _n0, state) {
		var key = _n0.bK;
		var event = _n0.an;
		var toMessage = function (_n2) {
			var subKey = _n2.a;
			var _n3 = _n2.b;
			var node = _n3.a;
			var name = _n3.b;
			var decoder = _n3.c;
			return _Utils_eq(subKey, key) ? A2(_Browser_decodeEvent, decoder, event) : elm$core$Maybe$Nothing;
		};
		var messages = A2(elm$core$List$filterMap, toMessage, state.aX);
		return A2(
			elm$core$Task$andThen,
			function (_n1) {
				return elm$core$Task$succeed(state);
			},
			elm$core$Task$sequence(
				A2(
					elm$core$List$map,
					elm$core$Platform$sendToApp(router),
					messages)));
	});
var elm$browser$Browser$Events$subMap = F2(
	function (func, _n0) {
		var node = _n0.a;
		var name = _n0.b;
		var decoder = _n0.c;
		return A3(
			elm$browser$Browser$Events$MySub,
			node,
			name,
			A2(elm$json$Json$Decode$map, func, decoder));
	});
_Platform_effectManagers['Browser.Events'] = _Platform_createManager(elm$browser$Browser$Events$init, elm$browser$Browser$Events$onEffects, elm$browser$Browser$Events$onSelfMsg, 0, elm$browser$Browser$Events$subMap);
var elm$browser$Browser$Events$subscription = _Platform_leaf('Browser.Events');
var elm$browser$Browser$Events$on = F3(
	function (node, name, decoder) {
		return elm$browser$Browser$Events$subscription(
			A3(elm$browser$Browser$Events$MySub, node, name, decoder));
	});
var elm$browser$Browser$Events$onKeyDown = A2(elm$browser$Browser$Events$on, 0, 'keydown');
var elm$browser$Browser$Events$onKeyUp = A2(elm$browser$Browser$Events$on, 0, 'keyup');
var elm$core$Platform$Sub$batch = _Platform_batch;
var elm$time$Time$Every = F2(
	function (a, b) {
		return {$: 0, a: a, b: b};
	});
var elm$time$Time$State = F2(
	function (taggers, processes) {
		return {aL: processes, aY: taggers};
	});
var elm$time$Time$init = elm$core$Task$succeed(
	A2(elm$time$Time$State, elm$core$Dict$empty, elm$core$Dict$empty));
var elm$core$Dict$get = F2(
	function (targetKey, dict) {
		get:
		while (true) {
			if (dict.$ === -2) {
				return elm$core$Maybe$Nothing;
			} else {
				var key = dict.b;
				var value = dict.c;
				var left = dict.d;
				var right = dict.e;
				var _n1 = A2(elm$core$Basics$compare, targetKey, key);
				switch (_n1) {
					case 0:
						var $temp$targetKey = targetKey,
							$temp$dict = left;
						targetKey = $temp$targetKey;
						dict = $temp$dict;
						continue get;
					case 1:
						return elm$core$Maybe$Just(value);
					default:
						var $temp$targetKey = targetKey,
							$temp$dict = right;
						targetKey = $temp$targetKey;
						dict = $temp$dict;
						continue get;
				}
			}
		}
	});
var elm$time$Time$addMySub = F2(
	function (_n0, state) {
		var interval = _n0.a;
		var tagger = _n0.b;
		var _n1 = A2(elm$core$Dict$get, interval, state);
		if (_n1.$ === 1) {
			return A3(
				elm$core$Dict$insert,
				interval,
				_List_fromArray(
					[tagger]),
				state);
		} else {
			var taggers = _n1.a;
			return A3(
				elm$core$Dict$insert,
				interval,
				A2(elm$core$List$cons, tagger, taggers),
				state);
		}
	});
var elm$core$Process$spawn = _Scheduler_spawn;
var elm$time$Time$Name = function (a) {
	return {$: 0, a: a};
};
var elm$time$Time$Offset = function (a) {
	return {$: 1, a: a};
};
var elm$time$Time$Zone = F2(
	function (a, b) {
		return {$: 0, a: a, b: b};
	});
var elm$time$Time$customZone = elm$time$Time$Zone;
var elm$time$Time$setInterval = _Time_setInterval;
var elm$time$Time$spawnHelp = F3(
	function (router, intervals, processes) {
		if (!intervals.b) {
			return elm$core$Task$succeed(processes);
		} else {
			var interval = intervals.a;
			var rest = intervals.b;
			var spawnTimer = elm$core$Process$spawn(
				A2(
					elm$time$Time$setInterval,
					interval,
					A2(elm$core$Platform$sendToSelf, router, interval)));
			var spawnRest = function (id) {
				return A3(
					elm$time$Time$spawnHelp,
					router,
					rest,
					A3(elm$core$Dict$insert, interval, id, processes));
			};
			return A2(elm$core$Task$andThen, spawnRest, spawnTimer);
		}
	});
var elm$time$Time$onEffects = F3(
	function (router, subs, _n0) {
		var processes = _n0.aL;
		var rightStep = F3(
			function (_n6, id, _n7) {
				var spawns = _n7.a;
				var existing = _n7.b;
				var kills = _n7.c;
				return _Utils_Tuple3(
					spawns,
					existing,
					A2(
						elm$core$Task$andThen,
						function (_n5) {
							return kills;
						},
						elm$core$Process$kill(id)));
			});
		var newTaggers = A3(elm$core$List$foldl, elm$time$Time$addMySub, elm$core$Dict$empty, subs);
		var leftStep = F3(
			function (interval, taggers, _n4) {
				var spawns = _n4.a;
				var existing = _n4.b;
				var kills = _n4.c;
				return _Utils_Tuple3(
					A2(elm$core$List$cons, interval, spawns),
					existing,
					kills);
			});
		var bothStep = F4(
			function (interval, taggers, id, _n3) {
				var spawns = _n3.a;
				var existing = _n3.b;
				var kills = _n3.c;
				return _Utils_Tuple3(
					spawns,
					A3(elm$core$Dict$insert, interval, id, existing),
					kills);
			});
		var _n1 = A6(
			elm$core$Dict$merge,
			leftStep,
			bothStep,
			rightStep,
			newTaggers,
			processes,
			_Utils_Tuple3(
				_List_Nil,
				elm$core$Dict$empty,
				elm$core$Task$succeed(0)));
		var spawnList = _n1.a;
		var existingDict = _n1.b;
		var killTask = _n1.c;
		return A2(
			elm$core$Task$andThen,
			function (newProcesses) {
				return elm$core$Task$succeed(
					A2(elm$time$Time$State, newTaggers, newProcesses));
			},
			A2(
				elm$core$Task$andThen,
				function (_n2) {
					return A3(elm$time$Time$spawnHelp, router, spawnList, existingDict);
				},
				killTask));
	});
var elm$time$Time$Posix = elm$core$Basics$identity;
var elm$time$Time$millisToPosix = elm$core$Basics$identity;
var elm$time$Time$now = _Time_now(elm$time$Time$millisToPosix);
var elm$time$Time$onSelfMsg = F3(
	function (router, interval, state) {
		var _n0 = A2(elm$core$Dict$get, interval, state.aY);
		if (_n0.$ === 1) {
			return elm$core$Task$succeed(state);
		} else {
			var taggers = _n0.a;
			var tellTaggers = function (time) {
				return elm$core$Task$sequence(
					A2(
						elm$core$List$map,
						function (tagger) {
							return A2(
								elm$core$Platform$sendToApp,
								router,
								tagger(time));
						},
						taggers));
			};
			return A2(
				elm$core$Task$andThen,
				function (_n1) {
					return elm$core$Task$succeed(state);
				},
				A2(elm$core$Task$andThen, tellTaggers, elm$time$Time$now));
		}
	});
var elm$core$Basics$composeL = F3(
	function (g, f, x) {
		return g(
			f(x));
	});
var elm$time$Time$subMap = F2(
	function (f, _n0) {
		var interval = _n0.a;
		var tagger = _n0.b;
		return A2(
			elm$time$Time$Every,
			interval,
			A2(elm$core$Basics$composeL, f, tagger));
	});
_Platform_effectManagers['Time'] = _Platform_createManager(elm$time$Time$init, elm$time$Time$onEffects, elm$time$Time$onSelfMsg, 0, elm$time$Time$subMap);
var elm$time$Time$subscription = _Platform_leaf('Time');
var elm$time$Time$every = F2(
	function (interval, tagger) {
		return elm$time$Time$subscription(
			A2(elm$time$Time$Every, interval, tagger));
	});
var author$project$Main$subscriptions = function (model) {
	return elm$core$Platform$Sub$batch(
		_List_fromArray(
			[
				elm$browser$Browser$Events$onKeyDown(
				A2(
					elm$json$Json$Decode$map,
					A2(author$project$Types$Control, model, 0),
					author$project$Control$Player$keyDecoder)),
				elm$browser$Browser$Events$onKeyUp(
				A2(
					elm$json$Json$Decode$map,
					A2(author$project$Types$Control, model, 1),
					author$project$Control$Player$keyDecoder)),
				A2(
				elm$time$Time$every,
				model.U,
				function (_n0) {
					return author$project$Types$Tick;
				}),
				A2(
				elm$time$Time$every,
				1000,
				function (_n1) {
					return author$project$Types$SyncLobbies;
				}),
				A2(
				elm$time$Time$every,
				70,
				function (_n2) {
					return author$project$Types$SyncPlayer;
				}),
				author$project$Network$Module$subPort(
				function (v) {
					return author$project$Types$Websocket(
						author$project$Types$Receive(v));
				}),
				author$project$Network$Module$parseReturn(
				function (v) {
					return author$project$Types$Websocket(
						author$project$Types$Process(v));
				})
			]));
};
var Janiczek$cmd_extra$Cmd$Extra$withCmd = F2(
	function (cmd, model) {
		return _Utils_Tuple2(model, cmd);
	});
var elm$core$Platform$Cmd$batch = _Platform_batch;
var elm$core$Platform$Cmd$none = elm$core$Platform$Cmd$batch(_List_Nil);
var Janiczek$cmd_extra$Cmd$Extra$withNoCmd = function (model) {
	return _Utils_Tuple2(model, elm$core$Platform$Cmd$none);
};
var elm$core$String$concat = function (strings) {
	return A2(elm$core$String$join, '', strings);
};
var elm$core$String$cons = _String_cons;
var elm$core$String$fromChar = function (_char) {
	return A2(elm$core$String$cons, _char, '');
};
var elm$core$Bitwise$shiftRightBy = _Bitwise_shiftRightBy;
var elm$core$String$repeatHelp = F3(
	function (n, chunk, result) {
		return (n <= 0) ? result : A3(
			elm$core$String$repeatHelp,
			n >> 1,
			_Utils_ap(chunk, chunk),
			(!(n & 1)) ? result : _Utils_ap(result, chunk));
	});
var elm$core$String$repeat = F2(
	function (n, chunk) {
		return A3(elm$core$String$repeatHelp, n, chunk, '');
	});
var elm$core$String$padLeft = F3(
	function (n, _char, string) {
		return _Utils_ap(
			A2(
				elm$core$String$repeat,
				n - elm$core$String$length(string),
				elm$core$String$fromChar(_char)),
			string);
	});
var elm_community$string_extra$String$Extra$breaker = F3(
	function (width, string, acc) {
		breaker:
		while (true) {
			if (string === '') {
				return elm$core$List$reverse(acc);
			} else {
				var $temp$width = width,
					$temp$string = A2(elm$core$String$dropLeft, width, string),
					$temp$acc = A2(
					elm$core$List$cons,
					A3(elm$core$String$slice, 0, width, string),
					acc);
				width = $temp$width;
				string = $temp$string;
				acc = $temp$acc;
				continue breaker;
			}
		}
	});
var elm_community$string_extra$String$Extra$break = F2(
	function (width, string) {
		return ((!width) || (string === '')) ? _List_fromArray(
			[string]) : A3(elm_community$string_extra$String$Extra$breaker, width, string, _List_Nil);
	});
var elm$core$String$fromList = _String_fromList;
var elm$core$Basics$modBy = _Basics_modBy;
var rtfeldman$elm_hex$Hex$unsafeToDigit = function (num) {
	unsafeToDigit:
	while (true) {
		switch (num) {
			case 0:
				return '0';
			case 1:
				return '1';
			case 2:
				return '2';
			case 3:
				return '3';
			case 4:
				return '4';
			case 5:
				return '5';
			case 6:
				return '6';
			case 7:
				return '7';
			case 8:
				return '8';
			case 9:
				return '9';
			case 10:
				return 'a';
			case 11:
				return 'b';
			case 12:
				return 'c';
			case 13:
				return 'd';
			case 14:
				return 'e';
			case 15:
				return 'f';
			default:
				var $temp$num = num;
				num = $temp$num;
				continue unsafeToDigit;
		}
	}
};
var rtfeldman$elm_hex$Hex$unsafePositiveToDigits = F2(
	function (digits, num) {
		unsafePositiveToDigits:
		while (true) {
			if (num < 16) {
				return A2(
					elm$core$List$cons,
					rtfeldman$elm_hex$Hex$unsafeToDigit(num),
					digits);
			} else {
				var $temp$digits = A2(
					elm$core$List$cons,
					rtfeldman$elm_hex$Hex$unsafeToDigit(
						A2(elm$core$Basics$modBy, 16, num)),
					digits),
					$temp$num = (num / 16) | 0;
				digits = $temp$digits;
				num = $temp$num;
				continue unsafePositiveToDigits;
			}
		}
	});
var rtfeldman$elm_hex$Hex$toString = function (num) {
	return elm$core$String$fromList(
		(num < 0) ? A2(
			elm$core$List$cons,
			'-',
			A2(rtfeldman$elm_hex$Hex$unsafePositiveToDigits, _List_Nil, -num)) : A2(rtfeldman$elm_hex$Hex$unsafePositiveToDigits, _List_Nil, num));
};
var TSFoster$elm_uuid$UUID$canonical = function (_n0) {
	var bytes = _n0;
	var strings = A2(
		elm_community$string_extra$String$Extra$break,
		4,
		elm$core$String$concat(
			A2(
				elm$core$List$map,
				A2(elm$core$String$padLeft, 2, '0'),
				A2(elm$core$List$map, rtfeldman$elm_hex$Hex$toString, bytes))));
	if ((((((((strings.b && strings.b.b) && strings.b.b.b) && strings.b.b.b.b) && strings.b.b.b.b.b) && strings.b.b.b.b.b.b) && strings.b.b.b.b.b.b.b) && strings.b.b.b.b.b.b.b.b) && (!strings.b.b.b.b.b.b.b.b.b)) {
		var a = strings.a;
		var _n2 = strings.b;
		var b = _n2.a;
		var _n3 = _n2.b;
		var c = _n3.a;
		var _n4 = _n3.b;
		var d = _n4.a;
		var _n5 = _n4.b;
		var e = _n5.a;
		var _n6 = _n5.b;
		var f = _n6.a;
		var _n7 = _n6.b;
		var g = _n7.a;
		var _n8 = _n7.b;
		var h = _n8.a;
		return a + (b + ('-' + (c + ('-' + (d + ('-' + (e + ('-' + (f + (g + h))))))))));
	} else {
		return 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx';
	}
};
var TSFoster$elm_uuid$UUID$toString = TSFoster$elm_uuid$UUID$canonical;
var author$project$Control$Player$applyInput = F3(
	function (model, event, action) {
		var myPlayer = model.k;
		var storedKeys = myPlayer.i;
		var _n0 = model.aW;
		if (_n0 === 2) {
			if (!event) {
				switch (action) {
					case 0:
						return _Utils_Tuple2(
							_Utils_update(
								model,
								{
									k: _Utils_update(
										myPlayer,
										{
											i: _Utils_update(
												storedKeys,
												{T: action})
										})
								}),
							elm$core$Platform$Cmd$none);
					case 1:
						return _Utils_Tuple2(
							_Utils_update(
								model,
								{
									k: _Utils_update(
										myPlayer,
										{
											i: _Utils_update(
												storedKeys,
												{R: action})
										})
								}),
							elm$core$Platform$Cmd$none);
					case 2:
						return _Utils_Tuple2(
							_Utils_update(
								model,
								{
									k: _Utils_update(
										myPlayer,
										{
											i: _Utils_update(
												storedKeys,
												{_: action})
										})
								}),
							elm$core$Platform$Cmd$none);
					case 3:
						return _Utils_Tuple2(
							_Utils_update(
								model,
								{
									k: _Utils_update(
										myPlayer,
										{
											i: _Utils_update(
												storedKeys,
												{ad: action})
										})
								}),
							elm$core$Platform$Cmd$none);
					default:
						return _Utils_Tuple2(model, elm$core$Platform$Cmd$none);
				}
			} else {
				switch (action) {
					case 0:
						return _Utils_Tuple2(
							_Utils_update(
								model,
								{
									k: _Utils_update(
										myPlayer,
										{
											i: _Utils_update(
												storedKeys,
												{T: 4})
										})
								}),
							elm$core$Platform$Cmd$none);
					case 1:
						return _Utils_Tuple2(
							_Utils_update(
								model,
								{
									k: _Utils_update(
										myPlayer,
										{
											i: _Utils_update(
												storedKeys,
												{R: 4})
										})
								}),
							elm$core$Platform$Cmd$none);
					case 2:
						return _Utils_Tuple2(
							_Utils_update(
								model,
								{
									k: _Utils_update(
										myPlayer,
										{
											i: _Utils_update(
												storedKeys,
												{_: 4})
										})
								}),
							elm$core$Platform$Cmd$none);
					case 3:
						return _Utils_Tuple2(
							_Utils_update(
								model,
								{
									k: _Utils_update(
										myPlayer,
										{
											i: _Utils_update(
												storedKeys,
												{ad: 4})
										})
								}),
							elm$core$Platform$Cmd$none);
					default:
						return _Utils_Tuple2(model, elm$core$Platform$Cmd$none);
				}
			}
		} else {
			return _Utils_Tuple2(model, elm$core$Platform$Cmd$none);
		}
	});
var author$project$Control$Update$update = F3(
	function (event, action, model) {
		return A3(author$project$Control$Player$applyInput, model, event, action);
	});
var author$project$Control$Module$update = author$project$Control$Update$update;
var author$project$Control$Player$convertInputToAngle = F2(
	function (l, p) {
		var angle = function () {
			var _n2 = p.S.aC;
			if (!_n2.$) {
				var m = _n2.a;
				return m.cq;
			} else {
				return 0;
			}
		}();
		if (l.b) {
			var x = l.a;
			var xs = l.b;
			switch (x) {
				case 2:
					return (-angle) + A2(author$project$Control$Player$convertInputToAngle, xs, p);
				case 3:
					return angle + A2(author$project$Control$Player$convertInputToAngle, xs, p);
				default:
					return 0 + A2(author$project$Control$Player$convertInputToAngle, xs, p);
			}
		} else {
			return 0;
		}
	});
var author$project$Control$Player$convertInputToForce = function (l) {
	if (!l.b) {
		return 0;
	} else {
		var x = l.a;
		var xs = l.b;
		switch (x) {
			case 0:
				return 2 + author$project$Control$Player$convertInputToForce(xs);
			case 1:
				return (-1) + author$project$Control$Player$convertInputToForce(xs);
			default:
				return 0 + author$project$Control$Player$convertInputToForce(xs);
		}
	}
};
var author$project$Objects$Physics$restrictSpeed = function (gO) {
	var _n0 = gO.aC;
	if (!_n0.$) {
		var motion = _n0.a;
		return A3(author$project$Objects$Physics$overwriteSpeedLimits, motion.aA, motion.az, gO);
	} else {
		return gO;
	}
};
var author$project$Objects$Physics$acceleration = F2(
	function (acc, gO) {
		var _n0 = gO.aC;
		if (!_n0.$) {
			var motion = _n0.a;
			return author$project$Objects$Physics$restrictSpeed(
				_Utils_update(
					gO,
					{
						aC: elm$core$Maybe$Just(
							_Utils_update(
								motion,
								{aV: motion.aV + acc}))
					}));
		} else {
			return gO;
		}
	});
var author$project$Objects$Physics$overwriteBrake = F2(
	function (bra, gO) {
		var _n0 = gO.aC;
		if (!_n0.$) {
			var motion = _n0.a;
			return ((motion.aV - bra) > 0) ? A2(author$project$Objects$Physics$setSpeed, motion.aV - bra, gO) : (((motion.aV + bra) < 0) ? A2(author$project$Objects$Physics$setSpeed, motion.aV + bra, gO) : A2(author$project$Objects$Physics$setSpeed, 0, gO));
		} else {
			return gO;
		}
	});
var author$project$Objects$Physics$autoBrake = F2(
	function (force, gO) {
		if (!force) {
			var _n0 = gO.aC;
			if (!_n0.$) {
				var motion = _n0.a;
				return A2(author$project$Objects$Physics$overwriteBrake, (motion.aA + motion.az) / 60, gO);
			} else {
				return gO;
			}
		} else {
			return gO;
		}
	});
var author$project$Objects$Physics$counterforce = F2(
	function (force, gO) {
		var _n0 = gO.aC;
		if (!_n0.$) {
			var motion = _n0.a;
			return ((force >= 1) && (motion.aV < 0)) ? A2(author$project$Objects$Physics$autoBrake, 0, gO) : (((_Utils_cmp(force, -1) < 1) && (motion.aV > 0)) ? A2(author$project$Objects$Physics$autoBrake, 0, gO) : gO);
		} else {
			return gO;
		}
	});
var author$project$Types$Running = 2;
var elm$core$Basics$cos = _Basics_cos;
var elm$core$Basics$pi = _Basics_pi;
var elm$core$Basics$degrees = function (angleInDegrees) {
	return (angleInDegrees * elm$core$Basics$pi) / 180;
};
var elm$core$Basics$round = _Basics_round;
var elm$core$Basics$sin = _Basics_sin;
var author$project$Control$Player$update = function (model) {
	var myPlayer = model.k;
	var listKeys = _List_fromArray(
		[myPlayer.i.T, myPlayer.i.R, myPlayer.i._, myPlayer.i.ad]);
	var gO = myPlayer.S;
	var calcY = F2(
		function (p, m) {
			return p.a3 - elm$core$Basics$round(
				((elm$core$Basics$cos(
					elm$core$Basics$degrees(gO.ae)) * m.aV) / model.U) * 4);
		});
	var calcX = F2(
		function (p, m) {
			return p.a2 + elm$core$Basics$round(
				((elm$core$Basics$sin(
					elm$core$Basics$degrees(gO.ae)) * m.aV) / model.U) * 4);
		});
	if (model.aW === 2) {
		var _n0 = gO.cc;
		if (!_n0.$) {
			var p = _n0.a;
			var _n1 = gO.aC;
			if (!_n1.$) {
				var m = _n1.a;
				return _Utils_update(
					model,
					{
						k: _Utils_update(
							myPlayer,
							{
								S: A2(
									author$project$Objects$Module$position,
									elm$core$Maybe$Just(
										{
											a2: A2(calcX, p, m),
											a3: A2(calcY, p, m)
										}),
									A2(
										author$project$Objects$Physics$counterforce,
										author$project$Control$Player$convertInputToForce(listKeys),
										A2(
											author$project$Objects$Physics$autoBrake,
											author$project$Control$Player$convertInputToForce(listKeys),
											A2(
												author$project$Objects$Physics$acceleration,
												author$project$Control$Player$convertInputToForce(listKeys),
												A2(
													author$project$Objects$Module$rotate,
													A2(
														elm$core$Basics$modBy,
														360,
														elm$core$Basics$round(
															gO.ae + A2(author$project$Control$Player$convertInputToAngle, listKeys, model.k))),
													gO))))),
								aZ: myPlayer.aZ + elm$core$Basics$round(model.U)
							})
					});
			} else {
				return model;
			}
		} else {
			return model;
		}
	} else {
		return model;
	}
};
var author$project$Types$PrepareRace = 3;
var author$project$Map$Track$Update$update = function (model) {
	if ((model.aW === 3) && (model.ay.b5.cd > 0)) {
		var map = model.ay;
		var options = map.b5;
		var updatedMap = _Utils_update(
			map,
			{
				b5: _Utils_update(
					options,
					{cd: map.b5.cd - model.U})
			});
		return _Utils_update(
			model,
			{ay: updatedMap});
	} else {
		if ((model.aW === 3) && (model.ay.b5.cd <= 0)) {
			return _Utils_update(
				model,
				{aW: 2});
		} else {
			return model;
		}
	}
};
var author$project$Map$Track$Module$update = author$project$Map$Track$Update$update;
var elm$json$Json$Encode$bool = _Json_wrap;
var elm$json$Json$Encode$float = _Json_wrap;
var elm$json$Json$Encode$int = _Json_wrap;
var elm$json$Json$Encode$list = F2(
	function (func, entries) {
		return _Json_wrap(
			A3(
				elm$core$List$foldl,
				_Json_addEntry(func),
				_Json_emptyArray(0),
				entries));
	});
var elm$json$Json$Encode$string = _Json_wrap;
var author$project$Network$Encode$encodeLobby = function (lobby) {
	return _List_fromArray(
		[
			_Utils_Tuple2(
			'identifier',
			elm$json$Json$Encode$string(lobby.au)),
			_Utils_Tuple2(
			'maxPlayer',
			elm$json$Json$Encode$int(lobby.bX)),
			_Utils_Tuple2(
			'map',
			elm$json$Json$Encode$string(lobby.ay)),
			_Utils_Tuple2(
			'onlinePlayers',
			A2(elm$json$Json$Encode$list, elm$json$Json$Encode$string, lobby.aF)),
			_Utils_Tuple2(
			'ttl',
			elm$json$Json$Encode$float(lobby.cw)),
			_Utils_Tuple2(
			'running',
			elm$json$Json$Encode$bool(lobby.ch))
		]);
};
var elm$json$Json$Encode$object = function (pairs) {
	return _Json_wrap(
		A3(
			elm$core$List$foldl,
			F2(
				function (_n0, obj) {
					var k = _n0.a;
					var v = _n0.b;
					return A3(_Json_addField, k, v, obj);
				}),
			_Json_emptyObject(0),
			pairs));
};
var author$project$Network$Commands$encodeLobby = function (lobby) {
	return A2(
		elm$json$Json$Encode$encode,
		0,
		elm$json$Json$Encode$object(
			author$project$Network$Encode$encodeLobby(lobby)));
};
var author$project$Network$Module$encodeLobby = author$project$Network$Commands$encodeLobby;
var elm$core$Maybe$withDefault = F2(
	function (_default, maybe) {
		if (!maybe.$) {
			var value = maybe.a;
			return value;
		} else {
			return _default;
		}
	});
var author$project$Network$Encode$encodePlayer = function (player) {
	var gO = player.S;
	var gOPosition = A2(
		elm$core$Maybe$withDefault,
		{a2: 0, a3: 0},
		gO.cc);
	var spriteMinimap = A2(elm$core$Maybe$withDefault, '', gO.cl);
	return _List_fromArray(
		[
			_Utils_Tuple2(
			'identifier',
			elm$json$Json$Encode$string(player.au)),
			_Utils_Tuple2(
			'label',
			elm$json$Json$Encode$string(player.bN.ct)),
			_Utils_Tuple2(
			'labelCol',
			elm$json$Json$Encode$string(player.bN.bh)),
			_Utils_Tuple2(
			'labelSize',
			elm$json$Json$Encode$int(player.bN.cj)),
			_Utils_Tuple2(
			'labelVisible',
			elm$json$Json$Encode$bool(player.bN.cB)),
			_Utils_Tuple2(
			'currentLab',
			elm$json$Json$Encode$int(player.bj)),
			_Utils_Tuple2(
			'time',
			elm$json$Json$Encode$int(player.aZ)),
			_Utils_Tuple2(
			'catchedCheckpoints',
			elm$json$Json$Encode$int(
				elm$core$List$length(player.bd))),
			_Utils_Tuple2(
			'gOIdentifier',
			elm$json$Json$Encode$string(gO.au)),
			_Utils_Tuple2(
			'gOPositionX',
			elm$json$Json$Encode$int(gOPosition.a2)),
			_Utils_Tuple2(
			'gOPositionY',
			elm$json$Json$Encode$int(gOPosition.a3)),
			_Utils_Tuple2(
			'gOSprite',
			elm$json$Json$Encode$string(gO.ck)),
			_Utils_Tuple2(
			'gOSpriteMinimap',
			elm$json$Json$Encode$string(spriteMinimap)),
			_Utils_Tuple2(
			'gORotate',
			elm$json$Json$Encode$float(gO.ae)),
			_Utils_Tuple2(
			'gOSizeHeight',
			elm$json$Json$Encode$int(gO.cj.bC)),
			_Utils_Tuple2(
			'gOSizeWidth',
			elm$json$Json$Encode$int(gO.cj.cD))
		]);
};
var author$project$Network$Commands$encodePlayer = function (player) {
	return A2(
		elm$json$Json$Encode$encode,
		0,
		elm$json$Json$Encode$object(
			author$project$Network$Encode$encodePlayer(player)));
};
var author$project$Network$Module$encodePlayer = author$project$Network$Commands$encodePlayer;
var elm$core$Basics$always = F2(
	function (a, _n0) {
		return a;
	});
var author$project$Network$Commands$run = function (m) {
	return A2(
		elm$core$Task$perform,
		elm$core$Basics$always(m),
		elm$core$Task$succeed(0));
};
var elm$core$String$trim = _String_trim;
var author$project$Network$PredefinedMessages$sendJson2 = F2(
	function (field, message) {
		return elm$core$String$trim('{\"module\": \"WebSocket\", \"tag\": \"send\", \"args\": {\"key\": \"elminator\", \"message\":{ \"') + (field + ('\":' + (message + '}}}')));
	});
var author$project$Types$Send = function (a) {
	return {$: 0, a: a};
};
var author$project$Network$Commands$send = F2(
	function (field, message) {
		return author$project$Network$Commands$run(
			author$project$Types$Websocket(
				author$project$Types$Send(
					A2(author$project$Network$PredefinedMessages$sendJson2, field, message))));
	});
var author$project$Network$Module$send = author$project$Network$Commands$send;
var author$project$Types$LobbyControl = F6(
	function (identifier, playerId, join, start, finish, leave) {
		return {bq: finish, au: identifier, bJ: join, bS: leave, ca: playerId, cm: start};
	});
var elm$json$Json$Decode$bool = _Json_decodeBool;
var elm_community$json_extra$Json$Decode$Extra$andMap = elm$json$Json$Decode$map2(elm$core$Basics$apR);
var author$project$Network$Decode$lobbyControlDecoder = A2(
	elm_community$json_extra$Json$Decode$Extra$andMap,
	A2(elm$json$Json$Decode$field, 'leave', elm$json$Json$Decode$bool),
	A2(
		elm_community$json_extra$Json$Decode$Extra$andMap,
		A2(elm$json$Json$Decode$field, 'finish', elm$json$Json$Decode$bool),
		A2(
			elm_community$json_extra$Json$Decode$Extra$andMap,
			A2(elm$json$Json$Decode$field, 'start', elm$json$Json$Decode$bool),
			A2(
				elm_community$json_extra$Json$Decode$Extra$andMap,
				A2(elm$json$Json$Decode$field, 'join', elm$json$Json$Decode$bool),
				A2(
					elm_community$json_extra$Json$Decode$Extra$andMap,
					A2(elm$json$Json$Decode$field, 'playerId', elm$json$Json$Decode$string),
					A2(
						elm_community$json_extra$Json$Decode$Extra$andMap,
						A2(elm$json$Json$Decode$field, 'identifier', elm$json$Json$Decode$string),
						elm$json$Json$Decode$succeed(author$project$Types$LobbyControl)))))));
var author$project$Types$Lobby = F6(
	function (identifier, maxPlayer, map, onlinePlayers, ttl, running) {
		return {au: identifier, ay: map, bX: maxPlayer, aF: onlinePlayers, ch: running, cw: ttl};
	});
var elm$json$Json$Decode$float = _Json_decodeFloat;
var elm$json$Json$Decode$int = _Json_decodeInt;
var elm$json$Json$Decode$list = _Json_decodeList;
var author$project$Network$Decode$lobbyDecoder = A2(
	elm_community$json_extra$Json$Decode$Extra$andMap,
	A2(elm$json$Json$Decode$field, 'running', elm$json$Json$Decode$bool),
	A2(
		elm_community$json_extra$Json$Decode$Extra$andMap,
		A2(elm$json$Json$Decode$field, 'ttl', elm$json$Json$Decode$float),
		A2(
			elm_community$json_extra$Json$Decode$Extra$andMap,
			A2(
				elm$json$Json$Decode$field,
				'onlinePlayers',
				elm$json$Json$Decode$list(elm$json$Json$Decode$string)),
			A2(
				elm_community$json_extra$Json$Decode$Extra$andMap,
				A2(elm$json$Json$Decode$field, 'map', elm$json$Json$Decode$string),
				A2(
					elm_community$json_extra$Json$Decode$Extra$andMap,
					A2(elm$json$Json$Decode$field, 'maxPlayer', elm$json$Json$Decode$int),
					A2(
						elm_community$json_extra$Json$Decode$Extra$andMap,
						A2(elm$json$Json$Decode$field, 'identifier', elm$json$Json$Decode$string),
						elm$json$Json$Decode$succeed(author$project$Types$Lobby)))))));
var author$project$Types$SchemePlayer = function (identifier) {
	return function (label) {
		return function (labelCol) {
			return function (labelSize) {
				return function (labelVisible) {
					return function (currentLab) {
						return function (time) {
							return function (catchedCheckpoints) {
								return function (gOIdentifier) {
									return function (gOPositionX) {
										return function (gOPositionY) {
											return function (gOSprite) {
												return function (gOSpriteMinimap) {
													return function (gORotate) {
														return function (gOSizeHeight) {
															return function (gOSizeWidth) {
																return {bd: catchedCheckpoints, bj: currentLab, bv: gOIdentifier, bw: gOPositionX, bx: gOPositionY, by: gORotate, bz: gOSizeHeight, bA: gOSizeWidth, ar: gOSprite, bB: gOSpriteMinimap, au: identifier, bN: label, bO: labelCol, bP: labelSize, bQ: labelVisible, aZ: time};
															};
														};
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};
var author$project$Network$Decode$playerDecoder = A2(
	elm_community$json_extra$Json$Decode$Extra$andMap,
	A2(elm$json$Json$Decode$field, 'gOSizeWidth', elm$json$Json$Decode$int),
	A2(
		elm_community$json_extra$Json$Decode$Extra$andMap,
		A2(elm$json$Json$Decode$field, 'gOSizeHeight', elm$json$Json$Decode$int),
		A2(
			elm_community$json_extra$Json$Decode$Extra$andMap,
			A2(elm$json$Json$Decode$field, 'gORotate', elm$json$Json$Decode$float),
			A2(
				elm_community$json_extra$Json$Decode$Extra$andMap,
				A2(elm$json$Json$Decode$field, 'gOSpriteMinimap', elm$json$Json$Decode$string),
				A2(
					elm_community$json_extra$Json$Decode$Extra$andMap,
					A2(elm$json$Json$Decode$field, 'gOSprite', elm$json$Json$Decode$string),
					A2(
						elm_community$json_extra$Json$Decode$Extra$andMap,
						A2(elm$json$Json$Decode$field, 'gOPositionY', elm$json$Json$Decode$int),
						A2(
							elm_community$json_extra$Json$Decode$Extra$andMap,
							A2(elm$json$Json$Decode$field, 'gOPositionX', elm$json$Json$Decode$int),
							A2(
								elm_community$json_extra$Json$Decode$Extra$andMap,
								A2(elm$json$Json$Decode$field, 'gOIdentifier', elm$json$Json$Decode$string),
								A2(
									elm_community$json_extra$Json$Decode$Extra$andMap,
									A2(elm$json$Json$Decode$field, 'catchedCheckpoints', elm$json$Json$Decode$int),
									A2(
										elm_community$json_extra$Json$Decode$Extra$andMap,
										A2(elm$json$Json$Decode$field, 'time', elm$json$Json$Decode$int),
										A2(
											elm_community$json_extra$Json$Decode$Extra$andMap,
											A2(elm$json$Json$Decode$field, 'currentLab', elm$json$Json$Decode$int),
											A2(
												elm_community$json_extra$Json$Decode$Extra$andMap,
												A2(elm$json$Json$Decode$field, 'labelVisible', elm$json$Json$Decode$bool),
												A2(
													elm_community$json_extra$Json$Decode$Extra$andMap,
													A2(elm$json$Json$Decode$field, 'labelSize', elm$json$Json$Decode$int),
													A2(
														elm_community$json_extra$Json$Decode$Extra$andMap,
														A2(elm$json$Json$Decode$field, 'labelCol', elm$json$Json$Decode$string),
														A2(
															elm_community$json_extra$Json$Decode$Extra$andMap,
															A2(elm$json$Json$Decode$field, 'label', elm$json$Json$Decode$string),
															A2(
																elm_community$json_extra$Json$Decode$Extra$andMap,
																A2(elm$json$Json$Decode$field, 'identifier', elm$json$Json$Decode$string),
																elm$json$Json$Decode$succeed(author$project$Types$SchemePlayer)))))))))))))))));
var author$project$Types$Message = F3(
	function (lobby, player, lobbyControl) {
		return {bT: lobby, bU: lobbyControl, b9: player};
	});
var elm$json$Json$Decode$oneOf = _Json_oneOf;
var elm$json$Json$Decode$maybe = function (decoder) {
	return elm$json$Json$Decode$oneOf(
		_List_fromArray(
			[
				A2(elm$json$Json$Decode$map, elm$core$Maybe$Just, decoder),
				elm$json$Json$Decode$succeed(elm$core$Maybe$Nothing)
			]));
};
var author$project$Network$Decode$messageDecoder = A2(
	elm_community$json_extra$Json$Decode$Extra$andMap,
	elm$json$Json$Decode$maybe(
		A2(elm$json$Json$Decode$field, 'lobbyControl', author$project$Network$Decode$lobbyControlDecoder)),
	A2(
		elm_community$json_extra$Json$Decode$Extra$andMap,
		elm$json$Json$Decode$maybe(
			A2(elm$json$Json$Decode$field, 'player', author$project$Network$Decode$playerDecoder)),
		A2(
			elm_community$json_extra$Json$Decode$Extra$andMap,
			elm$json$Json$Decode$maybe(
				A2(elm$json$Json$Decode$field, 'lobby', author$project$Network$Decode$lobbyDecoder)),
			elm$json$Json$Decode$succeed(author$project$Types$Message))));
var author$project$Types$Args = F2(
	function (message, key) {
		return {bK: key, bY: message};
	});
var author$project$Network$Decode$argsDecoder = A2(
	elm_community$json_extra$Json$Decode$Extra$andMap,
	A2(elm$json$Json$Decode$field, 'key', elm$json$Json$Decode$string),
	A2(
		elm_community$json_extra$Json$Decode$Extra$andMap,
		A2(elm$json$Json$Decode$field, 'message', author$project$Network$Decode$messageDecoder),
		elm$json$Json$Decode$succeed(author$project$Types$Args)));
var elm$json$Json$Decode$decodeString = _Json_runOnString;
var author$project$Network$Decode$decode = function (json) {
	var message = A2(
		elm$json$Json$Decode$decodeString,
		A2(elm$json$Json$Decode$field, 'args', author$project$Network$Decode$argsDecoder),
		json);
	if (!message.$) {
		var m = message.a;
		return elm$core$Maybe$Just(m.bY);
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var author$project$Network$Ports$cmdPort = _Platform_outgoingPort('cmdPort', elm$core$Basics$identity);
var author$project$Network$Ports$parse = _Platform_outgoingPort('parse', elm$json$Json$Encode$string);
var author$project$Types$Other = 5;
var author$project$Network$Scheme$player = function (p) {
	var gameObject = {
		bg: elm$core$Maybe$Nothing,
		au: p.bv,
		bL: 2,
		aC: elm$core$Maybe$Nothing,
		b8: elm$core$Maybe$Nothing,
		cc: elm$core$Maybe$Just(
			{a2: p.bw, a3: p.bx}),
		ae: p.by,
		cj: {bC: p.bz, cD: p.bA},
		ck: p.ar,
		cl: elm$core$Maybe$Just(p.ar)
	};
	var playerRecord = {
		a7: {a5: 5, R: 5, T: 5, _: 5, ad: 5},
		bd: _List_Nil,
		S: gameObject,
		bj: p.bj,
		au: p.au,
		bN: {bh: p.bO, cj: p.bP, ct: p.bN, cB: p.bQ},
		i: {R: 4, T: 4, _: 4, ad: 4},
		aZ: p.aZ
	};
	return playerRecord;
};
var elm$core$List$filter = F2(
	function (isGood, list) {
		return A3(
			elm$core$List$foldr,
			F2(
				function (x, xs) {
					return isGood(x) ? A2(elm$core$List$cons, x, xs) : xs;
				}),
			_List_Nil,
			list);
	});
var author$project$Network$Update$addPlayerToOwnLobby = F2(
	function (model, uuid) {
		var ownLobby = model.b7;
		return (_Utils_cmp(
			ownLobby.bX,
			elm$core$List$length(ownLobby.aF)) > 0) ? _Utils_update(
			model,
			{
				b7: _Utils_update(
					ownLobby,
					{
						aF: A2(
							elm$core$List$cons,
							uuid,
							A2(
								elm$core$List$filter,
								function (x) {
									return !_Utils_eq(x, uuid);
								},
								model.b7.aF))
					})
			}) : model;
	});
var author$project$Network$Encode$encodeLobbyControl = function (lobbyControl) {
	return _List_fromArray(
		[
			_Utils_Tuple2(
			'identifier',
			elm$json$Json$Encode$string(lobbyControl.au)),
			_Utils_Tuple2(
			'playerId',
			elm$json$Json$Encode$string(lobbyControl.ca)),
			_Utils_Tuple2(
			'join',
			elm$json$Json$Encode$bool(lobbyControl.bJ)),
			_Utils_Tuple2(
			'start',
			elm$json$Json$Encode$bool(lobbyControl.cm)),
			_Utils_Tuple2(
			'finish',
			elm$json$Json$Encode$bool(lobbyControl.bq)),
			_Utils_Tuple2(
			'leave',
			elm$json$Json$Encode$bool(lobbyControl.bS))
		]);
};
var author$project$Network$Commands$encodeLobbyControl = function (lobbyControl) {
	return A2(
		elm$json$Json$Encode$encode,
		0,
		elm$json$Json$Encode$object(
			author$project$Network$Encode$encodeLobbyControl(lobbyControl)));
};
var author$project$Types$ChangeTo = F2(
	function (a, b) {
		return {$: 0, a: a, b: b};
	});
var author$project$Types$SceneManager = function (a) {
	return {$: 3, a: a};
};
var author$project$Network$Update$checkLobbyState = function (model) {
	var ownLobby = model.b7;
	var oL = model.b7;
	var lobbyControlMessageStart = {bq: false, au: ownLobby.au, bJ: false, bS: false, ca: model.k.au, cm: true};
	if (_Utils_cmp(
		ownLobby.bX,
		elm$core$List$length(ownLobby.aF)) < 1) {
		var updatedModel = _Utils_update(
			model,
			{
				b7: _Utils_update(
					oL,
					{ch: true})
			});
		return _Utils_Tuple2(
			updatedModel,
			elm$core$Platform$Cmd$batch(
				_List_fromArray(
					[
						A2(
						author$project$Network$Commands$send,
						'lobbyControl',
						author$project$Network$Commands$encodeLobbyControl(lobbyControlMessageStart)),
						author$project$Network$Commands$run(
						author$project$Types$SceneManager(
							A2(author$project$Types$ChangeTo, updatedModel, 3)))
					])));
	} else {
		return _Utils_Tuple2(model, elm$core$Platform$Cmd$none);
	}
};
var author$project$Network$Update$removePlayerFromLobby = F2(
	function (model, lobbyControl) {
		var ownLobby = model.b7;
		return _Utils_update(
			model,
			{
				b7: _Utils_update(
					ownLobby,
					{
						aF: A2(
							elm$core$List$filter,
							function (x) {
								return !_Utils_eq(x, lobbyControl.ca);
							},
							ownLobby.aF)
					})
			});
	});
var author$project$Network$Update$updateLobbyPool = F2(
	function (model, lobby) {
		var network = model.b0;
		return _Utils_update(
			model,
			{
				b0: _Utils_update(
					network,
					{
						bV: A2(
							elm$core$List$cons,
							lobby,
							A2(
								elm$core$List$filter,
								function (x) {
									return !_Utils_eq(x.au, lobby.au);
								},
								network.bV))
					})
			});
	});
var author$project$Network$Update$update = F2(
	function (wsMessage, model) {
		switch (wsMessage.$) {
			case 1:
				var v = wsMessage.a;
				var message = A2(elm$json$Json$Encode$encode, 0, v);
				return _Utils_Tuple2(
					model,
					author$project$Network$Ports$cmdPort(v));
			case 2:
				var v = wsMessage.a;
				var message = author$project$Network$Decode$decode(
					A2(elm$json$Json$Encode$encode, 0, v));
				if (!message.$) {
					var m = message.a;
					var _n2 = _Utils_Tuple3(m.b9, m.bT, m.bU);
					if (!_n2.a.$) {
						var player = _n2.a.a;
						var p = author$project$Network$Scheme$player(player);
						return Janiczek$cmd_extra$Cmd$Extra$withNoCmd(
							_Utils_update(
								model,
								{
									aF: A2(
										elm$core$List$cons,
										p,
										A2(
											elm$core$List$filter,
											function (x) {
												return !_Utils_eq(x.au, p.au);
											},
											model.aF))
								}));
					} else {
						if (!_n2.b.$) {
							var lobby = _n2.b.a;
							return Janiczek$cmd_extra$Cmd$Extra$withNoCmd(
								A2(author$project$Network$Update$updateLobbyPool, model, lobby));
						} else {
							if (!_n2.c.$) {
								var lobbyControl = _n2.c.a;
								var senderId = lobbyControl.ca;
								var ownLobby = model.b7;
								var ownLobbyId = ownLobby.au;
								var lobbyId = lobbyControl.au;
								return (lobbyControl.bq && (_Utils_eq(lobbyControl.au, model.b0.ci) || _Utils_eq(lobbyControl.au, ownLobbyId))) ? A2(
									Janiczek$cmd_extra$Cmd$Extra$withCmd,
									author$project$Network$Commands$run(
										author$project$Types$SceneManager(
											A2(author$project$Types$ChangeTo, model, 1))),
									model) : ((_Utils_eq(lobbyId, ownLobbyId) && lobbyControl.bJ) ? author$project$Network$Update$checkLobbyState(
									A2(author$project$Network$Update$addPlayerToOwnLobby, model, senderId)) : ((_Utils_eq(lobbyId, ownLobbyId) && lobbyControl.bS) ? _Utils_Tuple2(
									A2(author$project$Network$Update$removePlayerFromLobby, model, lobbyControl),
									elm$core$Platform$Cmd$none) : ((lobbyControl.cm && _Utils_eq(lobbyControl.au, model.b0.ci)) ? A2(
									Janiczek$cmd_extra$Cmd$Extra$withCmd,
									author$project$Network$Commands$run(
										author$project$Types$SceneManager(
											A2(author$project$Types$ChangeTo, model, 3))),
									model) : Janiczek$cmd_extra$Cmd$Extra$withNoCmd(model))));
							} else {
								return Janiczek$cmd_extra$Cmd$Extra$withNoCmd(model);
							}
						}
					}
				} else {
					return Janiczek$cmd_extra$Cmd$Extra$withNoCmd(model);
				}
			default:
				var m = wsMessage.a;
				return _Utils_Tuple2(
					model,
					author$project$Network$Ports$parse(m));
		}
	});
var author$project$Network$Module$update = author$project$Network$Update$update;
var author$project$Network$Module$updateTtl = function (model) {
	var network = model.b0;
	var lobbyPool = network.bV;
	var decreaseTll = function (l) {
		return A2(
			elm$core$List$filter,
			function (x) {
				return x.cw > 0;
			},
			A2(
				elm$core$List$map,
				function (x) {
					return _Utils_update(
						x,
						{cw: x.cw - model.U});
				},
				l));
	};
	return _Utils_update(
		model,
		{
			b0: _Utils_update(
				network,
				{
					bV: decreaseTll(lobbyPool)
				})
		});
};
var author$project$Objects$Physics$addImpact = F2(
	function (l, gO) {
		addImpact:
		while (true) {
			var checkToRemoveBackgroundImpact = function (list) {
				var filterBackgroundImpact = function (impact) {
					var i = impact;
					return (!(i.au === 'background')) && i.b6;
				};
				return (elm$core$List$length(list) > 1) ? A2(elm$core$List$filter, filterBackgroundImpact, list) : list;
			};
			var addImpactHelper = F2(
				function (physics, collider) {
					var updateUnmodifiedGameobject = function (impact) {
						var i = impact;
						return _Utils_update(
							i,
							{
								a0: elm$core$Maybe$Just(gO)
							});
					};
					if (!collider.$) {
						var c = collider.a;
						if (!c.$) {
							var r = c.a;
							var _n4 = r.bE;
							if (!_n4.$) {
								var impact = _n4.a;
								return _Utils_update(
									physics,
									{
										t: checkToRemoveBackgroundImpact(
											A2(
												elm$core$List$cons,
												updateUnmodifiedGameobject(impact),
												physics.t))
									});
							} else {
								return physics;
							}
						} else {
							return physics;
						}
					} else {
						return physics;
					}
				});
			if (l.b) {
				var x = l.a;
				var xs = l.b;
				var _n1 = gO.b8;
				if (!_n1.$) {
					var p = _n1.a;
					var $temp$l = xs,
						$temp$gO = _Utils_update(
						gO,
						{
							b8: elm$core$Maybe$Just(
								A2(addImpactHelper, p, x.bg))
						});
					l = $temp$l;
					gO = $temp$gO;
					continue addImpact;
				} else {
					return gO;
				}
			} else {
				return gO;
			}
		}
	});
var author$project$Objects$Physics$checkCollision = F2(
	function (gO, l) {
		checkCollision:
		while (true) {
			var compareBorders = F2(
				function (gO1, gO2) {
					if (!_Utils_eq(gO1.au, gO2.au)) {
						var _n2 = _Utils_Tuple2(gO1.bg, gO2.bg);
						if ((!_n2.a.$) && (!_n2.b.$)) {
							var c1 = _n2.a.a;
							var c2 = _n2.b.a;
							var _n3 = _Utils_Tuple2(gO1.cc, gO2.cc);
							if ((!_n3.a.$) && (!_n3.b.$)) {
								var p1 = _n3.a.a;
								var p2 = _n3.b.a;
								var _n4 = _Utils_Tuple2(c1, c2);
								if ((!_n4.a.$) && (!_n4.b.$)) {
									var r1 = _n4.a.a;
									var r2 = _n4.b.a;
									return (!((_Utils_cmp(p2.a2 + r2.cc.a2, (p1.a2 + r1.cc.a2) + r1.cD) > 0) || ((_Utils_cmp((p2.a2 + r2.cc.a2) + r2.cD, p1.a2 + r1.cc.a2) < 0) || ((_Utils_cmp(p2.a3 + r2.cc.a3, (p1.a3 + r1.cc.a3) + r1.bC) > 0) || (_Utils_cmp((p2.a3 + r2.cc.a3) + r2.bC, p1.a3 + r1.cc.a3) < 0))))) ? elm$core$Maybe$Just(gO2) : elm$core$Maybe$Nothing;
								} else {
									return elm$core$Maybe$Nothing;
								}
							} else {
								return elm$core$Maybe$Nothing;
							}
						} else {
							return elm$core$Maybe$Nothing;
						}
					} else {
						return elm$core$Maybe$Nothing;
					}
				});
			if (l.b) {
				var x = l.a;
				var xs = l.b;
				var _n1 = A2(compareBorders, gO, x);
				if (!_n1.$) {
					var gameObject = _n1.a;
					return A2(
						elm$core$List$cons,
						gameObject,
						A2(author$project$Objects$Physics$checkCollision, gO, xs));
				} else {
					var $temp$gO = gO,
						$temp$l = xs;
					gO = $temp$gO;
					l = $temp$l;
					continue checkCollision;
				}
			} else {
				return _List_Nil;
			}
		}
	});
var author$project$Objects$Physics$runImpact = function (gO) {
	var iterateThroughImpact = F2(
		function (l, gameObject) {
			iterateThroughImpact:
			while (true) {
				if (l.b) {
					var x = l.a;
					var xs = l.b;
					var impact = x;
					var _n2 = impact.bu;
					if (!_n2.$) {
						var f = _n2.a;
						var $temp$l = xs,
							$temp$gameObject = A2(f, impact, gameObject);
						l = $temp$l;
						gameObject = $temp$gameObject;
						continue iterateThroughImpact;
					} else {
						return gameObject;
					}
				} else {
					return gameObject;
				}
			}
		});
	var _n3 = gO.b8;
	if (!_n3.$) {
		var p = _n3.a;
		return A2(iterateThroughImpact, p.t, gO);
	} else {
		return gO;
	}
};
var author$project$Objects$Physics$updateImpacts = F2(
	function (model, gO) {
		var removeExpiredImpacts = function (impact) {
			var i = impact;
			return i.O > 0;
		};
		var reduceDuration = function (impact) {
			var i = impact;
			return (i.O > 0) ? _Utils_update(
				i,
				{O: i.O - model.U}) : impact;
		};
		var _n0 = gO.b8;
		if (!_n0.$) {
			var p = _n0.a;
			return _Utils_update(
				gO,
				{
					b8: elm$core$Maybe$Just(
						_Utils_update(
							p,
							{
								t: A2(
									elm$core$List$filter,
									removeExpiredImpacts,
									A2(elm$core$List$map, reduceDuration, p.t))
							}))
				});
		} else {
			return gO;
		}
	});
var author$project$Objects$Trigger$run = F3(
	function (gO, l, m) {
		run:
		while (true) {
			if (l.b) {
				var x = l.a;
				var xs = l.b;
				var _n1 = x.bg;
				if (!_n1.$) {
					var collider = _n1.a;
					if (!collider.$) {
						var r = collider.a;
						var _n3 = r.a$;
						if (!_n3.$) {
							var f = _n3.a;
							return A2(f, x, m);
						} else {
							var $temp$gO = gO,
								$temp$l = xs,
								$temp$m = m;
							gO = $temp$gO;
							l = $temp$l;
							m = $temp$m;
							continue run;
						}
					} else {
						var $temp$gO = gO,
							$temp$l = xs,
							$temp$m = m;
						gO = $temp$gO;
						l = $temp$l;
						m = $temp$m;
						continue run;
					}
				} else {
					var $temp$gO = gO,
						$temp$l = xs,
						$temp$m = m;
					gO = $temp$gO;
					l = $temp$l;
					m = $temp$m;
					continue run;
				}
			} else {
				return m;
			}
		}
	});
var author$project$Objects$Physics$update = function (model) {
	var objectList = _Utils_ap(
		model.ay.Q.cv,
		_Utils_ap(
			model.ay.Q.bl,
			_Utils_ap(model.ay.Q.cf, model.ay.Q.ba)));
	var myPlayer = model.k;
	var controlledObject = model.k.S;
	var approvedCollision = {
		t: A2(author$project$Objects$Physics$checkCollision, controlledObject, objectList),
		cv: A2(author$project$Objects$Physics$checkCollision, controlledObject, model.ay.Q.cv)
	};
	return A3(
		author$project$Objects$Trigger$run,
		controlledObject,
		approvedCollision.cv,
		_Utils_update(
			model,
			{
				k: _Utils_update(
					myPlayer,
					{
						S: A2(
							author$project$Objects$Physics$updateImpacts,
							model,
							author$project$Objects$Physics$runImpact(
								A2(author$project$Objects$Physics$addImpact, approvedCollision.t, controlledObject)))
					})
			}));
};
var author$project$Ui$Scenes$FinishMenu$Update$update = F2(
	function (msg, model) {
		return _Utils_Tuple2(model, elm$core$Platform$Cmd$none);
	});
var author$project$Ui$Scenes$FinishMenu$Module$update = author$project$Ui$Scenes$FinishMenu$Update$update;
var author$project$Ui$Scenes$MainMenu$Update$changeCar = F2(
	function (model, gO) {
		var myPlayer = model.k;
		return _Utils_Tuple2(
			_Utils_update(
				model,
				{
					k: _Utils_update(
						myPlayer,
						{S: gO})
				}),
			elm$core$Platform$Cmd$none);
	});
var author$project$Types$LobbyUUID = 1;
var author$project$Types$SetUUID = F2(
	function (a, b) {
		return {$: 8, a: a, b: b};
	});
var elm$random$Random$Generate = elm$core$Basics$identity;
var elm$random$Random$initialSeed = function (x) {
	var _n0 = elm$random$Random$next(
		A2(elm$random$Random$Seed, 0, 1013904223));
	var state1 = _n0.a;
	var incr = _n0.b;
	var state2 = (state1 + x) >>> 0;
	return elm$random$Random$next(
		A2(elm$random$Random$Seed, state2, incr));
};
var elm$time$Time$posixToMillis = function (_n0) {
	var millis = _n0;
	return millis;
};
var elm$random$Random$init = A2(
	elm$core$Task$andThen,
	function (time) {
		return elm$core$Task$succeed(
			elm$random$Random$initialSeed(
				elm$time$Time$posixToMillis(time)));
	},
	elm$time$Time$now);
var elm$random$Random$step = F2(
	function (_n0, seed) {
		var generator = _n0;
		return generator(seed);
	});
var elm$random$Random$onEffects = F3(
	function (router, commands, seed) {
		if (!commands.b) {
			return elm$core$Task$succeed(seed);
		} else {
			var generator = commands.a;
			var rest = commands.b;
			var _n1 = A2(elm$random$Random$step, generator, seed);
			var value = _n1.a;
			var newSeed = _n1.b;
			return A2(
				elm$core$Task$andThen,
				function (_n2) {
					return A3(elm$random$Random$onEffects, router, rest, newSeed);
				},
				A2(elm$core$Platform$sendToApp, router, value));
		}
	});
var elm$random$Random$onSelfMsg = F3(
	function (_n0, _n1, seed) {
		return elm$core$Task$succeed(seed);
	});
var elm$random$Random$cmdMap = F2(
	function (func, _n0) {
		var generator = _n0;
		return A2(elm$random$Random$map, func, generator);
	});
_Platform_effectManagers['Random'] = _Platform_createManager(elm$random$Random$init, elm$random$Random$onEffects, elm$random$Random$onSelfMsg, elm$random$Random$cmdMap);
var elm$random$Random$command = _Platform_leaf('Random');
var elm$random$Random$generate = F2(
	function (tagger, generator) {
		return elm$random$Random$command(
			A2(elm$random$Random$map, tagger, generator));
	});
var author$project$Ui$Scenes$MainMenu$Update$changeGameType = function (model) {
	var n = model.b0;
	var l = model.b7;
	return n.b_ ? _Utils_Tuple2(
		_Utils_update(
			model,
			{b0: author$project$InitialModel$initialModel.b0, b7: author$project$InitialModel$initialModel.b7}),
		A2(
			elm$random$Random$generate,
			author$project$Types$SetUUID(1),
			TSFoster$elm_uuid$UUID$generator)) : _Utils_Tuple2(
		_Utils_update(
			model,
			{
				b0: _Utils_update(
					n,
					{b_: true, ci: model.b7.au}),
				b7: _Utils_update(
					l,
					{
						aF: A2(elm$core$List$cons, model.k.au, l.aF),
						ch: false
					})
			}),
		elm$core$Platform$Cmd$none);
};
var author$project$Ui$Scenes$MainMenu$Update$changeMap = F2(
	function (model, m) {
		var l = model.b7;
		return _Utils_Tuple2(
			_Utils_update(
				model,
				{
					ay: m,
					b7: _Utils_update(
						l,
						{ay: m.bZ.b$})
				}),
			elm$core$Platform$Cmd$none);
	});
var author$project$Ui$Scenes$MainMenu$Update$changeName = F2(
	function (model, name) {
		var myPlayer = model.k;
		var label = model.k.bN;
		return _Utils_Tuple2(
			_Utils_update(
				model,
				{
					k: _Utils_update(
						myPlayer,
						{
							bN: _Utils_update(
								label,
								{ct: name})
						})
				}),
			elm$core$Platform$Cmd$none);
	});
var author$project$Ui$Scenes$MainMenu$Update$changePlayerCount = F2(
	function (model, c) {
		var l = model.b7;
		var _n0 = elm$core$String$toInt(c);
		if (!_n0.$) {
			var count = _n0.a;
			return _Utils_Tuple2(
				_Utils_update(
					model,
					{
						b7: _Utils_update(
							l,
							{bX: count})
					}),
				elm$core$Platform$Cmd$none);
		} else {
			return _Utils_Tuple2(
				_Utils_update(
					model,
					{
						b7: _Utils_update(
							l,
							{bX: 1})
					}),
				elm$core$Platform$Cmd$none);
		}
	});
var author$project$Network$Module$encodeLobbyControl = author$project$Network$Commands$encodeLobbyControl;
var author$project$Ui$Scenes$MainMenu$Update$joinLobby = F2(
	function (model, lobby) {
		var n = model.b0;
		var lobbyControl = {bq: false, au: lobby.au, bJ: true, bS: false, ca: model.k.au, cm: false};
		return _Utils_Tuple2(
			_Utils_update(
				model,
				{
					b0: _Utils_update(
						n,
						{ci: lobby.au})
				}),
			A2(
				author$project$Network$Module$send,
				'lobbyControl',
				author$project$Network$Module$encodeLobbyControl(lobbyControl)));
	});
var author$project$Ui$Scenes$MainMenu$Update$leaveLobby = F2(
	function (model, lobby) {
		var n = model.b0;
		var lobbyControl = {bq: false, au: lobby.au, bJ: false, bS: true, ca: model.k.au, cm: false};
		return _Utils_Tuple2(
			_Utils_update(
				model,
				{
					b0: _Utils_update(
						n,
						{ci: ''})
				}),
			A2(
				author$project$Network$Module$send,
				'lobbyControl',
				author$project$Network$Module$encodeLobbyControl(lobbyControl)));
	});
var author$project$Ui$Scenes$MainMenu$Update$update = F2(
	function (msg, model) {
		switch (msg.$) {
			case 0:
				var gO = msg.b;
				return A2(author$project$Ui$Scenes$MainMenu$Update$changeCar, model, gO);
			case 1:
				var m = msg.b;
				return A2(author$project$Ui$Scenes$MainMenu$Update$changeMap, model, m);
			case 2:
				var name = msg.b;
				return A2(author$project$Ui$Scenes$MainMenu$Update$changeName, model, name);
			case 3:
				var c = msg.b;
				return A2(author$project$Ui$Scenes$MainMenu$Update$changePlayerCount, model, c);
			case 4:
				return author$project$Ui$Scenes$MainMenu$Update$changeGameType(model);
			case 5:
				var lobby = msg.b;
				return A2(author$project$Ui$Scenes$MainMenu$Update$joinLobby, model, lobby);
			default:
				var lobby = msg.b;
				return A2(author$project$Ui$Scenes$MainMenu$Update$leaveLobby, model, lobby);
		}
	});
var author$project$Ui$Scenes$MainMenu$Module$update = author$project$Ui$Scenes$MainMenu$Update$update;
var author$project$Ui$Scenes$Update$changeTo = F2(
	function (model, state) {
		return Janiczek$cmd_extra$Cmd$Extra$withNoCmd(
			_Utils_update(
				model,
				{aW: state}));
	});
var author$project$Ui$Scenes$Update$update = F2(
	function (msg, model) {
		var m = msg.a;
		var s = msg.b;
		return A2(author$project$Ui$Scenes$Update$changeTo, m, s);
	});
var author$project$Ui$Scenes$Module$update = F2(
	function (msg, model) {
		return A2(author$project$Ui$Scenes$Update$update, msg, model);
	});
var author$project$Ui$Scenes$Playground$Update$update = F2(
	function (msg, model) {
		if (msg.$ === 1) {
			var m = msg.a;
			return _Utils_Tuple2(
				_Utils_update(
					model,
					{bk: !m.bk}),
				elm$core$Platform$Cmd$none);
		} else {
			return _Utils_Tuple2(model, elm$core$Platform$Cmd$none);
		}
	});
var author$project$Ui$Scenes$Playground$Module$update = author$project$Ui$Scenes$Playground$Update$update;
var author$project$Main$update = F2(
	function (msg, model) {
		switch (msg.$) {
			case 9:
				return model.b0.b_ ? A2(
					Janiczek$cmd_extra$Cmd$Extra$withCmd,
					A2(
						author$project$Network$Module$send,
						'lobby',
						author$project$Network$Module$encodeLobby(model.b7)),
					author$project$Network$Module$updateTtl(model)) : Janiczek$cmd_extra$Cmd$Extra$withNoCmd(model);
			case 10:
				return A2(
					Janiczek$cmd_extra$Cmd$Extra$withCmd,
					A2(
						author$project$Network$Module$send,
						'player',
						author$project$Network$Module$encodePlayer(model.k)),
					model);
			case 6:
				return Janiczek$cmd_extra$Cmd$Extra$withNoCmd(
					author$project$Objects$Physics$update(
						author$project$Control$Player$update(
							author$project$Network$Module$updateTtl(
								author$project$Map$Track$Module$update(model)))));
			case 5:
				var event = msg.b;
				var action = msg.c;
				return A3(author$project$Control$Module$update, event, action, model);
			case 4:
				var m = msg.a;
				return A2(author$project$Ui$Scenes$Playground$Module$update, m, model);
			case 1:
				var m = msg.a;
				return A2(author$project$Ui$Scenes$MainMenu$Module$update, m, model);
			case 2:
				var m = msg.a;
				return A2(author$project$Ui$Scenes$FinishMenu$Module$update, m, model);
			case 3:
				var m = msg.a;
				return A2(author$project$Ui$Scenes$Module$update, m, model);
			case 7:
				var m = msg.a;
				return A2(author$project$Network$Module$update, m, model);
			case 8:
				var t = msg.a;
				var uuid = msg.b;
				var p = model.k;
				var n = model.b0;
				var l = model.b7;
				if (!t) {
					return Janiczek$cmd_extra$Cmd$Extra$withNoCmd(
						_Utils_update(
							model,
							{
								k: _Utils_update(
									p,
									{
										au: TSFoster$elm_uuid$UUID$toString(uuid)
									})
							}));
				} else {
					return Janiczek$cmd_extra$Cmd$Extra$withNoCmd(
						_Utils_update(
							model,
							{
								b0: _Utils_update(
									n,
									{
										ci: TSFoster$elm_uuid$UUID$toString(uuid)
									}),
								b7: _Utils_update(
									l,
									{
										au: TSFoster$elm_uuid$UUID$toString(uuid)
									})
							}));
				}
			default:
				return Janiczek$cmd_extra$Cmd$Extra$withNoCmd(model);
		}
	});
var author$project$Ui$Scenes$FinishMenu$Update$restoreInitialModel = author$project$InitialModel$initialModel;
var author$project$Ui$Scenes$FinishMenu$View$getDriveTimeSeconds = function (time) {
	return (!time) ? 0 : ((time / 1000) | 0);
};
var author$project$Ui$Scenes$FinishMenu$View$getDriveTimeMilliSeconds = function (time) {
	if (!time) {
		return '0';
	} else {
		var ms = elm$core$String$fromInt(
			elm$core$Basics$round(
				(time - (author$project$Ui$Scenes$FinishMenu$View$getDriveTimeSeconds(time) * 1000)) / 10));
		return (elm$core$String$length(ms) === 1) ? ('0' + ms) : ms;
	}
};
var elm$virtual_dom$VirtualDom$style = _VirtualDom_style;
var elm$html$Html$Attributes$style = elm$virtual_dom$VirtualDom$style;
var author$project$Ui$Scenes$Style$selectionContainer = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'display', 'flex'),
		A2(elm$html$Html$Attributes$style, 'align-self', 'stretch'),
		A2(elm$html$Html$Attributes$style, 'flex-direction', 'column'),
		A2(elm$html$Html$Attributes$style, 'align-items', 'center'),
		A2(elm$html$Html$Attributes$style, 'font-size', '14px'),
		A2(elm$html$Html$Attributes$style, 'background-color', 'rgba(255,255,255, 0.2)'),
		A2(elm$html$Html$Attributes$style, 'padding', '10px'),
		A2(elm$html$Html$Attributes$style, 'margin', '10px'),
		A2(elm$html$Html$Attributes$style, 'cursor', 'pointer')
	]);
var elm$core$List$any = F2(
	function (isOkay, list) {
		any:
		while (true) {
			if (!list.b) {
				return false;
			} else {
				var x = list.a;
				var xs = list.b;
				if (isOkay(x)) {
					return true;
				} else {
					var $temp$isOkay = isOkay,
						$temp$list = xs;
					isOkay = $temp$isOkay;
					list = $temp$list;
					continue any;
				}
			}
		}
	});
var elm$core$List$member = F2(
	function (x, xs) {
		return A2(
			elm$core$List$any,
			function (a) {
				return _Utils_eq(a, x);
			},
			xs);
	});
var elm$core$List$sortWith = _List_sortWith;
var elm$html$Html$div = _VirtualDom_node('div');
var elm$virtual_dom$VirtualDom$text = _VirtualDom_text;
var elm$html$Html$text = elm$virtual_dom$VirtualDom$text;
var author$project$Ui$Scenes$FinishMenu$View$highScoreList = function (model) {
	var sortFunction = F2(
		function (a, b) {
			var bRoundStr = elm$core$String$fromInt(b.bj);
			var bCheckpointsStr = elm$core$String$fromInt(
				elm$core$List$length(b.bd));
			var bValue = _Utils_ap(bRoundStr, bCheckpointsStr);
			var aRoundStr = elm$core$String$fromInt(a.bj);
			var aCheckpointsStr = elm$core$String$fromInt(
				elm$core$List$length(a.bd));
			var aValue = _Utils_ap(aRoundStr, aCheckpointsStr);
			var _n0 = A2(elm$core$Basics$compare, aValue, bValue);
			switch (_n0) {
				case 0:
					return 2;
				case 1:
					return 1;
				default:
					return 0;
			}
		});
	var playerList = A2(elm$core$List$cons, model.k, model.aF);
	var sortedList = A2(
		elm$core$List$sortWith,
		sortFunction,
		A2(
			elm$core$List$filter,
			function (x) {
				return A2(
					elm$core$List$member,
					x.au,
					A2(elm$core$List$cons, model.k.au, model.b7.aF));
			},
			playerList));
	var highScoreItem = function (p) {
		return A2(
			elm$html$Html$div,
			_Utils_ap(
				author$project$Ui$Scenes$Style$selectionContainer,
				_List_fromArray(
					[
						A2(elm$html$Html$Attributes$style, 'display', 'flex'),
						A2(elm$html$Html$Attributes$style, 'flex-direction', 'row'),
						A2(elm$html$Html$Attributes$style, 'cursor', 'normal')
					])),
			_List_fromArray(
				[
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							A2(elm$html$Html$Attributes$style, 'flex', '1')
						]),
					_List_fromArray(
						[
							elm$html$Html$text(p.bN.ct)
						])),
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							A2(elm$html$Html$Attributes$style, 'flex', '1')
						]),
					_List_fromArray(
						[
							elm$html$Html$text(
							elm$core$String$fromInt(
								author$project$Ui$Scenes$FinishMenu$View$getDriveTimeSeconds(p.aZ)) + (':' + (author$project$Ui$Scenes$FinishMenu$View$getDriveTimeMilliSeconds(p.aZ) + ' s')))
						]))
				]));
	};
	return A2(
		elm$html$Html$div,
		_List_Nil,
		A2(elm$core$List$map, highScoreItem, sortedList));
};
var author$project$Ui$Scenes$Style$button = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'padding', '30px'),
		A2(elm$html$Html$Attributes$style, 'background-color', '#f21d9c'),
		A2(elm$html$Html$Attributes$style, 'color', '#ffffff'),
		A2(elm$html$Html$Attributes$style, 'border-width', '0px'),
		A2(elm$html$Html$Attributes$style, 'font-size', '20px')
	]);
var author$project$Ui$Scenes$Style$centeredText = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'text-align', 'center')
	]);
var author$project$Ui$Scenes$Style$globalContainer = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'height', '100vh'),
		A2(elm$html$Html$Attributes$style, 'background-color', '#141617'),
		A2(elm$html$Html$Attributes$style, 'background-image', 'url(\'assets/backgroundMenu.svg\')')
	]);
var author$project$Ui$Scenes$Style$menuContainer = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'display', 'flex'),
		A2(elm$html$Html$Attributes$style, 'justify-content', 'flex-start'),
		A2(elm$html$Html$Attributes$style, 'align-items', 'center'),
		A2(elm$html$Html$Attributes$style, 'flex-direction', 'column')
	]);
var author$project$Ui$Scenes$Style$menuItem = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'flex-basis', '20%'),
		A2(elm$html$Html$Attributes$style, 'flex-grow', '0'),
		A2(elm$html$Html$Attributes$style, 'display', 'flex'),
		A2(elm$html$Html$Attributes$style, 'align-items', 'stretch'),
		A2(elm$html$Html$Attributes$style, 'flex-direction', 'column'),
		A2(elm$html$Html$Attributes$style, 'color', '#fff'),
		A2(elm$html$Html$Attributes$style, 'font-size', '25px'),
		A2(elm$html$Html$Attributes$style, 'font-family', 'Arial'),
		A2(elm$html$Html$Attributes$style, 'padding', '20px'),
		A2(elm$html$Html$Attributes$style, 'margin', '20px')
	]);
var author$project$Ui$Scenes$Style$menuItemLeft = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'background-color', '#763fdd'),
		A2(elm$html$Html$Attributes$style, 'transform', 'perspective(400px) rotateY(15deg) rotateX(5deg)')
	]);
var author$project$Ui$Scenes$Style$menuItemRight = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'background-color', '#E664DD'),
		A2(elm$html$Html$Attributes$style, 'transform', 'perspective(400px) rotateY(-15deg) rotateX(5deg)')
	]);
var author$project$Ui$Scenes$Style$spaceTop = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'margin-top', '20px')
	]);
var elm$html$Html$button = _VirtualDom_node('button');
var elm$html$Html$img = _VirtualDom_node('img');
var elm$html$Html$Attributes$stringProperty = F2(
	function (key, string) {
		return A2(
			_VirtualDom_property,
			key,
			elm$json$Json$Encode$string(string));
	});
var elm$html$Html$Attributes$src = function (url) {
	return A2(
		elm$html$Html$Attributes$stringProperty,
		'src',
		_VirtualDom_noJavaScriptOrHtmlUri(url));
};
var elm$virtual_dom$VirtualDom$Normal = function (a) {
	return {$: 0, a: a};
};
var elm$virtual_dom$VirtualDom$on = _VirtualDom_on;
var elm$html$Html$Events$on = F2(
	function (event, decoder) {
		return A2(
			elm$virtual_dom$VirtualDom$on,
			event,
			elm$virtual_dom$VirtualDom$Normal(decoder));
	});
var elm$html$Html$Events$onClick = function (msg) {
	return A2(
		elm$html$Html$Events$on,
		'click',
		elm$json$Json$Decode$succeed(msg));
};
var author$project$Ui$Scenes$FinishMenu$View$view = function (model) {
	return A2(
		elm$html$Html$div,
		_Utils_ap(author$project$Ui$Scenes$Style$globalContainer, author$project$Ui$Scenes$Style$menuContainer),
		_List_fromArray(
			[
				A2(
				elm$html$Html$img,
				_List_fromArray(
					[
						elm$html$Html$Attributes$src('assets/logo.png'),
						A2(elm$html$Html$Attributes$style, 'width', '70vh'),
						A2(elm$html$Html$Attributes$style, 'height', 'auto')
					]),
				_List_Nil),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						A2(elm$html$Html$Attributes$style, 'display', 'flex'),
						A2(elm$html$Html$Attributes$style, 'flex-direction', 'row'),
						A2(elm$html$Html$Attributes$style, 'width', '100%'),
						A2(elm$html$Html$Attributes$style, 'justify-content', 'center')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						_Utils_ap(
							author$project$Ui$Scenes$Style$menuItemLeft,
							_Utils_ap(author$project$Ui$Scenes$Style$menuItem, author$project$Ui$Scenes$Style$centeredText)),
						_List_fromArray(
							[
								elm$html$Html$text('YOUR TIME'),
								A2(
								elm$html$Html$div,
								author$project$Ui$Scenes$Style$spaceTop,
								_List_fromArray(
									[
										elm$html$Html$text(
										elm$core$String$fromInt(
											author$project$Ui$Scenes$FinishMenu$View$getDriveTimeSeconds(model.k.aZ))),
										elm$html$Html$text(':'),
										elm$html$Html$text(
										author$project$Ui$Scenes$FinishMenu$View$getDriveTimeMilliSeconds(model.k.aZ)),
										elm$html$Html$text(' seconds')
									]))
							])),
						A2(
						elm$html$Html$div,
						_Utils_ap(
							author$project$Ui$Scenes$Style$menuItem,
							_Utils_ap(author$project$Ui$Scenes$Style$centeredText, author$project$Ui$Scenes$Style$menuItemRight)),
						_List_fromArray(
							[
								elm$html$Html$text('COMPETITIVE POSITION'),
								A2(
								elm$html$Html$div,
								author$project$Ui$Scenes$Style$spaceTop,
								_List_fromArray(
									[
										author$project$Ui$Scenes$FinishMenu$View$highScoreList(model)
									]))
							]))
					])),
				A2(
				elm$html$Html$button,
				_Utils_ap(
					author$project$Ui$Scenes$Style$button,
					_List_fromArray(
						[
							elm$html$Html$Events$onClick(
							author$project$Types$SceneManager(
								A2(author$project$Types$ChangeTo, author$project$Ui$Scenes$FinishMenu$Update$restoreInitialModel, 0)))
						])),
				_List_fromArray(
					[
						elm$html$Html$text('Back to Menu')
					]))
			]));
};
var author$project$Ui$Scenes$FinishMenu$Module$view = author$project$Ui$Scenes$FinishMenu$View$view;
var author$project$Types$ChangeName = F2(
	function (a, b) {
		return {$: 2, a: a, b: b};
	});
var author$project$Types$MainMenu = function (a) {
	return {$: 1, a: a};
};
var author$project$Types$ChangeCar = F2(
	function (a, b) {
		return {$: 0, a: a, b: b};
	});
var author$project$Ui$Scenes$MainMenu$Style$carSelectionInnerContainer = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'font-size', '20px'),
		A2(elm$html$Html$Attributes$style, 'display', 'flex'),
		A2(elm$html$Html$Attributes$style, 'justify-content', 'space-between'),
		A2(elm$html$Html$Attributes$style, 'width', '100%')
	]);
var author$project$Ui$Scenes$MainMenu$CarPicker$renderCars = F2(
	function (l, model) {
		var renderCar = function (car) {
			var checkSelection = _Utils_eq(car.au, model.k.S.au) ? _List_fromArray(
				[
					A2(elm$html$Html$Attributes$style, 'background-color', 'rgba(255,255,255, 0.4)')
				]) : _List_Nil;
			return A2(
				elm$html$Html$div,
				_Utils_ap(
					author$project$Ui$Scenes$Style$selectionContainer,
					_Utils_ap(
						_List_fromArray(
							[
								elm$html$Html$Events$onClick(
								author$project$Types$MainMenu(
									A2(author$project$Types$ChangeCar, model, car)))
							]),
						checkSelection)),
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						author$project$Ui$Scenes$MainMenu$Style$carSelectionInnerContainer,
						_List_fromArray(
							[
								A2(
								elm$html$Html$div,
								_List_Nil,
								_List_fromArray(
									[
										elm$html$Html$text(car.au)
									])),
								A2(
								elm$html$Html$img,
								_List_fromArray(
									[
										elm$html$Html$Attributes$src(car.ck),
										A2(elm$html$Html$Attributes$style, 'height', '25px')
									]),
								_List_Nil)
							]))
					]));
		};
		if (!l.b) {
			return _List_Nil;
		} else {
			var x = l.a;
			var xs = l.b;
			return A2(
				elm$core$List$cons,
				renderCar(x),
				A2(author$project$Ui$Scenes$MainMenu$CarPicker$renderCars, xs, model));
		}
	});
var author$project$Ui$Scenes$MainMenu$CarPicker$view = function (model) {
	return A2(author$project$Ui$Scenes$MainMenu$CarPicker$renderCars, model.a8, model);
};
var author$project$Types$ChangeGameType = function (a) {
	return {$: 4, a: a};
};
var author$project$Types$ChangePlayerCount = F2(
	function (a, b) {
		return {$: 3, a: a, b: b};
	});
var author$project$Ui$Scenes$MainMenu$Style$input = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'flex', '1'),
		A2(elm$html$Html$Attributes$style, 'font-size', '18px'),
		A2(elm$html$Html$Attributes$style, 'color', '#fff'),
		A2(elm$html$Html$Attributes$style, 'background-color', 'transparent'),
		A2(elm$html$Html$Attributes$style, 'border', '0px solid #fff'),
		A2(elm$html$Html$Attributes$style, 'border-bottom', '1px solid rgba(255,255,255,0.5)')
	]);
var elm$html$Html$input = _VirtualDom_node('input');
var elm$html$Html$label = _VirtualDom_node('label');
var elm$html$Html$Attributes$type_ = elm$html$Html$Attributes$stringProperty('type');
var elm$html$Html$Attributes$value = elm$html$Html$Attributes$stringProperty('value');
var elm$html$Html$Events$alwaysStop = function (x) {
	return _Utils_Tuple2(x, true);
};
var elm$virtual_dom$VirtualDom$MayStopPropagation = function (a) {
	return {$: 1, a: a};
};
var elm$html$Html$Events$stopPropagationOn = F2(
	function (event, decoder) {
		return A2(
			elm$virtual_dom$VirtualDom$on,
			event,
			elm$virtual_dom$VirtualDom$MayStopPropagation(decoder));
	});
var elm$json$Json$Decode$at = F2(
	function (fields, decoder) {
		return A3(elm$core$List$foldr, elm$json$Json$Decode$field, decoder, fields);
	});
var elm$html$Html$Events$targetValue = A2(
	elm$json$Json$Decode$at,
	_List_fromArray(
		['target', 'value']),
	elm$json$Json$Decode$string);
var elm$html$Html$Events$onInput = function (tagger) {
	return A2(
		elm$html$Html$Events$stopPropagationOn,
		'input',
		A2(
			elm$json$Json$Decode$map,
			elm$html$Html$Events$alwaysStop,
			A2(elm$json$Json$Decode$map, tagger, elm$html$Html$Events$targetValue)));
};
var author$project$Ui$Scenes$MainMenu$GameOptions$view = function (model) {
	var multiplayer = model.b0.b_ ? 'true' : 'false';
	return A2(
		elm$html$Html$div,
		_Utils_ap(
			author$project$Ui$Scenes$Style$selectionContainer,
			_Utils_ap(
				author$project$Ui$Scenes$Style$spaceTop,
				_List_fromArray(
					[
						A2(elm$html$Html$Attributes$style, 'cursor', 'default'),
						A2(elm$html$Html$Attributes$style, 'display', 'flex'),
						A2(elm$html$Html$Attributes$style, 'flex-direction', 'row')
					]))),
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						A2(elm$html$Html$Attributes$style, 'flex', '1')
					]),
				_List_fromArray(
					[
						A2(
						elm$html$Html$label,
						_List_fromArray(
							[
								A2(elm$html$Html$Attributes$style, 'padding', '20px')
							]),
						_List_fromArray(
							[
								A2(
								elm$html$Html$input,
								_List_fromArray(
									[
										elm$html$Html$Attributes$type_('checkbox'),
										elm$html$Html$Events$onClick(
										author$project$Types$MainMenu(
											author$project$Types$ChangeGameType(model))),
										elm$html$Html$Attributes$value(multiplayer)
									]),
								_List_Nil),
								elm$html$Html$text('Multiplayer')
							]))
					])),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						A2(elm$html$Html$Attributes$style, 'flex', '1')
					]),
				_List_fromArray(
					[
						elm$html$Html$text('Max. Player'),
						A2(
						elm$html$Html$input,
						_Utils_ap(
							author$project$Ui$Scenes$MainMenu$Style$input,
							_List_fromArray(
								[
									elm$html$Html$Attributes$value(
									elm$core$String$fromInt(model.b7.bX)),
									elm$html$Html$Events$onInput(
									function (x) {
										return author$project$Types$MainMenu(
											A2(author$project$Types$ChangePlayerCount, model, x));
									})
								])),
						_List_Nil)
					]))
			]));
};
var author$project$Types$JoinLobby = F2(
	function (a, b) {
		return {$: 5, a: a, b: b};
	});
var author$project$Types$LeaveLobby = F2(
	function (a, b) {
		return {$: 6, a: a, b: b};
	});
var author$project$Ui$Scenes$MainMenu$LobbyPicker$lobbyAction = F2(
	function (model, lobby) {
		return _Utils_eq(model.b0.ci, lobby.au) ? author$project$Types$MainMenu(
			A2(author$project$Types$LeaveLobby, model, lobby)) : author$project$Types$MainMenu(
			A2(author$project$Types$JoinLobby, model, lobby));
	});
var elm$html$Html$Attributes$width = function (n) {
	return A2(
		_VirtualDom_attribute,
		'width',
		elm$core$String$fromInt(n));
};
var author$project$Ui$Scenes$MainMenu$LobbyPicker$lobbyListEmpty = function (l) {
	return (!elm$core$List$length(l)) ? A2(
		elm$html$Html$div,
		_Utils_ap(
			author$project$Ui$Scenes$Style$selectionContainer,
			_List_fromArray(
				[
					A2(elm$html$Html$Attributes$style, 'display', 'flex'),
					A2(elm$html$Html$Attributes$style, 'flex-direction', 'column'),
					A2(elm$html$Html$Attributes$style, 'cursor', 'normal')
				])),
		_List_fromArray(
			[
				A2(
				elm$html$Html$img,
				_List_fromArray(
					[
						elm$html$Html$Attributes$src('assets/wheel.gif'),
						elm$html$Html$Attributes$width(80)
					]),
				_List_Nil),
				elm$html$Html$text('Searching ...')
			])) : A2(elm$html$Html$div, _List_Nil, _List_Nil);
};
var author$project$Ui$Scenes$MainMenu$LobbyPicker$renderLoadingAnimation = F2(
	function (model, lobby) {
		return _Utils_eq(model.b0.ci, lobby.au) ? _List_fromArray(
			[
				A2(
				elm$html$Html$img,
				_List_fromArray(
					[
						elm$html$Html$Attributes$src('assets/wheel.gif'),
						elm$html$Html$Attributes$width(60)
					]),
				_List_Nil)
			]) : _List_Nil;
	});
var author$project$Ui$Scenes$MainMenu$LobbyPicker$view = function (model) {
	var renderLobby = function (lobby) {
		return A2(
			elm$html$Html$div,
			_Utils_ap(
				author$project$Ui$Scenes$Style$selectionContainer,
				_List_fromArray(
					[
						A2(elm$html$Html$Attributes$style, 'display', 'flex'),
						A2(elm$html$Html$Attributes$style, 'flex-direction', 'row'),
						elm$html$Html$Events$onClick(
						A2(author$project$Ui$Scenes$MainMenu$LobbyPicker$lobbyAction, model, lobby))
					])),
			_List_fromArray(
				[
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							A2(elm$html$Html$Attributes$style, 'flex', '20')
						]),
					_List_fromArray(
						[
							elm$html$Html$text(
							lobby.ay + (' #' + (A3(elm$core$String$slice, 0, 4, lobby.au) + (' (' + (elm$core$String$fromInt(
								elm$core$List$length(lobby.aF)) + (' / ' + (elm$core$String$fromInt(lobby.bX) + ')')))))))
						])),
					A2(
					elm$html$Html$div,
					_List_fromArray(
						[
							A2(elm$html$Html$Attributes$style, 'flex', '1')
						]),
					A2(author$project$Ui$Scenes$MainMenu$LobbyPicker$renderLoadingAnimation, model, lobby))
				]));
	};
	var renderLobbies = function (l) {
		if (!l.b) {
			return _List_Nil;
		} else {
			var x = l.a;
			var xs = l.b;
			return A2(
				elm$core$List$cons,
				renderLobby(x),
				renderLobbies(xs));
		}
	};
	return A2(
		elm$html$Html$div,
		_List_Nil,
		A2(
			elm$core$List$cons,
			author$project$Ui$Scenes$MainMenu$LobbyPicker$lobbyListEmpty(
				A2(
					elm$core$List$filter,
					function (lobby) {
						return _Utils_eq(lobby.ay, model.ay.bZ.b$) && (!lobby.ch);
					},
					model.b0.bV)),
			renderLobbies(
				A2(
					elm$core$List$filter,
					function (lobby) {
						return _Utils_eq(lobby.ay, model.ay.bZ.b$) && (!lobby.ch);
					},
					model.b0.bV))));
};
var author$project$Types$ChangeMap = F2(
	function (a, b) {
		return {$: 1, a: a, b: b};
	});
var author$project$Ui$Scenes$MainMenu$MapPicker$renderMaps = F2(
	function (l, model) {
		var renderMap = function (map) {
			var checkSelection = _Utils_eq(map.bZ.b$, model.ay.bZ.b$) ? _List_fromArray(
				[
					A2(elm$html$Html$Attributes$style, 'background-color', 'rgba(255,255,255, 0.4)')
				]) : _List_Nil;
			return A2(
				elm$html$Html$div,
				_Utils_ap(
					author$project$Ui$Scenes$Style$selectionContainer,
					_Utils_ap(
						_List_fromArray(
							[
								elm$html$Html$Events$onClick(
								author$project$Types$MainMenu(
									A2(author$project$Types$ChangeMap, model, map)))
							]),
						checkSelection)),
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								A2(elm$html$Html$Attributes$style, 'font-size', '20px')
							]),
						_List_fromArray(
							[
								elm$html$Html$text(map.bZ.b$)
							])),
						A2(
						elm$html$Html$div,
						_List_Nil,
						_List_fromArray(
							[
								elm$html$Html$text(map.bZ.bm)
							]))
					]));
		};
		if (!l.b) {
			return _List_Nil;
		} else {
			var x = l.a;
			var xs = l.b;
			return A2(
				elm$core$List$cons,
				renderMap(x),
				A2(author$project$Ui$Scenes$MainMenu$MapPicker$renderMaps, xs, model));
		}
	});
var author$project$Ui$Scenes$MainMenu$MapPicker$view = function (model) {
	return A2(author$project$Ui$Scenes$MainMenu$MapPicker$renderMaps, model.a9, model);
};
var author$project$Ui$Scenes$MainMenu$Style$logo = _List_fromArray(
	[
		elm$html$Html$Attributes$src('assets/logo.png'),
		A2(elm$html$Html$Attributes$style, 'width', '70vh'),
		A2(elm$html$Html$Attributes$style, 'height', 'auto')
	]);
var author$project$Ui$Scenes$MainMenu$Style$menuItemContainer = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'display', 'flex'),
		A2(elm$html$Html$Attributes$style, 'flex-direction', 'row'),
		A2(elm$html$Html$Attributes$style, 'width', '100%'),
		A2(elm$html$Html$Attributes$style, 'justify-content', 'center')
	]);
var elm$html$Html$Attributes$boolProperty = F2(
	function (key, bool) {
		return A2(
			_VirtualDom_property,
			key,
			elm$json$Json$Encode$bool(bool));
	});
var elm$html$Html$Attributes$disabled = elm$html$Html$Attributes$boolProperty('disabled');
var author$project$Ui$Scenes$MainMenu$View$showStartButton = function (model) {
	return (!model.b0.b_) ? A2(
		elm$html$Html$button,
		_Utils_ap(
			author$project$Ui$Scenes$Style$button,
			_List_fromArray(
				[
					elm$html$Html$Events$onClick(
					author$project$Types$SceneManager(
						A2(author$project$Types$ChangeTo, model, 3))),
					elm$html$Html$Attributes$disabled(model.b0.b_)
				])),
		_List_fromArray(
			[
				elm$html$Html$text('Start the engines')
			])) : A2(elm$html$Html$div, _List_Nil, _List_Nil);
};
var author$project$Ui$Scenes$Style$spaceBottom = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'margin-bottom', '20px')
	]);
var elm$html$Html$Attributes$placeholder = elm$html$Html$Attributes$stringProperty('placeholder');
var author$project$Ui$Scenes$MainMenu$View$view = function (model) {
	var menuItemPlayerOptions = A2(
		elm$html$Html$div,
		_Utils_ap(author$project$Ui$Scenes$Style$menuItemRight, author$project$Ui$Scenes$Style$menuItem),
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				author$project$Ui$Scenes$Style$centeredText,
				_List_fromArray(
					[
						elm$html$Html$text('DRIVERS NAME')
					])),
				A2(
				elm$html$Html$div,
				_Utils_ap(
					_List_fromArray(
						[
							A2(elm$html$Html$Attributes$style, 'display', 'flex')
						]),
					author$project$Ui$Scenes$Style$spaceTop),
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								A2(elm$html$Html$Attributes$style, 'flex', '1')
							]),
						_List_Nil),
						A2(
						elm$html$Html$input,
						_Utils_ap(
							author$project$Ui$Scenes$MainMenu$Style$input,
							_List_fromArray(
								[
									elm$html$Html$Attributes$placeholder('Unnamed Driver'),
									elm$html$Html$Attributes$value(model.k.bN.ct),
									elm$html$Html$Events$onInput(
									function (x) {
										return author$project$Types$MainMenu(
											A2(author$project$Types$ChangeName, model, x));
									})
								])),
						_List_Nil),
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								A2(elm$html$Html$Attributes$style, 'flex', '1')
							]),
						_List_Nil)
					])),
				author$project$Ui$Scenes$MainMenu$GameOptions$view(model),
				author$project$Ui$Scenes$MainMenu$LobbyPicker$view(model)
			]));
	var menuItemGameOptions = A2(
		elm$html$Html$div,
		_Utils_ap(author$project$Ui$Scenes$Style$menuItemLeft, author$project$Ui$Scenes$Style$menuItem),
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				author$project$Ui$Scenes$Style$centeredText,
				_List_fromArray(
					[
						elm$html$Html$text('CHOOSE A TRACK')
					])),
				A2(
				elm$html$Html$div,
				_Utils_ap(author$project$Ui$Scenes$Style$spaceTop, author$project$Ui$Scenes$Style$spaceBottom),
				author$project$Ui$Scenes$MainMenu$MapPicker$view(model)),
				A2(
				elm$html$Html$div,
				author$project$Ui$Scenes$Style$centeredText,
				_List_fromArray(
					[
						elm$html$Html$text('CHOOSE A VEHICLE')
					])),
				A2(
				elm$html$Html$div,
				author$project$Ui$Scenes$Style$spaceTop,
				author$project$Ui$Scenes$MainMenu$CarPicker$view(model))
			]));
	return A2(
		elm$html$Html$div,
		_Utils_ap(author$project$Ui$Scenes$Style$globalContainer, author$project$Ui$Scenes$Style$menuContainer),
		_List_fromArray(
			[
				A2(elm$html$Html$img, author$project$Ui$Scenes$MainMenu$Style$logo, _List_Nil),
				A2(
				elm$html$Html$div,
				author$project$Ui$Scenes$MainMenu$Style$menuItemContainer,
				_List_fromArray(
					[menuItemGameOptions, menuItemPlayerOptions])),
				author$project$Ui$Scenes$MainMenu$View$showStartButton(model)
			]));
};
var elm$svg$Svg$trustedNode = _VirtualDom_nodeNS('http://www.w3.org/2000/svg');
var elm$svg$Svg$rect = elm$svg$Svg$trustedNode('rect');
var elm$svg$Svg$Attributes$fillOpacity = _VirtualDom_attribute('fill-opacity');
var elm$svg$Svg$Attributes$height = _VirtualDom_attribute('height');
var elm$svg$Svg$Attributes$stroke = _VirtualDom_attribute('stroke');
var elm$svg$Svg$Attributes$width = _VirtualDom_attribute('width');
var elm$svg$Svg$Attributes$x = _VirtualDom_attribute('x');
var elm$svg$Svg$Attributes$y = _VirtualDom_attribute('y');
var author$project$Objects$Render$collider = F2(
	function (g, p) {
		var collisionDetected = F2(
			function (gO1, gO2) {
				return (!_Utils_eq(
					A2(
						author$project$Objects$Physics$checkCollision,
						gO1,
						_List_fromArray(
							[gO2])),
					_List_fromArray(
						[gO2]))) ? 'green' : 'red';
			});
		if (!g.$) {
			var gO = g.a;
			var _n1 = gO.cc;
			if (!_n1.$) {
				var pos = _n1.a;
				var _n2 = gO.bg;
				if (!_n2.$) {
					var c = _n2.a;
					if (!c.$) {
						var r = c.a;
						return _List_fromArray(
							[
								A2(
								elm$svg$Svg$rect,
								_List_fromArray(
									[
										elm$svg$Svg$Attributes$width(
										elm$core$String$fromInt(r.cD)),
										elm$svg$Svg$Attributes$height(
										elm$core$String$fromInt(r.bC)),
										elm$svg$Svg$Attributes$x(
										elm$core$String$fromInt(pos.a2 + r.cc.a2)),
										elm$svg$Svg$Attributes$y(
										elm$core$String$fromInt(pos.a3 + r.cc.a3)),
										elm$svg$Svg$Attributes$stroke(
										A2(collisionDetected, p, gO)),
										elm$svg$Svg$Attributes$fillOpacity('0')
									]),
								_List_Nil)
							]);
					} else {
						return _List_Nil;
					}
				} else {
					return _List_Nil;
				}
			} else {
				return _List_Nil;
			}
		} else {
			return _List_Nil;
		}
	});
var elm$svg$Svg$text = elm$virtual_dom$VirtualDom$text;
var elm$svg$Svg$text_ = elm$svg$Svg$trustedNode('text');
var elm$svg$Svg$Attributes$fill = _VirtualDom_attribute('fill');
var elm$svg$Svg$Attributes$fontFamily = _VirtualDom_attribute('font-family');
var elm$svg$Svg$Attributes$fontSize = _VirtualDom_attribute('font-size');
var elm$svg$Svg$Attributes$textAnchor = _VirtualDom_attribute('text-anchor');
var author$project$Objects$Render$player = F2(
	function (p, labelsEnabled) {
		var renderLabel = function () {
			if (!labelsEnabled) {
				return _List_Nil;
			} else {
				if (p.bN.cB) {
					var _n0 = p.S.cc;
					if (!_n0.$) {
						var pos = _n0.a;
						return _List_fromArray(
							[
								A2(
								elm$svg$Svg$text_,
								_List_fromArray(
									[
										elm$svg$Svg$Attributes$x(
										elm$core$String$fromInt(pos.a2 + ((p.S.cj.cD / 2) | 0))),
										elm$svg$Svg$Attributes$y(
										elm$core$String$fromInt(pos.a3 - 10)),
										elm$svg$Svg$Attributes$fontFamily('Arial'),
										elm$svg$Svg$Attributes$fill(p.bN.bh),
										elm$svg$Svg$Attributes$stroke('#000'),
										elm$svg$Svg$Attributes$fontSize(
										elm$core$String$fromInt(p.bN.cj)),
										elm$svg$Svg$Attributes$textAnchor('middle')
									]),
								_List_fromArray(
									[
										elm$svg$Svg$text(p.bN.ct)
									]))
							]);
					} else {
						return _List_Nil;
					}
				} else {
					return _List_Nil;
				}
			}
		}();
		return renderLabel;
	});
var elm$core$String$fromFloat = _String_fromNumber;
var elm$svg$Svg$image = elm$svg$Svg$trustedNode('image');
var elm$svg$Svg$Attributes$transform = _VirtualDom_attribute('transform');
var elm$svg$Svg$Attributes$xlinkHref = function (value) {
	return A3(
		_VirtualDom_attributeNS,
		'http://www.w3.org/1999/xlink',
		'xlink:href',
		_VirtualDom_noJavaScriptUri(value));
};
var author$project$Objects$Render$playground = F5(
	function (l, p, minimapMode, debug, labelsEnabled) {
		playground:
		while (true) {
			var getSprite = function (gO) {
				if (minimapMode) {
					var _n2 = gO.cl;
					if (!_n2.$) {
						var a = _n2.a;
						return a;
					} else {
						return '';
					}
				} else {
					return gO.ck;
				}
			};
			var getCollider = function (gO) {
				return debug ? elm$core$Maybe$Just(gO) : elm$core$Maybe$Nothing;
			};
			if (!l.b) {
				return _List_Nil;
			} else {
				var x = l.a;
				var xs = l.b;
				var _n1 = x.cc;
				if (_n1.$ === 1) {
					var $temp$l = xs,
						$temp$p = p,
						$temp$minimapMode = minimapMode,
						$temp$debug = debug,
						$temp$labelsEnabled = labelsEnabled;
					l = $temp$l;
					p = $temp$p;
					minimapMode = $temp$minimapMode;
					debug = $temp$debug;
					labelsEnabled = $temp$labelsEnabled;
					continue playground;
				} else {
					var posX = _n1.a;
					return _Utils_ap(
						_List_fromArray(
							[
								A2(
								elm$svg$Svg$image,
								_List_fromArray(
									[
										elm$svg$Svg$Attributes$xlinkHref(
										getSprite(x)),
										elm$svg$Svg$Attributes$width(
										elm$core$String$fromInt(x.cj.cD)),
										elm$svg$Svg$Attributes$height(
										elm$core$String$fromInt(x.cj.bC)),
										elm$svg$Svg$Attributes$x(
										elm$core$String$fromInt(posX.a2)),
										elm$svg$Svg$Attributes$y(
										elm$core$String$fromInt(posX.a3)),
										elm$svg$Svg$Attributes$transform(
										' rotate(' + (elm$core$String$fromFloat(x.ae) + (' ' + (elm$core$String$fromFloat(posX.a2 + (x.cj.cD / 2)) + (' ' + (elm$core$String$fromFloat(posX.a3 + (x.cj.bC / 2)) + ')'))))))
									]),
								_List_Nil)
							]),
						_Utils_ap(
							A2(
								author$project$Objects$Render$collider,
								getCollider(x),
								p.S),
							_Utils_ap(
								A5(author$project$Objects$Render$playground, xs, p, minimapMode, debug, labelsEnabled),
								A2(author$project$Objects$Render$player, p, labelsEnabled))));
				}
			}
		}
	});
var author$project$Objects$Module$render = {bg: author$project$Objects$Render$collider, b9: author$project$Objects$Render$player, cb: author$project$Objects$Render$playground};
var author$project$Types$ChangeColliderVisibility = function (a) {
	return {$: 1, a: a};
};
var author$project$Types$Playground = function (a) {
	return {$: 4, a: a};
};
var author$project$Ui$Scenes$Playground$Cockpit$minimapMode = true;
var author$project$Ui$Scenes$Playground$Cockpit$showCollider = false;
var author$project$Ui$Scenes$Playground$Cockpit$showLabels = true;
var author$project$Ui$Scenes$Playground$Speedometer$height = 200;
var author$project$Ui$Scenes$Playground$Speedometer$width = 200;
var author$project$Ui$Scenes$Playground$Speedometer$outerBorderWidth = (author$project$Ui$Scenes$Playground$Speedometer$width / 50) | 0;
var author$project$Ui$Scenes$Playground$Speedometer$centerX = author$project$Ui$Scenes$Playground$Speedometer$width / 2;
var author$project$Ui$Scenes$Playground$Speedometer$centerY = author$project$Ui$Scenes$Playground$Speedometer$height / 2;
var author$project$Ui$Scenes$Playground$Speedometer$centeredCircleRadius = (author$project$Ui$Scenes$Playground$Speedometer$width / 20) | 0;
var author$project$Ui$Scenes$Playground$Speedometer$radius = author$project$Ui$Scenes$Playground$Speedometer$width / 2;
var elm$svg$Svg$circle = elm$svg$Svg$trustedNode('circle');
var elm$svg$Svg$line = elm$svg$Svg$trustedNode('line');
var elm$svg$Svg$Attributes$cx = _VirtualDom_attribute('cx');
var elm$svg$Svg$Attributes$cy = _VirtualDom_attribute('cy');
var elm$svg$Svg$Attributes$r = _VirtualDom_attribute('r');
var elm$svg$Svg$Attributes$strokeWidth = _VirtualDom_attribute('stroke-width');
var elm$svg$Svg$Attributes$x1 = _VirtualDom_attribute('x1');
var elm$svg$Svg$Attributes$x2 = _VirtualDom_attribute('x2');
var elm$svg$Svg$Attributes$y1 = _VirtualDom_attribute('y1');
var elm$svg$Svg$Attributes$y2 = _VirtualDom_attribute('y2');
var author$project$Ui$Scenes$Playground$Speedometer$pin = F5(
	function (speed, minSpeed, maxSpeed, startAngle, endAngle) {
		var calcSpeedDegree = function () {
			var calcSpeedPercent = (speed * 100) / (maxSpeed - minSpeed);
			return (((endAngle - startAngle) * calcSpeedPercent) / 100) - 100;
		}();
		return _List_fromArray(
			[
				A2(
				elm$svg$Svg$line,
				_List_fromArray(
					[
						elm$svg$Svg$Attributes$stroke('#c91616'),
						elm$svg$Svg$Attributes$strokeWidth(
						elm$core$String$fromInt((author$project$Ui$Scenes$Playground$Speedometer$width / 25) | 0)),
						elm$svg$Svg$Attributes$x1(
						elm$core$String$fromFloat(author$project$Ui$Scenes$Playground$Speedometer$centerX)),
						elm$svg$Svg$Attributes$y1(
						elm$core$String$fromFloat(author$project$Ui$Scenes$Playground$Speedometer$centerY)),
						elm$svg$Svg$Attributes$x2(
						elm$core$String$fromInt(
							elm$core$Basics$round(
								author$project$Ui$Scenes$Playground$Speedometer$centerX + ((elm$core$Basics$sin(
									elm$core$Basics$degrees(calcSpeedDegree)) * author$project$Ui$Scenes$Playground$Speedometer$radius) * 0.75)))),
						elm$svg$Svg$Attributes$y2(
						elm$core$String$fromInt(
							elm$core$Basics$round(
								author$project$Ui$Scenes$Playground$Speedometer$centerY - ((elm$core$Basics$cos(
									elm$core$Basics$degrees(calcSpeedDegree)) * author$project$Ui$Scenes$Playground$Speedometer$radius) * 0.75))))
					]),
				_List_Nil),
				A2(
				elm$svg$Svg$circle,
				_List_fromArray(
					[
						elm$svg$Svg$Attributes$cx(
						elm$core$String$fromInt(
							elm$core$Basics$round(author$project$Ui$Scenes$Playground$Speedometer$centerX))),
						elm$svg$Svg$Attributes$cy(
						elm$core$String$fromInt(
							elm$core$Basics$round(author$project$Ui$Scenes$Playground$Speedometer$centerY))),
						elm$svg$Svg$Attributes$r(
						elm$core$String$fromInt(author$project$Ui$Scenes$Playground$Speedometer$centeredCircleRadius)),
						elm$svg$Svg$Attributes$fill('#af1616')
					]),
				_List_Nil)
			]);
	});
var author$project$Ui$Scenes$Playground$Speedometer$valueStrokes = F2(
	function (min, max) {
		var strokeLength = 10;
		var generateStrokes = F4(
			function (list, sWidth, sLength, sColor) {
				if (list.b) {
					var px = list.a;
					var pxs = list.b;
					return _Utils_ap(
						_List_fromArray(
							[
								A2(
								elm$svg$Svg$line,
								_List_fromArray(
									[
										elm$svg$Svg$Attributes$stroke(sColor),
										elm$svg$Svg$Attributes$strokeWidth(
										elm$core$String$fromInt(sWidth)),
										elm$svg$Svg$Attributes$x1(
										elm$core$String$fromInt(
											elm$core$Basics$round(
												author$project$Ui$Scenes$Playground$Speedometer$centerX + (elm$core$Basics$sin(
													elm$core$Basics$degrees(px)) * (author$project$Ui$Scenes$Playground$Speedometer$radius - sLength))))),
										elm$svg$Svg$Attributes$y1(
										elm$core$String$fromInt(
											elm$core$Basics$round(
												author$project$Ui$Scenes$Playground$Speedometer$centerY - (elm$core$Basics$cos(
													elm$core$Basics$degrees(px)) * (author$project$Ui$Scenes$Playground$Speedometer$radius - sLength))))),
										elm$svg$Svg$Attributes$x2(
										elm$core$String$fromInt(
											elm$core$Basics$round(
												author$project$Ui$Scenes$Playground$Speedometer$centerX + (elm$core$Basics$sin(
													elm$core$Basics$degrees(px)) * (author$project$Ui$Scenes$Playground$Speedometer$radius - author$project$Ui$Scenes$Playground$Speedometer$outerBorderWidth))))),
										elm$svg$Svg$Attributes$y2(
										elm$core$String$fromInt(
											elm$core$Basics$round(
												author$project$Ui$Scenes$Playground$Speedometer$centerY - (elm$core$Basics$cos(
													elm$core$Basics$degrees(px)) * (author$project$Ui$Scenes$Playground$Speedometer$radius - author$project$Ui$Scenes$Playground$Speedometer$outerBorderWidth)))))
									]),
								_List_Nil)
							]),
						A4(generateStrokes, pxs, sWidth, sLength, sColor));
				} else {
					return _List_Nil;
				}
			});
		var angleList = F3(
			function (counter, interval, stop) {
				return (_Utils_cmp(counter + interval, stop + interval) < 1) ? A2(
					elm$core$List$cons,
					counter,
					A3(angleList, counter + interval, interval, stop)) : _List_Nil;
			});
		return _Utils_ap(
			A4(
				generateStrokes,
				A3(angleList, -100, 40, 100),
				5,
				30,
				'#c6c6c6'),
			_Utils_ap(
				A4(
					generateStrokes,
					A3(angleList, -100, 5, 60),
					2,
					20,
					'#c6c6c6'),
				A4(
					generateStrokes,
					A3(angleList, 65, 5, 95),
					2,
					20,
					'#af1616')));
	});
var elm$core$Basics$abs = function (n) {
	return (n < 0) ? (-n) : n;
};
var elm$svg$Svg$svg = elm$svg$Svg$trustedNode('svg');
var author$project$Ui$Scenes$Playground$Speedometer$element = F3(
	function (currentSpeed, minSpeed, maxSpeed) {
		return A2(
			elm$svg$Svg$svg,
			_List_fromArray(
				[
					elm$svg$Svg$Attributes$width(
					elm$core$String$fromInt(author$project$Ui$Scenes$Playground$Speedometer$width)),
					elm$svg$Svg$Attributes$height(
					elm$core$String$fromInt(author$project$Ui$Scenes$Playground$Speedometer$height))
				]),
			_Utils_ap(
				_List_fromArray(
					[
						A2(
						elm$svg$Svg$circle,
						_List_fromArray(
							[
								elm$svg$Svg$Attributes$cx(
								elm$core$String$fromInt((author$project$Ui$Scenes$Playground$Speedometer$width / 2) | 0)),
								elm$svg$Svg$Attributes$cy(
								elm$core$String$fromInt((author$project$Ui$Scenes$Playground$Speedometer$height / 2) | 0)),
								elm$svg$Svg$Attributes$r(
								elm$core$String$fromInt((author$project$Ui$Scenes$Playground$Speedometer$width / 2) | 0)),
								elm$svg$Svg$Attributes$fill('#9e9e9e')
							]),
						_List_Nil),
						A2(
						elm$svg$Svg$circle,
						_List_fromArray(
							[
								elm$svg$Svg$Attributes$cx(
								elm$core$String$fromInt((author$project$Ui$Scenes$Playground$Speedometer$width / 2) | 0)),
								elm$svg$Svg$Attributes$cy(
								elm$core$String$fromInt((author$project$Ui$Scenes$Playground$Speedometer$height / 2) | 0)),
								elm$svg$Svg$Attributes$r(
								elm$core$String$fromInt(((author$project$Ui$Scenes$Playground$Speedometer$width / 2) | 0) - author$project$Ui$Scenes$Playground$Speedometer$outerBorderWidth)),
								elm$svg$Svg$Attributes$fill('#f2f2f2')
							]),
						_List_Nil),
						A2(
						elm$svg$Svg$text_,
						_List_fromArray(
							[
								elm$svg$Svg$Attributes$x('50%'),
								elm$svg$Svg$Attributes$y('85%'),
								elm$svg$Svg$Attributes$fontSize('22'),
								elm$svg$Svg$Attributes$fontFamily('Arial'),
								elm$svg$Svg$Attributes$textAnchor('middle')
							]),
						_List_fromArray(
							[
								elm$svg$Svg$text('km/h')
							])),
						A2(
						elm$svg$Svg$text_,
						_List_fromArray(
							[
								elm$svg$Svg$Attributes$x('50%'),
								elm$svg$Svg$Attributes$y('75%'),
								elm$svg$Svg$Attributes$fontSize('22'),
								elm$svg$Svg$Attributes$fontFamily('Arial'),
								elm$svg$Svg$Attributes$textAnchor('middle')
							]),
						_List_fromArray(
							[
								elm$svg$Svg$text(
								elm$core$String$fromInt(
									elm$core$Basics$abs(currentSpeed)))
							]))
					]),
				_Utils_ap(
					A2(author$project$Ui$Scenes$Playground$Speedometer$valueStrokes, minSpeed, maxSpeed),
					A5(
						author$project$Ui$Scenes$Playground$Speedometer$pin,
						elm$core$Basics$abs(currentSpeed),
						minSpeed,
						maxSpeed,
						-100,
						100))));
	});
var author$project$Ui$Scenes$Playground$Style$cockpitContainer = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'background-color', '#0b0c0c'),
		A2(elm$html$Html$Attributes$style, 'padding', '40px 0px 40px 0px'),
		A2(elm$html$Html$Attributes$style, 'display', 'flex'),
		A2(elm$html$Html$Attributes$style, 'flex', '1'),
		A2(elm$html$Html$Attributes$style, 'flex-direction', 'row'),
		A2(elm$html$Html$Attributes$style, 'align-items', 'stretch')
	]);
var author$project$Ui$Scenes$Playground$Style$flex1 = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'flex', '1'),
		A2(elm$html$Html$Attributes$style, 'display', 'flex')
	]);
var author$project$Ui$Scenes$Playground$Style$infoRow = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'color', '#fff'),
		A2(elm$html$Html$Attributes$style, 'font-family', 'Arial'),
		A2(elm$html$Html$Attributes$style, 'display', 'flex'),
		A2(elm$html$Html$Attributes$style, 'align-items', 'stretch'),
		A2(elm$html$Html$Attributes$style, 'justify-content', 'space-between'),
		A2(elm$html$Html$Attributes$style, 'background', '#28282b'),
		A2(elm$html$Html$Attributes$style, 'margin-top', '20px'),
		A2(elm$html$Html$Attributes$style, 'margin-left', '45px'),
		A2(elm$html$Html$Attributes$style, 'margin-right', '45px'),
		A2(elm$html$Html$Attributes$style, 'overflow', 'hidden')
	]);
var author$project$Ui$Scenes$Playground$Style$infoRowAntiSkewText = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'transform', 'skewX(-30deg)')
	]);
var author$project$Ui$Scenes$Playground$Style$infoRowSkew = _List_fromArray(
	[
		A2(elm$html$Html$Attributes$style, 'background-color', '#530DD4'),
		A2(elm$html$Html$Attributes$style, 'transform', 'skewX(30deg)'),
		A2(elm$html$Html$Attributes$style, 'margin-left', '-30px'),
		A2(elm$html$Html$Attributes$style, 'padding', '5px 20px 5px 50px')
	]);
var elm$core$List$append = F2(
	function (xs, ys) {
		if (!ys.b) {
			return xs;
		} else {
			return A3(elm$core$List$foldr, elm$core$List$cons, ys, xs);
		}
	});
var elm$core$List$concat = function (lists) {
	return A3(elm$core$List$foldr, elm$core$List$append, _List_Nil, lists);
};
var elm$core$List$concatMap = F2(
	function (f, list) {
		return elm$core$List$concat(
			A2(elm$core$List$map, f, list));
	});
var elm$core$List$head = function (list) {
	if (list.b) {
		var x = list.a;
		var xs = list.b;
		return elm$core$Maybe$Just(x);
	} else {
		return elm$core$Maybe$Nothing;
	}
};
var elm$svg$Svg$Attributes$viewBox = _VirtualDom_attribute('viewBox');
var author$project$Ui$Scenes$Playground$Cockpit$element = function (model) {
	var placement = F2(
		function (place, playerName) {
			return A2(
				elm$html$Html$div,
				author$project$Ui$Scenes$Playground$Style$infoRow,
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						author$project$Ui$Scenes$Playground$Style$infoRowSkew,
						_List_fromArray(
							[
								A2(
								elm$html$Html$div,
								author$project$Ui$Scenes$Playground$Style$infoRowAntiSkewText,
								_List_fromArray(
									[
										elm$html$Html$text(place)
									]))
							])),
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								A2(elm$html$Html$Attributes$style, 'align-self', 'center'),
								A2(elm$html$Html$Attributes$style, 'padding-right', '10px')
							]),
						_List_fromArray(
							[
								elm$html$Html$text(playerName)
							]))
					]));
		});
	var motion = A2(
		elm$core$Maybe$withDefault,
		{az: 0, aA: 0, aV: 0, cq: 0},
		model.k.S.aC);
	var speedometer = function () {
		var boolToString = function (b) {
			return b ? 'true' : 'false';
		};
		return A2(
			elm$html$Html$div,
			_Utils_ap(
				author$project$Ui$Scenes$Playground$Style$flex1,
				_List_fromArray(
					[
						A2(elm$html$Html$Attributes$style, 'justify-content', 'center'),
						A2(elm$html$Html$Attributes$style, 'border-right', '2px solid #3f3d3d')
					])),
			_List_fromArray(
				[
					A3(
					author$project$Ui$Scenes$Playground$Speedometer$element,
					elm$core$Basics$round(motion.aV),
					0,
					elm$core$Basics$round(motion.aA)),
					A2(
					elm$html$Html$input,
					_List_fromArray(
						[
							elm$html$Html$Attributes$type_('checkbox'),
							elm$html$Html$Attributes$value(
							boolToString(model.bk)),
							elm$html$Html$Events$onInput(
							function (x) {
								return author$project$Types$Playground(
									author$project$Types$ChangeColliderVisibility(model));
							})
						]),
					_List_Nil)
				]));
	}();
	var miniMap = function () {
		var currentLobby = A2(
			elm$core$Maybe$withDefault,
			{au: 'none', ay: 'none', bX: 0, aF: _List_Nil, ch: false, cw: 0},
			elm$core$List$head(
				A2(
					elm$core$List$filter,
					function (x) {
						return _Utils_eq(x.au, model.b0.ci);
					},
					A2(elm$core$List$cons, model.b7, model.b0.bV))));
		var currentPlayer = A2(
			elm$core$List$filter,
			function (player) {
				return A2(elm$core$List$member, player.au, currentLobby.aF);
			},
			model.aF);
		return A2(
			elm$svg$Svg$svg,
			_Utils_ap(
				author$project$Ui$Scenes$Playground$Style$flex1,
				_List_fromArray(
					[
						A2(elm$html$Html$Attributes$style, 'justify-content', 'center'),
						elm$svg$Svg$Attributes$viewBox(
						'0 0 ' + (elm$core$String$fromInt(model.ay.p.B * model.ay.p.cD) + (' ' + elm$core$String$fromInt(model.ay.p.B * model.ay.p.bC))))
					])),
			_Utils_ap(
				A5(
					author$project$Objects$Module$render.cb,
					_Utils_ap(
						model.ay.Q.cf,
						_Utils_ap(
							_List_fromArray(
								[model.k.S]),
							A2(
								elm$core$List$map,
								function (player) {
									return player.S;
								},
								currentPlayer))),
					model.k,
					author$project$Ui$Scenes$Playground$Cockpit$minimapMode,
					author$project$Ui$Scenes$Playground$Cockpit$showCollider,
					author$project$Ui$Scenes$Playground$Cockpit$showLabels),
				A2(
					elm$core$List$concatMap,
					function (x) {
						return A2(author$project$Objects$Module$render.b9, x, true);
					},
					currentPlayer)));
	}();
	var lapInfo = A2(
		elm$html$Html$div,
		author$project$Ui$Scenes$Playground$Style$infoRow,
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				author$project$Ui$Scenes$Playground$Style$infoRowSkew,
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						author$project$Ui$Scenes$Playground$Style$infoRowAntiSkewText,
						_List_fromArray(
							[
								elm$html$Html$text('Labs')
							]))
					])),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						A2(elm$html$Html$Attributes$style, 'align-self', 'center'),
						A2(elm$html$Html$Attributes$style, 'padding-right', '10px')
					]),
				_List_fromArray(
					[
						elm$html$Html$text(
						elm$core$String$fromInt(model.k.bj) + (' | ' + elm$core$String$fromInt(model.ay.b5.bR)))
					]))
			]));
	var getDriveTimeSeconds = (!model.k.aZ) ? 0 : ((model.k.aZ / 1000) | 0);
	var getDriveTimeMilliSeconds = function () {
		if (!model.k.aZ) {
			return '0';
		} else {
			var ms = elm$core$String$fromInt(
				elm$core$Basics$round((model.k.aZ - (getDriveTimeSeconds * 1000)) / 10));
			return (elm$core$String$length(ms) === 1) ? ('0' + ms) : ms;
		}
	}();
	var timeInfo = A2(
		elm$html$Html$div,
		author$project$Ui$Scenes$Playground$Style$infoRow,
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				author$project$Ui$Scenes$Playground$Style$infoRowSkew,
				_List_fromArray(
					[
						A2(
						elm$html$Html$div,
						author$project$Ui$Scenes$Playground$Style$infoRowAntiSkewText,
						_List_fromArray(
							[
								elm$html$Html$text('Time')
							]))
					])),
				A2(
				elm$html$Html$div,
				_List_fromArray(
					[
						A2(elm$html$Html$Attributes$style, 'align-self', 'center'),
						A2(elm$html$Html$Attributes$style, 'padding-right', '10px')
					]),
				_List_fromArray(
					[
						elm$html$Html$text(
						elm$core$String$fromInt(getDriveTimeSeconds) + (':' + getDriveTimeMilliSeconds))
					]))
			]));
	var gameInfo = A2(
		elm$html$Html$div,
		_Utils_ap(
			author$project$Ui$Scenes$Playground$Style$flex1,
			_List_fromArray(
				[
					A2(elm$html$Html$Attributes$style, 'flex-direction', 'column'),
					A2(elm$html$Html$Attributes$style, 'border-right', '2px solid #3f3d3d'),
					A2(elm$html$Html$Attributes$style, 'justify-content', 'flex-start'),
					A2(elm$html$Html$Attributes$style, 'align-items', 'stretch')
				])),
		_List_fromArray(
			[
				A2(
				elm$html$Html$img,
				_List_fromArray(
					[
						elm$html$Html$Attributes$src('assets/logo.png'),
						A2(elm$html$Html$Attributes$style, 'width', '261px'),
						A2(elm$html$Html$Attributes$style, 'height', '51px'),
						A2(elm$html$Html$Attributes$style, 'align-self', 'center')
					]),
				_List_Nil),
				A2(placement, '1', model.k.bN.ct),
				lapInfo,
				timeInfo
			]));
	return A2(
		elm$html$Html$div,
		author$project$Ui$Scenes$Playground$Style$cockpitContainer,
		_List_fromArray(
			[speedometer, gameInfo, miniMap]));
};
var author$project$Map$Generator$map = function (m) {
	return _Utils_ap(
		m.Q.ba,
		_Utils_ap(
			m.Q.cf,
			_Utils_ap(m.Q.bl, m.Q.cv)));
};
var author$project$Ui$Scenes$Playground$TrafficLight$height = 40;
var author$project$Ui$Scenes$Playground$TrafficLight$circle = F2(
	function (activated, iCx) {
		var color = activated ? '#db1f15' : '#3b3e44';
		return A2(
			elm$svg$Svg$circle,
			_List_fromArray(
				[
					elm$svg$Svg$Attributes$cy(
					elm$core$String$fromInt((author$project$Ui$Scenes$Playground$TrafficLight$height / 2) | 0)),
					elm$svg$Svg$Attributes$cx(iCx),
					elm$svg$Svg$Attributes$r(
					elm$core$String$fromInt((author$project$Ui$Scenes$Playground$TrafficLight$height / 3) | 0)),
					elm$svg$Svg$Attributes$fill(color)
				]),
			_List_Nil);
	});
var author$project$Ui$Scenes$Playground$TrafficLight$width = 150;
var elm$svg$Svg$Attributes$rx = _VirtualDom_attribute('rx');
var elm$svg$Svg$Attributes$ry = _VirtualDom_attribute('ry');
var author$project$Ui$Scenes$Playground$TrafficLight$element = F3(
	function (model, px, py) {
		var initialPrepareRaceTime = author$project$InitialModel$initialModel.ay.b5.cd;
		var currentPrepareRactime = model.ay.b5.cd;
		return (model.aW === 3) ? _List_fromArray(
			[
				A2(
				elm$svg$Svg$svg,
				_List_fromArray(
					[
						elm$svg$Svg$Attributes$width(
						elm$core$String$fromInt(author$project$Ui$Scenes$Playground$TrafficLight$width)),
						elm$svg$Svg$Attributes$height(
						elm$core$String$fromInt(author$project$Ui$Scenes$Playground$TrafficLight$height)),
						elm$svg$Svg$Attributes$x(
						elm$core$String$fromInt(px)),
						elm$svg$Svg$Attributes$y(
						elm$core$String$fromInt(py))
					]),
				_List_fromArray(
					[
						A2(
						elm$svg$Svg$rect,
						_List_fromArray(
							[
								elm$svg$Svg$Attributes$x('0'),
								elm$svg$Svg$Attributes$y('0'),
								elm$svg$Svg$Attributes$width(
								elm$core$String$fromInt(author$project$Ui$Scenes$Playground$TrafficLight$width)),
								elm$svg$Svg$Attributes$height(
								elm$core$String$fromInt(author$project$Ui$Scenes$Playground$TrafficLight$height)),
								elm$svg$Svg$Attributes$fill('#23262b'),
								elm$svg$Svg$Attributes$rx('15'),
								elm$svg$Svg$Attributes$ry('15')
							]),
						_List_Nil),
						A2(
						author$project$Ui$Scenes$Playground$TrafficLight$circle,
						((100 / initialPrepareRaceTime) * currentPrepareRactime) > 0,
						elm$core$String$fromInt(30)),
						A2(
						author$project$Ui$Scenes$Playground$TrafficLight$circle,
						((100 / initialPrepareRaceTime) * currentPrepareRactime) > 25,
						elm$core$String$fromInt(60)),
						A2(
						author$project$Ui$Scenes$Playground$TrafficLight$circle,
						((100 / initialPrepareRaceTime) * currentPrepareRactime) > 50,
						elm$core$String$fromInt(90)),
						A2(
						author$project$Ui$Scenes$Playground$TrafficLight$circle,
						((100 / initialPrepareRaceTime) * currentPrepareRactime) > 75,
						elm$core$String$fromInt(120))
					]))
			]) : _List_Nil;
	});
var author$project$Ui$Scenes$Playground$View$heightSvg = 500;
var author$project$Ui$Scenes$Playground$View$minimapMode = false;
var author$project$Ui$Scenes$Playground$View$showLabel = false;
var author$project$Ui$Scenes$Playground$View$widthSvg = 1000;
var author$project$Ui$Scenes$Playground$View$playground = function (model) {
	var currentLobby = A2(
		elm$core$Maybe$withDefault,
		{au: 'none', ay: 'none', bX: 0, aF: _List_Nil, ch: false, cw: 0},
		elm$core$List$head(
			A2(
				elm$core$List$filter,
				function (x) {
					return _Utils_eq(x.au, model.b0.ci);
				},
				A2(elm$core$List$cons, model.b7, model.b0.bV))));
	var _n0 = model.k.S.cc;
	if (!_n0.$) {
		var p = _n0.a;
		return A2(
			elm$svg$Svg$svg,
			_List_fromArray(
				[
					elm$svg$Svg$Attributes$width(
					elm$core$String$fromInt(author$project$Ui$Scenes$Playground$View$widthSvg) + 'px'),
					elm$svg$Svg$Attributes$height(
					elm$core$String$fromInt(author$project$Ui$Scenes$Playground$View$heightSvg) + 'px'),
					A2(elm$html$Html$Attributes$style, 'background', '#000'),
					A2(elm$html$Html$Attributes$style, 'border-radius', '10px'),
					elm$svg$Svg$Attributes$viewBox(
					elm$core$String$fromInt(
						p.a2 - elm$core$Basics$round((author$project$Ui$Scenes$Playground$View$widthSvg / 2) / model.ay.p.cA)) + (' ' + (elm$core$String$fromInt(
						p.a3 - elm$core$Basics$round((author$project$Ui$Scenes$Playground$View$heightSvg / 2) / model.ay.p.cA)) + (' ' + (elm$core$String$fromInt(
						elm$core$Basics$round(author$project$Ui$Scenes$Playground$View$widthSvg / model.ay.p.cA)) + (' ' + elm$core$String$fromInt(
						elm$core$Basics$round(author$project$Ui$Scenes$Playground$View$heightSvg / model.ay.p.cA))))))))
				]),
			_Utils_ap(
				A5(
					author$project$Objects$Module$render.cb,
					_Utils_ap(
						author$project$Map$Generator$map(model.ay),
						_Utils_ap(
							model.k.bd,
							_Utils_ap(
								A2(
									elm$core$List$map,
									function (x) {
										return x.S;
									},
									A2(
										elm$core$List$filter,
										function (player) {
											return A2(elm$core$List$member, player.au, currentLobby.aF);
										},
										model.aF)),
								_List_fromArray(
									[model.k.S])))),
					model.k,
					author$project$Ui$Scenes$Playground$View$minimapMode,
					model.bk,
					author$project$Ui$Scenes$Playground$View$showLabel),
				A3(author$project$Ui$Scenes$Playground$TrafficLight$element, model, ((author$project$Ui$Scenes$Playground$View$widthSvg / 2) | 0) - 100, 0)));
	} else {
		return A2(elm$html$Html$div, _List_Nil, _List_Nil);
	}
};
var author$project$Ui$Scenes$Playground$View$view = function (model) {
	return A2(
		elm$html$Html$div,
		author$project$Ui$Scenes$Style$globalContainer,
		_List_fromArray(
			[
				A2(
				elm$html$Html$div,
				_Utils_ap(
					author$project$Ui$Scenes$Playground$Style$flex1,
					_List_fromArray(
						[
							A2(elm$html$Html$Attributes$style, 'align-items', 'center'),
							A2(elm$html$Html$Attributes$style, 'justify-content', 'center')
						])),
				_List_fromArray(
					[
						A2(elm$html$Html$div, _List_Nil, _List_Nil),
						A2(
						elm$html$Html$div,
						_List_fromArray(
							[
								A2(elm$html$Html$Attributes$style, 'display', 'flex'),
								A2(elm$html$Html$Attributes$style, 'flex-direction', 'column'),
								A2(elm$html$Html$Attributes$style, 'border', '10px solid #0b0c0c'),
								A2(elm$html$Html$Attributes$style, 'border-radius', '20px'),
								A2(elm$html$Html$Attributes$style, 'background-color', '#0b0c0c')
							]),
						_List_fromArray(
							[
								author$project$Ui$Scenes$Playground$View$playground(model),
								author$project$Ui$Scenes$Playground$Cockpit$element(model)
							])),
						A2(elm$html$Html$div, _List_Nil, _List_Nil)
					]))
			]));
};
var author$project$Ui$Scenes$Playground$Module$view = author$project$Ui$Scenes$Playground$View$view;
var author$project$Main$view = function (model) {
	var _n0 = model.aW;
	switch (_n0) {
		case 2:
			return author$project$Ui$Scenes$Playground$Module$view(model);
		case 3:
			return author$project$Ui$Scenes$Playground$Module$view(model);
		case 0:
			return author$project$Ui$Scenes$MainMenu$View$view(model);
		default:
			return author$project$Ui$Scenes$FinishMenu$Module$view(model);
	}
};
var author$project$Network$PredefinedMessages$openJson = elm$core$String$trim('\n         {\n         "module": "WebSocket",\n         "tag": "open",\n         "args":{\n            "key": "elminator",\n            "url": ""\n            }\n          }\n        ');
var author$project$Network$Commands$open = author$project$Network$Commands$run(
	author$project$Types$Websocket(
		author$project$Types$Send(author$project$Network$PredefinedMessages$openJson)));
var author$project$Network$Module$open = author$project$Network$Commands$open;
var author$project$Types$PlayerUUID = 0;
var elm$browser$Browser$element = _Browser_element;
var author$project$Main$main = elm$browser$Browser$element(
	{
		bH: function (_n0) {
			return _Utils_Tuple2(
				author$project$InitialModel$initialModel,
				elm$core$Platform$Cmd$batch(
					_List_fromArray(
						[
							author$project$Network$Module$open,
							A2(
							elm$random$Random$generate,
							author$project$Types$SetUUID(1),
							TSFoster$elm_uuid$UUID$generator),
							A2(
							elm$random$Random$generate,
							author$project$Types$SetUUID(0),
							TSFoster$elm_uuid$UUID$generator)
						])));
		},
		cs: author$project$Main$subscriptions,
		cx: author$project$Main$update,
		cz: author$project$Main$view
	});
_Platform_export({'Main':{'init':author$project$Main$main(
	elm$json$Json$Decode$succeed(0))(0)}});}(this));