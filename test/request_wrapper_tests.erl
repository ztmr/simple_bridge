-module (request_wrapper_tests).

-include_lib ("eunit/include/eunit.hrl").

parse_deep_post_params_test_ () ->
    DummyReq = simple_bridge_request_wrapper:new ([], [], [], [], [], []),
    Data = [
            {"x", "whatever", [{"x", "whatever"}]},
            {"x[id]", "whatever", [{"x", [{"id", "whatever"}]}]},
            {"x[id][3]", "whatever", [{"x", [{"id", [{"3", "whatever"}]}]}]},
            {"x[i d][3]", "whatever", [{"x", [{"id", [{"3", "whatever"}]}]}]}
           ],
    [ ?assertEqual (Expect, DummyReq:parse_deep_post_params ([{K, V}], []))
      || {K, V, Expect} <- Data ],
    ok.

