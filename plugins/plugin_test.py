global _log

def on_init(slave, log):
	global _log
	_log = log
	_log.debug("plugin_test:init")

def on_config_db(_models):
	_log.debug("plugin_test:config_db {}".format(_models))

def on_config_code(data):
	_log.debug("plugin_test:config_code {}".format(data))

def on_config_images(image_man):
	_log.debug("plugin_test:config_images {}".format(image_man))

	def on_job_received(job_obj, data):
	_log.debug("plugin_test:job_received {}".format(data))

def on_job_started(data, handler):
	_log.debug("plugin_test:job_started {}".format(data))

def on_job_progress(data):
	_log.debug("plugin_test:job_progress {}".format(data))

def on_job_error(data):
	_log.debug("plugin_test:job_error {}".format(data))

def on_job_finished(data):
	_log.debug("plugin_test:job_finished {}".format(data))

