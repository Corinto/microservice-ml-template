errorlog = '-'
loglevel = 'info'
accesslog = None
access_log_format = '%(h)s %(l)s %(u)s %(t)s "%(r)s" %(s)s %(b)s "%(f)s" "%(a)s"'

bind = '0.0.0.0:8080'  # needs to be 8080 to run in Cloud Run

timeout = 3000