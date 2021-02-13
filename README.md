# vim-cursorholdmark

Set mark when you stop typing.
You can return where you were just before.

Default behavior: The cursor position is marked `a` 4 seconds after the last key stroke, and you can return there by `` `a``.


## Requirements

TBW


## Installation

Use your favorite plugin manager.

For exapmle with dein.vim,
```
[[plugins]]
repo = 'KosukeMizuno/vim-cursorholdmark'
```


## Options

Available options and their defaults are followings.

### g:cursorholdmark_mark

Your favorite marker.
```
let g:cursorholdmark_mark = 'a'
```

### g:cursorholdmark_time

Waiting time in millisecond.
```
let g:cursorholdmark_time = 4000
```


## Event

`CursorHoldMarked` event will be emitted after marking.


## License

This plugin is licensed MIT, see [LICENSE](LICENSE).

