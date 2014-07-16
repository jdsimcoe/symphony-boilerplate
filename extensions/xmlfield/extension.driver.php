<?php

class extension_XMLField extends Extension
{

    public function getSubscribedDelegates()
    {
        return array(
            array(
                'page' => '/backend/',
                'delegate' => 'InitaliseAdminPageHead',
                'callback' => 'initaliseAdminPageHead'
            )
        );
    }

    public function initaliseAdminPageHead($context)
    {
        $callback = Symphony::Engine()->getPageCallback();

        if($callback['driver'] == 'publish' && $callback['context']['page'] != 'index') {
            Administration::instance()->Page->addStylesheetToHead(URL . '/extensions/xmlfield/assets/publish.xmlfield.css');
        }
    }

    public function install()
    {
        return Symphony::Database()->query(
            "CREATE TABLE IF NOT EXISTS `tbl_fields_xml` (
                `id` int(11) unsigned NOT NULL auto_increment,
                `field_id` int(11) unsigned NOT NULL,
                `size` int(3) unsigned NOT NULL,
                PRIMARY KEY  (`id`),
                KEY `field_id` (`field_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;"
        );
    }

    public function uninstall()
    {
        Symphony::Database()->query("DROP TABLE `tbl_fields_xml`");
    }
}
