<?php
// barra de navegação
$navbar->AddOption('Processos', 'protocolo', 'main:processos:find');

// se ação
$action = $context->ShiftAction();
switch ($action) {
	// find
	case 'find':
		$MIOLO->InvokeHandler($module, 'processos/find');
		break;
	// new
	case 'new':
		$MIOLO->InvokeHandler($module, 'processos/new');
		break;
	// novo
	case 'nova':
		$MIOLO->InvokeHandler($module, 'processos/nova');
		break;
	// processo vago
	case 'vagos':
		$MIOLO->InvokeHandler($module, 'processos/vagos');
		break;
	case 'vago':
		$MIOLO->InvokeHandler($module, 'processos/vago');
		break;
	case 'findAdvanced':
		$MIOLO->InvokeHandler($module, 'processos/findAdvanced');
		break;            
	//	daniel
	case 'irpf';
		$MIOLO->InvokeHandler($module, 'processos/irpf');
		break;
            
        case 'usuariosBySetor':
                $MIOLO->InvokeHandler($module, 'processos/usuariosBySetor');
                break;
            
        case 'versaosistemas':
                $MIOLO->InvokeHandler($module, 'processos/versaosistemas');
                break;
            
        case 'processosBySetor':
                $MIOLO->InvokeHandler($module, 'processos/processosBySetor');
                break;
            // 25-10-2011 - Daniel Bonfim
        case 'pendentes':
            $MIOLO->InvokeHandler($module, 'processos/pendentes');
            break;            
	// desconhecida
	default:
		$MIOLO->InvokeHandler($module, 'processos/main');
}
?>