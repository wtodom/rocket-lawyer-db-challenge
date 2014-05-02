use qanda;

CREATE TABLE if not exists Aborts (
	id integer(11) NOT NULL auto_increment PRIMARY KEY,
	accessed_at datetime NOT NULL,
	aborted_clients integer(11) NOT NULL UNIQUE,
	aborted_connects integer(11) NOT NULL
) ENGINE = INNODB ;

CREATE TABLE if not exists InnoDBInfo (
	id integer(11) NOT NULL auto_increment PRIMARY KEY,
	buffer_pool_dump_status varchar(50) NOT NULL,
	buffer_pool_load_status varchar(50) NOT NULL,
	buffer_pool_pages_data integer(11) NOT NULL,
	buffer_pool_bytes_data integer(11) NOT NULL,
	buffer_pool_pages_dirty integer(11) NOT NULL,
	buffer_pool_bytes_dirty integer(11) NOT NULL,
	buffer_pool_pages_flushed integer(11) NOT NULL,
	buffer_pool_pages_free integer(11) NOT NULL,
	buffer_pool_pages_misc integer(11) NOT NULL,
	buffer_pool_pages_total integer(11) NOT NULL,
	buffer_pool_read_ahead_rnd integer(11) NOT NULL,
	buffer_pool_read_ahead integer(11) NOT NULL,
	buffer_pool_read_ahead_evicted integer(11) NOT NULL,
	buffer_pool_read_requests integer(11) NOT NULL,
	buffer_pool_reads integer(11) NOT NULL,
	buffer_pool_wait_free integer(11) NOT NULL,
	buffer_pool_write_requests integer(11) NOT NULL,
	data_fsyncs integer(11) NOT NULL,
	data_pending_fsyncs integer(11) NOT NULL,
	data_pending_reads integer(11) NOT NULL,
	data_pending_writes integer(11) NOT NULL,
	data_read integer(11) NOT NULL,
	data_reads integer(11) NOT NULL,
	data_writes integer(11) NOT NULL,
	data_written integer(11) NOT NULL,
	dblwr_pages_written integer(11) NOT NULL,
	dblwr_writes integer(11) NOT NULL,
	have_atomic_builtins varchar(10) NOT NULL,
	log_waits integer(11) NOT NULL,
	log_write_requests integer(11) NOT NULL,
	log_writes integer(11) NOT NULL,
	os_log_fsyncs integer(11) NOT NULL,
	os_log_pending_fsyncs integer(11) NOT NULL,
	os_log_pending_writes integer(11) NOT NULL,
	os_log_written integer(11) NOT NULL,
	page_size integer(11) NOT NULL,
	pages_created integer(11) NOT NULL,
	pages_read integer(11) NOT NULL,
	pages_written integer(11) NOT NULL,
	row_lock_current_waits integer(11) NOT NULL,
	row_lock_time integer(11) NOT NULL,
	row_lock_time_avg integer(11) NOT NULL,
	row_lock_time_max integer(11) NOT NULL,
	row_lock_waits integer(11) NOT NULL,
	rows_deleted integer(11) NOT NULL,
	rows_inserted integer(11) NOT NULL,
	rows_read integer(11) NOT NULL,
	rows_updated integer(11) NOT NULL,
	num_open_files integer(11) NOT NULL,
	truncated_status_writes integer(11) NOT NULL,
	available_undo_logs integer(11) NOT NULL
) ENGINE = INNODB ;