if [ -z "$TMUX" ]; then
  command="new-session"
else
  command="new-window"
fi

# windows
# 1. test server 1
# 2. curl request
# 3. listener
# 4. replayer
# 5. test server 2
tmux $command \
  'go run examples/fake_server.go' \; split-window 'sleep 2 && ./examples/make_requests.sh && bash' \; \
   select-layout tiled \; \
  split-window 'sudo bin/gor --input-raw :8080 --output-tcp localhost:28020' \; split-window 'bin/gor --input-tcp localhost:28020 --output-http http://localhost:8081' \; \
   select-layout tiled \; \
   split-window 'go run examples/fake_server.go -port=8081'
