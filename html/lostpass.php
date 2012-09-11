<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>SIGA - Sistema Integrado de Gest&atilde;o Acad&ecirc;mica</title>
</head>
<frameset rows="*,0" border=0 frameBorder=no frameSpacing=0>
<?php
$item = $_REQUEST['item'];
$link = "index.php/common/lostpass?item=" . $item;
?>
	<frame name="content" src="<?php echo $link ?>" frameBorder=no
		frameSpacing=0 marginHeight=0 marginWidth=0 noresize>
</frameset>
</html>
