worker_processes 1
timeout 300
listen 8080

workdir = Dir::pwd
FileUtils.mkdir_p(workdir + "/tmp")
FileUtils.mkdir_p(workdir + "/log")

pid workdir + "/tmp/unicorn.pid"
stderr_path workdir + "/log/unicorn.stderr.log"
stdout_path workdir + "/log/unicorn.stdout.log"
