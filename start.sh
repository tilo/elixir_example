#!/bin/bash
mix deps.get
mix compile
mix phx.digest
MIX_ENV=prod mix compile.protocols
MIX_ENV=prod PORT=8080 elixir -pa _build/prod/consolidated -S mix phoenix.server
