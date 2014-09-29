port = 8080

worker_processes 1
timeout 300
#listen(port)
#puts "Startup... Listen for #{port}"

workdir = Dir::pwd
FileUtils.mkdir_p(workdir + "/tmp")
#tmpdir = workdir + "/tmp"
tmpdir = "/tmp/"

#pidfile = workdir + "/tmp/unicorn.pid"
#sockfile = workdir + "/tmp/unicorn.sock"
pidfile =  tmpdir + "myun2.shibuya.unicorn.pid"
sockfile = tmpdir + "myun2.shibuya.unicorn.sock"
pid(pidfile)
listen(sockfile)

# Logging directory
logdir = workdir + "/log"
FileUtils.mkdir_p(logdir)
stderr_path(logdir + "unicorn.stderr.log")
stdout_path(logdir + "unicorn.stdout.log")

puts "Startup... listen by \`#{sockfile}\`."
puts "PID file for \`#{pidfile}\`."
