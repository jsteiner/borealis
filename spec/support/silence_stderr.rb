def silence_stderr
  stderr = STDERR
  STDERR.reopen '/dev/null'
  STDERR.sync = true
  yield
ensure
  STDERR.reopen stderr
end
