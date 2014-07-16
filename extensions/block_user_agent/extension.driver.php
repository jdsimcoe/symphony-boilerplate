<?php
	/*
	Copyight: Deux Huit 2012, 2014
	License: MIT, see the LICENCE file
	*/

	if(!defined("__IN_SYMPHONY__")) die("<h2>Error</h2><p>You cannot directly access this file</p>");

	/**
	 *
	 * Block user agent Decorator/Extension
	 * @author nicolasbrassard
	 *
	 */
	class extension_block_user_agent extends Extension {
		
		/**
		 * Name of the extension
		 * @var string
		 */
		const EXT_NAME = 'Block User Agent';
		
		const SETTING_GROUP = 'block-user-agent';

		/**
		 * private variable for holding the errors encountered when saving
		 * @var array
		 */
		protected $errors = array();

		/**
		 *
		 * Symphony utility function that permits to
		 * implement the Observer/Observable pattern.
		 * We register here delegate that will be fired by Symphony
		 */
		public function getSubscribedDelegates(){
			return array(
				array(
					'page'      => '/frontend/',
					'delegate'  => 'FrontendParamsPostResolve',
					'callback'  => 'frontendParamsPostResolve'
				),
				array(
					'page'		=> '/system/preferences/',
					'delegate'	=> 'AddCustomPreferenceFieldsets',
					'callback'	=> 'addCustomPreferenceFieldsets'
				),
				array(
					'page'      => '/system/preferences/',
					'delegate'  => 'Save',
					'callback'  => 'save'
				)	
			);
		}
		
		public static function getRegEx() {
			return Symphony::Configuration()->get('regex', self::SETTING_GROUP);
		}
		
		public static function isBlocked() {
			$regex = self::getRegEx();
			$val = 0;
			if (!empty($regex)) {
				try {
					$val = preg_match($regex, $_SERVER['HTTP_USER_AGENT']);
				} catch (Exception $e) {
					$val = $e->getMessage();
				}
			}
			return $val;
		}
		
		public function frontendParamsPostResolve($params) {
			$blocked = self::isBlocked();
			$params['params']['block-user-agent'] = ($blocked === 1 ? 'Yes' : ($blocked === 0 ? 'No' : $blocked));
			$params['params']['block-user-agent-regex'] = self::getRegEx();
		} 
		
		
		/**
		 *
		 * Delegate fired when the extension is install
		 */
		public function install() {
			Symphony::Configuration()->set('regex', '', self::SETTING_GROUP);
			Administration::Configuration()->write();
		}
		
		/**
		 *
		 * Delegate fired when the extension is updated (when version changes)
		 * @param string $previousVersion
		 */
		public function update($previousVersion) {
			
		}

		/**
		 *
		 * Delegate fired when the extension is uninstall
		 * Cleans settings and Database
		 */
		public function uninstall() {
			Symphony::Configuration()->remove(self::SETTING_GROUP);
			Administration::instance()->saveConfig();
		}

		/**
		 * Delegate handle that adds Custom Preference Fieldsets
		 * @param string $page
		 * @param array $context
		 */
		public function addCustomPreferenceFieldsets($context) {
			// creates the field set
			$fieldset = new XMLElement('fieldset');
			$fieldset->setAttribute('class', 'settings');
			$fieldset->appendChild(new XMLElement('legend', self::EXT_NAME));

			// create a paragraph for short intructions
			$p = new XMLElement('p', __('Define here when and how IP are blocked'), array('class' => 'help'));

			// append intro paragraph
			$fieldset->appendChild($p);

			// outter wrapper
			$out_wrapper = new XMLElement('div');

			// create a wrapper
			//$wrapper = new XMLElement('div');
			//$wrapper->setAttribute('class', 'group');
			
			// create the label and the input field
			$label = Widget::Label();
			$input = Widget::Input(
					'settings[' . self::SETTING_GROUP . '][regex]',
					self::getRegEx(),
					'text'
			);
			
			// set the input into the label
			$label->setValue(__('Specify here the regex to test against UA'). ' ' . $input->generate() . $err);

			//$wrapper->appendChild($label);
			$out_wrapper->appendChild($label);
			
			// wrapper into fieldset
			$fieldset->appendChild($out_wrapper);
			
			// adds the field set to the wrapper
			$context['wrapper']->appendChild($fieldset);
		}

		/**
		 * Delegate handle that saves the preferences
		 * Saves settings and cleans the database acconding to the new settings
		 * @param array $context
		 */
		public function save(&$context) {
			
		}
	}