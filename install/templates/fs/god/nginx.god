# run with:  god -c /etc/god/nginx.god
#

God.watch do |w|
  w.name = "nginx"
  w.group = "mailserv"
  w.interval = 30.seconds # default      
  w.start = "/usr/sbin/rcctl start nginx"
  w.stop = "/usr/sbin/rcctl stop nginx"
  w.restart = "/usr/sbin/rcctl reload nginx"
  w.start_grace = 10.seconds
  w.restart_grace = 15.seconds
  w.pid_file = "/var/run/nginx.pid"

  w.behavior(:clean_pid_file)

  w.start_if do |start|
    start.condition(:process_running) do |c|
      c.interval = 5.seconds
      c.running = false
    end
  end

end


