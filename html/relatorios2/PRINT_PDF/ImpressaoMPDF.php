<?php

define('MPDF_PATH', 'MPDF53/');
require_once(MPDF_PATH.'mpdf.php');

//ini_set('display_errors', 1);

/**
 * Impressao
 *
 * PHP 5
 *
 * Classe de configurações básicas para a biblioteca MPDF
 *
 * @author		Daniel bonfim <daniel.bonfim@ifbaiano.edu.br>
 * @version 0.1
 */

class ImpressaoMPDF {   
    
    private $html;
    private $footerName;
    private $stylesheetAddress;
    private $archiveName;
    private $header;
    
    public function __construct($html = null, $footerName = null, $stylesheetAddress = null, $archiveName = null, $header = null) {
        $this->html = $html;
        $this->footerName = $footerName;
        $this->stylesheetAddress = $stylesheetAddress;
        $this->archiveName = $archiveName;
        $this->header = $header;
    }
    
    public function setHtml($html) {
        $this->html = $html;
    }
    
    public function getHtml() {
        return $this->html;
    }
    
    public function setFooterName($footerName) {
        $this->footerName = $footerName;
    }
    
    public function setHeader($header) {
        $this->header = $header;
    }
    
    public function getHeader() {
        return $this->header;
    }
    
    public function getFooterName() {
        return $this->footerName;
    }
    
    public function setStyleSheetAddress($stylesheetAddress) {
        $this->stylesheetAddress = $stylesheetAddress;
    }
    
    public function getStyleSheetAddress() {
        return $this->stylesheetAddress;
    }
    
    public function setArchiveName($archiveName) {
        $this->archiveName = $archiveName;
    }
    
    public function getArchiveName() {
        return $this->archiveName;
    }
    
    public function gerarPDF($tipo) {
        
        if($tipo == "DEFAULT") {
            $mpdf=new mPDF();
            
        } else if($tipo == "CUSTOM"){
            $mpdf=new mPDF('pt','A4',3,'',8,8,5,14,9,9,'P');
            
        } else {
            throw new Exception("Tipo não reconhecido");
        }
        
        $mpdf->allow_charset_conversion=true;
        $mpdf->charset_in='UTF-8';
        //$mpdf->SetDisplayMode('fullpage');
        $mpdf->SetFooter("{DATE j/m/Y H:i}|{PAGENO}/{nb}|".$this->getFooterName());
        $mpdf->SetHeader($this->getHeader());
        
        $stylesheet = file_get_contents($this->getStyleSheetAddress());

        $mpdf->WriteHTML($stylesheet,1);    
        
        $mpdf->WriteHTML($this->getHtml(),2);

        $arquivo = $this->getArchiveName().".pdf";
        
        $mpdf->Output($arquivo,'D');        
        
    }
    
    
    
}