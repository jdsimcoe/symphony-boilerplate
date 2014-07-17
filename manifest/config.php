<?php
	$settings = array(


		###### ADMIN ######
		'admin' => array(
			'max_upload_size' => '5242880',
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'admin-path' => 'admin',
			'pagination_maximum_rows' => '20',
			'association_maximum_rows' => '5',
			'lang' => 'en',
			'pages_table_nest_children' => 'no',
			'version' => '2.5.0beta1',
			'cookie_prefix' => 'sym-',
			'session_gc_divisor' => '10',
			'cell_truncation_length' => '75',
			'enable_xsrf' => 'yes',
			'token_lifetime' => '15 minutes',
			'invalidate_tokens_on_request' => null,
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
		),
		########


		###### DATABASE ######
		'database' => array(
			'host' => 'localhost',
			'port' => '3306',
			'user' => 'root',
			'password' => 'Simkiss77',
			'db' => 'symphony',
			'tbl_prefix' => 'sym_',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'no',
		),
		########


		###### GENERAL ######
		'general' => array(
			'sitename' => 'Symphony Boilerplate',
			'useragent' => 'Symphony/2.5.0beta1',
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0644',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0755',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'g:i a',
			'date_format' => 'm/d/Y',
			'datetime_separator' => ' ',
			'timezone' => 'America/Los_Angeles',
		),
		########


		###### CACHE_DRIVER ######
		'cache_driver' => array(
			'default' => 'database',
		),
		########


		###### IMAGE ######
		'image' => array(
			'cache' => '1',
			'quality' => '90',
		),
		########


		###### MAINTENANCE_MODE ######
		'maintenance_mode' => array(
			'enabled' => 'no',
		),
		########


		###### BLOCK-USER-AGENT ######
		'block-user-agent' => array(
			'regex' => null,
		),
		########


		###### CACHELITE ######
		'cachelite' => array(
			'lifetime' => '86400',
			'show-comments' => 'no',
			'backend-delegates' => 'no',
		),
		########


		###### CONTENT-TYPE-MAPPINGS ######
		'content-type-mappings' => array(
			'xml' => 'text/xml; charset=utf-8',
			'text' => 'text/plain; charset=utf-8',
			'css' => 'text/css; charset=utf-8',
			'json' => 'application/json; charset=utf-8',
		),
		########


		###### DATETIME ######
		'datetime' => array(
			'english' => 'en, en_GB.UTF8, en_GB',
		),
		########


		###### SITEMAP_XML ######
		'sitemap_xml' => array(
			'index_type' => 'index',
			'global' => 'sitemap',
			'changefreq' => 'monthly',
		),
		########


		###### SORTING ######
		'sorting' => array(
			'section_structure_sortby' => '9',
			'data_sources_index_sortby' => 'author',
			'data_sources_index_order' => 'asc',
		),
		########
	);
