-module(my_tests).

-include_lib("eunit/include/eunit.hrl").
-include("eredis.hrl").

-import(eredis, [create_multibulk/1]).

connect_test() ->
%%  , 4970, "test001#Abc12345!"
  Res = eredis:start_link( "132.122.232.179" ,7352,4970,"test001#Abc12345!"),

%%  Res = eredis:start_link( "132.122.232.234" ,6379,0,"he_test"),
  ?assertMatch({ok, _}, Res),
  {ok, C} = Res,

%%  ?assertMatch({ok, <<"OK">>}, eredis:q(C, ["AUTH", "he_test"])),
%%  ?assertMatch({ok, <<"OK">>}, eredis:q(C, ["SELECT", 0])),

  ?assertMatch({ok, _}, eredis:q(C, ["DEL", "foo2"])),

  ?assertEqual({ok, undefined}, eredis:q(C, ["GET", "foo2"])),
  ?assertEqual({ok, <<"OK">>}, eredis:q(C, ["SET", "foo2", "hefeng"])),
  ?assertEqual({ok, <<"hefeng">>}, eredis:q(C, ["GET", "foo2"])).