%%%-------------------------------------------------------------------
%%
%%  ⡎⢱ ⢎⡑ ⢹⠁ ⣏⡱ ⡇ ⡎⠑ ⣇⣸   ⡇ ⡏⢱ ⣏⡉ ⣎⣱ ⢎⡑
%%  ⠣⠜ ⠢⠜ ⠸  ⠇⠱ ⠇ ⠣⠔ ⠇⠸   ⠇ ⠧⠜ ⠧⠤ ⠇⠸ ⠢⠜
%%
%% @doc A Lager Logger
%%
%%      REF: https://github.com/basho/lager
%%
%% @copyright 2018-2020 Dennis Drown and Ostrich Ideas
%% @end
%%%-------------------------------------------------------------------
-module(llog).

%% Application callbacks
-export([start/0,
         log/3,
         log/4]).


%%====================================================================
%% API
%%--------------------------------------------------------------------
-spec start() -> ok
               | {error, term()}.
%
% @doc  Quick-start for an application's logging needs.
% @end  --
start() ->
    lager:start().


%%--------------------------------------------------------------------
-spec log(Level  :: atom(),
          Entity :: term(),
          Fmt    :: string()) -> ok
                               | {error, lager_not_running}.
%%
% @doc  Handles log messages through `lager'.
% @end  --
log(Level, Entity, Fmt) ->
    log(Level, Entity, Fmt, []).


%%--------------------------------------------------------------------
-spec log(Level  :: atom(),
          Entity :: string() | atom(),
          Fmt    :: string(),
          Args   :: list()) -> ok
                             | {error, lager_not_running}.
%%
% @doc  Handles log messages through `lager'.
% @end  --
log(Level, RegName, Fmt, Args) ->
    lager:log(Level, self(), "<~s> " ++ Fmt, [RegName | Args]).


%%====================================================================
%% Internal functions
%%====================================================================
