llog
=====

A wrapper for lager.

Configuration
-------------

Add `llog` to the dependencies in your `rebar.config`.

```erlang
    {deps, [% {...},
            {llog, {git, "git://github.com/dendrown/llog.git", {tag, "v0.1.4"}}}
    ]}.

```

Launching
---------

Call `llog:start/0` as part of your application startup:

```erlang
-module(vogon_app).
-behaviour(application).

-export([start/2, stop/1]).

-include_lib("llog/include/llog.hrl").

start(_StartType, _StartArgs) -> 
    % Start the lager logger
    llog:start(),
    ?notice("Let's read ~B lines of poetry... ", [42]),

    % Continue application startup
    vogon_sup:start_link().


stop(_State) -> 
    ok.
```

This library simply is simply a thin layer around lager which you may find to your liking. Set up your application's configuration as you normally would for [lager](https://github.com/erlang-lager/lager/blob/master/README.md).
