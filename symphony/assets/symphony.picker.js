/**
 * Symphony Picker
 *
 * This plugin shows and hides elements based on the value of a select box. 
 * If only there is only one option, the select box will be hidden and 
 * the single element will be shown.
 */

jQuery.fn.symphonyPicker = function(custom_settings) {

	// Settings
	var settings = {
		selectables: '.selectable',
		handle: 'selectable'
	};
	jQuery.extend(settings, custom_settings);

	// Elements
	var pickers = jQuery(this);
	var selectables = jQuery(settings.selectables);
	
	// Process pickers
	return pickers.each(function() {
		var picker = jQuery(this);
		var select = picker.find('select');
		var options = select.find('option');

		// Multiple items
		if(options.size() > 1) {
			options.each(function() {
				selectables.filter('#' + jQuery(this).val()).hide();
			});
			select.click(function() {
				selectables.hide().filter('#' + jQuery(this).val()).show();
			}).click();
		}
		
		// Single item
		else {
			picker.hide();
			selectables.filter('#' + select.val()).removeClass(settings.handle);
		}
	});
}