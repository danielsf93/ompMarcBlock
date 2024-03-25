<?php

/**
 * @file plugins/blocks/ompMarcBlock/ompMarcBlock.inc.php

 */



import('lib.pkp.classes.plugins.BlockPlugin');

class ompMarcBlock extends BlockPlugin {

	/**
	 * Install default settings on system install.
	 * @return string
	 */
	function getInstallSitePluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}

	/**
	 * Install default settings on press creation.
	 * @return string
	 */
	function getContextSpecificPluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}

	/**
	 * Get the display name of this plugin.
	 * @return String
	 */
	function getDisplayName() {
		return __('ompMarcBlock');
	}

	/**
	 * Get a description of the plugin.
	 */
	function getDescription() {
		return __('ompMarcBlock');
	}

	public function getContents($templateMgr, $request = null)
    {

		
		// Chama a função para obter o número de revistas.
        $filomena = 'Info por templateMgr';
      
        $templateMgr->assign([
        
        'filomena' =>$filomena,
    ]);
    
    return parent::getContents($templateMgr, $request);
    }
}
