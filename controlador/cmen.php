<?php
	require_once('modelo/conexion.php');
	require_once('modelo/mmen.php');

	$mmen = new mmen();
	$pagmen = isset($_POST['pagmen']) ? $_POST['pagmen']:NULL;

	function mosmen($pagmen, $pefid){
		$mmen=new mmen();
		$result = $mmen->selmen($pagmen, $pefid);
		$pm = strtolower($pagmen);

		if ($result){
			$txt = '<div class="container">';
				$txt .= '<ul id="gn-menu" class="gn-menu-main">';
					$txt .= '<li class="gn-trigger">';
						$txt .= '<a class="gn-icon gn-icon-menu"><span>Menu</span></a>';
						$txt .= '<nav class="gn-menu-wrapper">';
						$txt .= '<div class="gn-scroller">';
						$txt .= '<ul class="gn-menu">';
							foreach ($result as $f){
								$txt .= "<li ";
								if($f['pagarc']=="#Espacio")
								    $txt .= "style='background-color: #34bb3b;'";
								$txt .= ">";
								if($f['pagarc']=="#Espacio"){
									$txt .= "&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;&nbsp;&nbsp;
									&nbsp;&nbsp;
									<small><strong><u>";
									$txt .= strtoupper($f['pagnom'])."</u></strong></small>";
								}else{
									$txt .= "<a  href='".$pm.".php?pg=".$f['pagid']."' class='btnm'><small>".strtoupper($f['pagnom'])."</small></a>";
								}
								$txt .= "</li>";
							}
						$txt .= '</ul>';
						$txt .= '</div><!-- /gn-scroller -->';
						$txt .= '</nav>';
					$txt .= '</li>';
				$txt .= '</ul>';
			$txt .= '</div>';
			echo $txt;
		}
		/*if ($result){
			$txt = '<center>';
			$txt .= '<nav class="navbar navbar-default">';
			  $txt .= '<div class="container-fluidyy">';
			    $txt .= '<div class="navbar-header">';
			      $txt .= '<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">';
			        $txt .= '<span class="sr-only"></span>';
			        $txt .= '<span class="icon-bar"></span>';
			        $txt .= '<span class="icon-bar"></span>';
			        $txt .= '<span class="icon-bar"></span>';
			      $txt .= '</button>';
			    $txt .= '</div>';

			    $txt .= '<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">';

				$txt .= '<ul class="nav navbar-nav">';
				$txt .= '<ul class="nav nav-pills nav-stacked">';
				foreach ($result as $f){
					$txt .= "<li>";
					$txt .= "<a href='".$pm.".php?pg=".$f['pagid']."' class='btnm'>".strtoupper($f['pagnom'])."</a>";
					$txt .= "</li>";
				}
				$txt .= "</ul>";
				$txt .= "</ul>";
			$txt .= '</div>';
			$txt .= '</div>';
			$txt .= '</nav>';
			$txt .= '</center>';
			echo $txt;
		}*/
	}

	function moscon($pefid, $pg){
		$mmen=new mmen();

		if($pefid==1){
			if(!$pg) $pg=505;
		}else if($pefid==2 OR $pefid==7){
			if(!$pg) $pg=511;
		}else if($pefid==3 OR $pefid==5){
			if(!$pg) $pg=509;
		}else if($pefid==4){
			if(!$pg) $pg=507;
		}else{
			if(!$pg) $pg=500;
		}
		$result = $mmen->selpgact($pg, $pefid);

		if ($result){
			foreach ($result as $f){
				require_once($f['pagarc']);
			}
		}else{
			echo "<br><br><br><br><br><span class='txtbold'>&nbsp;&nbsp;&nbsp;&nbsp;Usted no tiene permisos para ingresar a este formulario. Por favor comuniquese con su administrador.</span><br><br><br><br><br><br>";
		}
	}

	function mosini($pg){
		$mmen=new mmen();
		
		if(!$pg) $pg=201;

		$result = $mmen->selpgini($pg);

		if ($result){
			foreach ($result as $f){
				require_once($f['pagarc']);
			}
		}else{
			echo "<br><br><br><br><br><span class='txtbold'>&nbsp;&nbsp;&nbsp;&nbsp;Usted no tiene permisos para ingresar a este formulario. Por favor comuniquese con su administrador.</span><br><br><br><br><br><br>";
		}
	}
?>